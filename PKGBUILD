# Maintainer: Steven De Bondt <egnappah at gmail dot com>

pkgbase=linux-slim
_srcname=linux
gitver=v5.10.1
pkgver=5.10.v.1
pkgrel=2
arch=('x86_64')
url="http://www.kernel.org/"
license=('GPL2')
makedepends=('xmlto' 'docbook-xsl' 'kmod' 'inetutils' 'bc' 'git' 'libelf' 'lzop')
options=('!strip')

source=("git+https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git#tag=$gitver"
        # the main kernel config files
        'config.x86_64'
        # standard config files for mkinitcpio ramdisk
        "${pkgbase}.preset"
	# linux package install directives for pacman
	'linux.install'
	# patch from our gentoo overlords
	'5013_enable-cpu-optimizations-for-gcc10.patch'
)
sha256sums=('SKIP'
            #config.x86_64
            'a57b25fb9e066b8f7086de9d6f70e2122ef9735cb67dee49c3fb79fe6d870f22'
            #.preset file
            'e60d58e60c809d5bd6bc2c258bce0e811a818b6a4b9ccb928902e519e90ab6d5'
            #linux install file
            'd590e751ab4cf424b78fd0d57e53d187f07401a68c8b468d17a5f39a337dacf0'
            #gentoopatch file
            '126cd35b1153b69dd8d713f902d09ecc64ce8af2e4fa6f021219a65e62e13875'
           )

_kernelname=${pkgbase#linux}

pkgver() {
  echo $pkgver
}

prepare() {
  cd "${_srcname}"
  #Inject testingbranch tag
  sed -i 's/CONFIG\_LOCALVERSION\=\"\"/CONFIG_LOCALVERSION\=\"_TestingBranch\"/g' "${srcdir}/config.x86_64"

  if [ "${CARCH}" = "x86_64" ]; then
    cat "${srcdir}/config.x86_64" > ./.config
  else
    echo "Sorry, non x86_64 arch not supported."
      exit 2
  fi

  # don't run depmod on 'make install'. We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh

  # Implement all packaged patches, report errors but advance anyway.
  msg2 "Implementing custom kernel patches"
  while read patch; do
   echo "Applying $patch"
   git apply $patch || echo "ERROR: something went wrong with $patch. Advancing anyway."
  done <<< $(ls ../*.patch)


  # get kernel version
  msg2 "Preparing kernel"
  yes "" | make prepare

  # load configuration
  msg2 "Preparing config"
  make olddefconfig # old config from previous kernel, defaults for new options
}

build() {
  cd "${_srcname}"

  make ${MAKEFLAGS} LOCALVERSION= bzImage modules
}

_package() {
  pkgdesc="Linux kernel slimmed down to only work on AMD hardware. Zero compatibility."
  depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7' 'lzop')
  optdepends=('crda: to set the correct wireless channels of your country')
  provides=('linux')
  backup=("etc/mkinitcpio.d/${pkgbase}.preset")
  install=linux.install

  cd "${_srcname}"

  KARCH=x86

  # get kernel version
  _kernver="$(make LOCALVERSION= kernelrelease)"
  _basekernel=${_kernver%%-*}
  _basekernel=${_basekernel%.*}

  mkdir -p "${pkgdir}"/{lib/modules,lib/firmware,boot}
  make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}" modules_install
  cp arch/$KARCH/boot/bzImage "${pkgdir}/boot/vmlinuz-${pkgbase}"

  # set correct depmod command for install
  cp -f "${startdir}/${install}" "${startdir}/${install}.pkg" && install=${install}.pkg
  sed \
    -e  "s/KERNEL_NAME=.*/KERNEL_NAME=${_kernelname}/" \
    -e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/" \
    -i "${startdir}/${install}"

  # install mkinitcpio preset file for kernel
  install -D -m644 "${srcdir}/${pkgbase}.preset" "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"
  sed \
    -e "1s|'linux.*'|'${pkgbase}'|" \
    -e "s|ALL_kver=.*|ALL_kver=\"/boot/vmlinuz-${pkgbase}\"|" \
    -e "s|default_image=.*|default_image=\"/boot/initramfs-${pkgbase}.img\"|" \
    -e "s|fallback_image=.*|fallback_image=\"/boot/initramfs-${pkgbase}-fallback.img\"|" \
    -i "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"

  # remove build and source links
  rm -f "${pkgdir}"/lib/modules/${_kernver}/{source,build}
  # remove the firmware
  rm -rf "${pkgdir}/lib/firmware"
  # make room for external modules
  ln -s "../extramodules-${_basekernel}${_kernelname:--ARCH}" "${pkgdir}/lib/modules/${_kernver}/extramodules"
  # add real version for building modules and running depmod from post_install/upgrade
  mkdir -p "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:--ARCH}"
  echo "${_kernver}" > "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:--ARCH}/version"

  # Now we call depmod...
  depmod -b "${pkgdir}" -F System.map "${_kernver}"

  # move module tree /lib -> /usr/lib
  mkdir -p "${pkgdir}/usr"
  mv "${pkgdir}/lib" "${pkgdir}/usr/"

  # add vmlinux
  install -D -m644 vmlinux "${pkgdir}/usr/lib/modules/${_kernver}/build/vmlinux" 

  # add System.map
  install -D -m644 System.map "${pkgdir}/boot/System.map-${_kernver}"
}

_package-headers() {
  pkgdesc="Header files and scripts for building modules for the slimmed down linux kernel."
  provides=('linux-headers')

  install -dm755 "${pkgdir}/usr/lib/modules/${_kernver}"

  cd "${_srcname}"
  install -D -m644 Makefile \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/Makefile"
  install -D -m644 kernel/Makefile \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/kernel/Makefile"
  install -D -m644 .config \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/.config"

  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include"

  for i in $(ls include/); do
    cp -a include/${i} "${pkgdir}/usr/lib/modules/${_kernver}/build/include/"
  done

  # copy arch includes for external modules
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/x86"
  cp -a arch/x86/include "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/x86/"

  # copy files necessary for later builds, like nvidia and vmware
  cp Module.symvers "${pkgdir}/usr/lib/modules/${_kernver}/build"
  cp -a scripts "${pkgdir}/usr/lib/modules/${_kernver}/build"

  # fix permissions on scripts dir
  chmod og-w -R "${pkgdir}/usr/lib/modules/${_kernver}/build/scripts"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/.tmp_versions"

  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/kernel"

  # add kernel files to headers
  cp arch/${KARCH}/Makefile "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/"
  cp arch/${KARCH}/kernel/asm-offsets.s "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/kernel/"

  # add dm headers
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/md"
  cp drivers/md/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/md"

  # add inotify.h
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include/linux"
  cp include/linux/inotify.h "${pkgdir}/usr/lib/modules/${_kernver}/build/include/linux/"

  # copy in Kconfig files
  for i in $(find . -name "Kconfig*"); do
    mkdir -p "${pkgdir}"/usr/lib/modules/${_kernver}/build/`echo ${i} | sed 's|/Kconfig.*||'`
    cp ${i} "${pkgdir}/usr/lib/modules/${_kernver}/build/${i}"
  done

  # Fix file conflicts with -doc package
  rm "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/kbuild"/Kconfig.*-*
  rm "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/Kconfig"

  # Add objtool for CONFIG_STACK_VALIDATION
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/tools"
  cp -a tools/objtool "${pkgdir}/usr/lib/modules/${_kernver}/build/tools"

  chown -R root.root "${pkgdir}/usr/lib/modules/${_kernver}/build"
  find "${pkgdir}/usr/lib/modules/${_kernver}/build" -type d -exec chmod 755 {} \;

  # strip scripts directory
  find "${pkgdir}/usr/lib/modules/${_kernver}/build/scripts" -type f -perm -u+w 2>/dev/null | while read binary ; do
    case "$(file -bi "${binary}")" in
      *application/x-sharedlib*) # Libraries (.so)
        /usr/bin/strip ${STRIP_SHARED} "${binary}";;
      *application/x-archive*) # Libraries (.a)
        /usr/bin/strip ${STRIP_STATIC} "${binary}";;
      *application/x-executable*) # Binaries
        /usr/bin/strip ${STRIP_BINARIES} "${binary}";;
    esac
  done

  # remove unneeded architectures
  while read modarch; do
   rm -rf $modarch
  done <<< $(find "${pkgdir}"/usr/lib/modules/${_kernver}/build/arch/ -maxdepth 1 -mindepth 1 -type d | grep -v /x86$)
}

pkgname=("${pkgbase}" "${pkgbase}-headers")
for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    $(declare -f "_package${_p#${pkgbase}}")
    _package${_p#${pkgbase}}
  }"
done
