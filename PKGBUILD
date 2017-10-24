# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com> PGP-Key: BDB26C5A
# Contributor: shivik <> PGP-Key: 761E423C
# Contributor: Michael Duell <mail@akurei.me> PGP-Key: 6EE23EBE
# A special thanks to Steven Barrett for very important sugestions 

###########################################################################################################
#                                          Patch and Build Options
###########################################################################################################
_custom="no"		# "m":	custom config via menuconfig
			# "n":	custom config via nconfig
			# "x":	custom config via xconfig
			# "no":	nothing

_config="pkg"		# "local":	compile only probed modules(https://aur.archlinux.org/packages/modprobed-db/)
			# "nomod":	don't use modules(make localyesconfig)
			# "old":	make with old config (/proc/config.gz)
			# "pkg":	use this package's config

_akcs=""		# Append Kernel Custom String.Not working on some systems.
			# Use if you wnat to append a custom string to kernel version.
			# No risc if you have a backup kernel in case of boot failure.

_use_MUQSS="yes"		# "yes":	Use MUQSS cpu scheduler.
			        # "no":		Use CFS cpu scheduler.

_use_KSM="no"		# "yes":	Enable Kernel SamePage Merging (KSM).
			# "no":		Don't use Kernel SamePage Merging (KSM).

_use_32bit_pae="no"	# "yes": Use the PAE config for 32-bit
			# "no": Use normal 32-bit config
###########################################################################################################

pkgdesc='A desktop oriented kernel and modules with Liquorix patches'
__basekernel=4.13
_minor=9
pkgver=${__basekernel}.${_minor}
pkgrel=1
lqxrel=1
pkgbase=linux-lqx
# pkgname=('linux-lqx' 'linux-lqx-headers' 'linux-lqx-docs')
_lqxpatchname="${pkgver}-${lqxrel}.patch"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://liquorix.net/"

if [ "$_custom" = "x" ]; then
   makedepends=('qt5-base' 'kmod' 'inetutils' 'bc' 'libelf')
else
   makedepends=('kmod' 'inetutils' 'bc' 'libelf')
fi

options=(!strip)
install='linux.install'
source=("https://www.kernel.org/pub/linux/kernel/v4.x/linux-${__basekernel}.tar.xz"
        "https://www.kernel.org/pub/linux/kernel/v4.x/linux-${__basekernel}.tar.sign"
        "https://liquorix.net/sources/${_lqxpatchname}.gz"
        "https://liquorix.net/sources/${__basekernel}/config.i386"
        "https://liquorix.net/sources/${__basekernel}/config.i386-pae"
        "https://liquorix.net/sources/${__basekernel}/config.amd64"
        "linux.preset"
        "90-linux.hook")

sha512sums=('a557c2f0303ae618910b7106ff63d9978afddf470f03cb72aa748213e099a0ecd5f3119aea6cbd7b61df30ca6ef3ec57044d524b7babbaabddf8b08b8bafa7d2'
            'SKIP'
            'b8138e837e99783ab5bd0c6fe0d107443b9e4a76dd7abbd688ea55de8b7ae65b9534076621b3ca13db815ece7033a3958c3ff382c99e6606597dffb10d4f7256'
            '66e6eb9d8e3ada51eecf08ee555d7ba0d3be8a9dec1f45882a2f6af2643193b3216e78f8dfb633087a634af3bcc24a60cc0fe9045086383b7b7d7d13d0545676'
            '8a57f8fe8511607ad868493593fb772420fcca2d057b14d9ca8d171176367e7135c8bf4ef61dc7e54a3c3cb56d4608fe8a7a9240d647ea4517ad0a4e0e30a8e6'
            'd95da6a65c6f8e8c112d25e8b60acf5a7a07c698e13a37bd106c8c67908d92bfc86d354def7539698fddedfa67cda16383ae32538a64065aee98edfe247a7824'
            '2dc6b0ba8f7dbf19d2446c5c5f1823587de89f4e28e9595937dd51a87755099656f2acec50e3e2546ea633ad1bfd1c722e0c2b91eef1d609103d8abdc0a7cbaf'
            'd6faa67f3ef40052152254ae43fee031365d0b1524aa0718b659eb75afc21a3f79ea8d62d66ea311a800109bed545bc8f79e8752319cd378eef2cbd3a09aba22')
            
validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds
             )

_kernelname=${pkgbase#linux}

prepare() {
  KARCH=x86

  cd ${srcdir}/linux-${__basekernel}

  # Add Liquorix patches
  patch -Np1 -i ../$_lqxpatchname
  
    # Trying oldcfg if possible and if selected
  if [ "$_config" = "old" ]; then
    if [ -e /proc/config.gz ]; then
      zcat /proc/config.gz > ./.config
    else
      echo "WARNING: There's no /proc/config.gz... You cannot use the old config. Aborting..."
      exit 1
    fi         
  else
    if [ "$CARCH" = "x86_64" ]; then
      cat ../config.amd64 >./.config
    elif [ "${_use_32bit_pae}" = "yes" ]; then
      cat ../config.i386-pae >./.config
    else
      cat ../config.i386 >./.config
    fi
  fi

  if [ "${_kernelname}" != "" ]; then
    sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
    sed -i "s|CONFIG_LOCALVERSION_AUTO=.*|CONFIG_LOCALVERSION_AUTO=n|" ./.config
  fi

  #Disable MUQSS cpu scheduler in config
  if [ "${_use_MUQSS}" = "no" ]; then
    sed -i -e 's/CONFIG_SCHED_MUQSS=y/# CONFIG_SCHED_MUQSS is not set/' ./.config
  fi

  #Enable KSM (Kernel SamePage Merging)
  if [ "${_use_KSM}" = "yes" ]; then
    sed -i -e 's/# CONFIG_KSM is not set/CONFIG_KSM=y/' ./.config
    sed -i '/CONFIG_KSM=y/a \CONFIG_UKSM=y/n' ./.config
    sed -i '/CONFIG_UKSM=y/a \# CONFIG_KSM_LEGACY is not set' ./.config
  fi

  # set extraversion to pkgrel
  sed -ri "s|^(EXTRAVERSION =).*|\1 -${pkgrel}|" Makefile

  # don't run depmod on 'make install'. We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh

  # set sublevel to kernel minor version
  sed -ri "s|^(SUBLEVEL =).*|\1 ${_minor}|" Makefile

  msg "Running make prepare"
  make prepare

### Optionally load needed modules for the make localmodconfig
 # See https://aur.archlinux.org/packages/modprobed-db/
 if [ $_config = "local" ]; then
  msg "If you have modprobe-db installed, running it in recall mode now"
  if [ -e /usr/bin/modprobed-db ]; then
    [[ ! -x /usr/bin/sudo ]] && echo "Cannot call modprobe with sudo. Install via pacman -S sudo and configure to work with this user." && exit 1
    sudo /usr/bin/modprobed-db recall
 fi
  msg "Running Steven Rostedt's make localmodconfig now"
  make localmodconfig
 else
  yes "" | make config
 fi

 if [ $_config = "nomod" ]; then
  msg "Running localYESconfig now"
  make localyesconfig
 else
  yes "" | make config
 fi

  if [ $_custom = "m" ]; then
    msg "Running make menuconfig"
    make menuconfig
  fi

  if [ $_custom = "n" ]; then
    msg "Running make nconfig"
    make nconfig
  fi

  if [ $_custom = "x" ]; then
    msg "Running make xconfig"
    make xconfig
  fi
}

build() {
  cd ${srcdir}/linux-${__basekernel}

  make ${MAKEFLAGS} LOCALVERSION=${_append_kernel_custom_string} bzImage modules
}

_package() {
pkgdesc="A desktop oriented kernel and modules with Liquorix patches"
depends=('coreutils' 'linux-firmware' 'mkinitcpio>=0.8')
optdepends=('crda: to set the correct wireless channels of your country' 'nvidia-lqx: nVidia drivers for linux-lqx' 'linux-firmware: Firmware files for Linux')
backup=("etc/mkinitcpio.d/${pkgbase}.preset")
install=linux.install

cd "${srcdir}/linux-${__basekernel}"

   KARCH=x86

  # get kernel version
  _kernver="$(make LOCALVERSION=${_append_kernel_custom_string} kernelrelease)"
  _basekernel=${_kernver%%-*}
  _basekernel=${_basekernel%.*}

mkdir -p "${pkgdir}"/{lib/modules,lib/firmware,boot}
  make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}" modules_install
  cp arch/$KARCH/boot/bzImage "${pkgdir}/boot/vmlinuz-${pkgbase}"

  # set correct depmod command for install
  sed -e "s|%PKGBASE%|${pkgbase}|g;s|%KERNVER%|${_kernver}|g" \
    "${startdir}/${install}" > "${startdir}/${install}.pkg"
  true && install=${install}.pkg

  # install mkinitcpio preset file for kernel
  sed "s|%PKGBASE%|${pkgbase}|g" ../linux.preset |
    install -Dm644 /dev/stdin "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"

  # install pacman hook for initramfs regeneration
  sed "s|%PKGBASE%|${pkgbase}|g" ../90-linux.hook |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/90-${pkgbase}.hook"

  # remove build and source links
  rm "${pkgdir}"/lib/modules/${_kernver}/{source,build}

  # remove the firmware
  rm -r "${pkgdir}/lib/firmware"

  # make room for external modules
  ln -s "../extramodules-${_basekernel}${_kernelname:--ARCH}" "${pkgdir}/lib/modules/${_kernver}/extramodules"

  # add real version for building modules and running depmod from post_install/upgrade
  echo "${_kernver}" |
    install -Dm644 /dev/stdin "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:--ARCH}/version"

  # Now we call depmod...
  depmod -b "${pkgdir}" -F System.map "${_kernver}"

  # move module tree /lib -> /usr/lib
  mv -t "${pkgdir}/usr" "${pkgdir}/lib"

  # add vmlinux
  install -Dm644 vmlinux "${pkgdir}/usr/lib/modules/${_kernver}/build/vmlinux"
}


_package-headers() {
pkgdesc="Header files and scripts to build modules for linux-lqx."
depends=('linux-lqx')

cd "${srcdir}/linux-${__basekernel}"


local _builddir="${pkgdir}/usr/lib/modules/${_kernver}/build"

  install -Dt "${_builddir}" -m644 Makefile .config Module.symvers
  install -Dt "${_builddir}/kernel" -m644 kernel/Makefile

  mkdir "${_builddir}/.tmp_versions"

  cp -t "${_builddir}" -a include scripts

  install -Dt "${_builddir}/arch/${KARCH}" -m644 arch/${KARCH}/Makefile
  install -Dt "${_builddir}/arch/${KARCH}/kernel" -m644 arch/${KARCH}/kernel/asm-offsets.s

  if [[ ${CARCH} = i686 ]]; then
    install -t "${_builddir}/arch/${KARCH}" -m644 arch/${KARCH}/Makefile_32.cpu
  fi

  cp -t "${_builddir}/arch/${KARCH}" -a arch/${KARCH}/include

  install -Dt "${_builddir}/drivers/md" -m644 drivers/md/*.h
  install -Dt "${_builddir}/net/mac80211" -m644 net/mac80211/*.h

  # http://bugs.archlinux.org/task/9912
  install -Dt "${_builddir}/drivers/media/dvb-core" -m644 drivers/media/dvb-core/*.h

  # http://bugs.archlinux.org/task/13146
  install -Dt "${_builddir}/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/lgdt330x.h
  install -Dt "${_builddir}/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # http://bugs.archlinux.org/task/20402
  install -Dt "${_builddir}/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "${_builddir}/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "${_builddir}/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  # add xfs and shmem for aufs building
  mkdir -p "${_builddir}"/{fs/xfs,mm}

  # copy in Kconfig files
  find . -name Kconfig\* -exec install -Dm644 {} "${_builddir}/{}" \;

  # add objtool for external module building and enabled VALIDATION_STACK option
  if [[ -e tools/objtool/objtool ]]; then
    install -Dt "${_builddir}/tools/objtool" tools/objtool/objtool
  fi

  # remove unneeded architectures
  local _arch
  for _arch in "${_builddir}"/arch/*/; do
    if [[ ${_arch} != */${KARCH}/ ]]; then
      rm -r "${_arch}"
    fi
  done

  # remove files already in linux-docs package
  rm -r "${_builddir}/Documentation"

  # Fix permissions
  chmod -R u=rwX,go=rX "${_builddir}"

  # strip scripts directory
  local _binary _strip
  while read -rd '' _binary; do
    case "$(file -bi "${_binary}")" in
      *application/x-sharedlib*)  _strip="${STRIP_SHARED}"   ;; # Libraries (.so)
      *application/x-archive*)    _strip="${STRIP_STATIC}"   ;; # Libraries (.a)
      *application/x-executable*) _strip="${STRIP_BINARIES}" ;; # Binaries
      *) continue ;;
    esac
    /usr/bin/strip ${_strip} "${_binary}"
  done < <(find "${_builddir}/scripts" -type f -perm -u+w -print0 2>/dev/null)
}

_package-docs() {
pkgdesc="Kernel hackers manual - HTML documentation that comes with the linux-lqx kernel"
depends=('linux-lqx' )

 cd "${srcdir}/linux-${__basekernel}"

  local _builddir="${pkgdir}/usr/lib/modules/${_kernver}/build"

  mkdir -p "${_builddir}"
  cp -t "${_builddir}" -a Documentation

  # Fix permissions
  chmod -R u=rwX,go=rX "${_builddir}"
}

pkgname=("${pkgbase}" "${pkgbase}-headers" "${pkgbase}-docs")
for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    $(declare -f "_package${_p#${pkgbase}}")
    _package${_p#${pkgbase}}
  }"
done
