# Maintainer: Mateusz Kaczanowski <kaczanowski.mateusz@gmail.com>

pkgbase=linux-parallella
_srcname=linux-5.4
_kernelname=${pkgbase#linux}
_desc="Parallella"
pkgver=5.4.8
pkgrel=1
arch=('armv7h' 'x86_64')
url="http://www.kernel.org/"
license=('GPL2')
makedepends=('xmlto' 'docbook-xsl' 'kmod' 'inetutils' 'bc' 'uboot-tools' 'git' 'dtc')
options=('!strip')
source=("http://www.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.xz"
        "http://www.kernel.org/pub/linux/kernel/v5.x/patch-${pkgver}.xz"
        '0001-kernel-add-epiphany-kconfig.patch'
        '0002-kernel-add-epiphany-makefile.patch'
        'epiphany.c'
        'epiphany.h'
        'epiphany_uapi.h'
        'linux.preset'
        '60-linux.hook'
        '90-linux.hook'
        'linux-parallella.install'
        'config')
sha256sums=('bf338980b1670bca287f9994b7441c2361907635879169c64ae78364efc5f491'
            '5daea86d29246b5a8e193c097756bc833b33dd6fa6419f9cb52bcbf16a192a1b'
            '51a02268729e38a9566f24e7087301030cdb199ca8582f3360d83fda47d51567'
            '0df557a36cce828eb0dec398132fee5f5380aae409ca8b6029d1f110df0c9970'
            '17f7a780c879e3b1f37eee907111160bb8d228ceefa295f1439c2a9f97b06f36'
            '9e6cd80a98f25ec98582e2cd9352462898eae3c8422b1a65416056e08f37b1f1'
            'efffd95b20a9a2099a9b32c5dbbef21c2e9bc27e70a238d7149d7340dd1d1c38'
            '66644820faa950a5fc59181f5aefcbed6d7ed652b29aee69979a2be2a032025d'
            'ae2e95db94ef7176207c690224169594d49445e04249d2499e9d2fbc117a0b21'
            'c55b4d592fae40af69977ada77deaa4b9df205f4906d367cf66521fa8f0ace9d'
            '0f6be7acb2b00866c96db4b37f10191843c06b02f6b53e9b9007529df1b55a04'
            'b52136f49ef1c0c2ea02f1d35d0ecbc271a384abac99833c4d82c105499e9712')

prepare() {
  cd "${srcdir}/${_srcname}"

  # add upstream patch
  git apply --whitespace=nowarn ../patch-${pkgver}

  # add epiphany driver
  patch -p1 < ../0001-kernel-add-epiphany-kconfig.patch
  patch -p1 < ../0002-kernel-add-epiphany-makefile.patch

  cat "${srcdir}/config" > ./.config
  cat "${srcdir}/epiphany.c" > ./drivers/misc/epiphany.c
  cat "${srcdir}/epiphany.h" > ./drivers/misc/epiphany.h
  cat "${srcdir}/epiphany_uapi.h" > ./include/uapi/misc/epiphany.h

  # add pkgrel to extraversion
  sed -ri "s|^(EXTRAVERSION =)(.*)|\1 -${pkgrel}|" Makefile

  # don't run depmod on 'make install'. We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh
}

build() {
  cd "${srcdir}/${_srcname}"

  # get kernel version
  yes "" | make ${MAKEFLAGS} prepare

  # build
  make ${MAKEFLAGS} UIMAGE_LOADADDR=0x8000 uImage modules dtbs
}

_package() {
  pkgdesc="The Linux Kernel and modules - ${_desc}"
  depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
  optdepends=('crda: to set the correct wireless channels of your country')
  provides=('kernel26' "linux=${pkgver}")
  conflicts=('linux')
  install=${pkgname}.install

  cd "${srcdir}/${_srcname}"

  KARCH=arm

  # get kernel version
  _kernver="$(make kernelrelease)"
  _basekernel=${_kernver%%-*}
  _basekernel=${_basekernel%.*}

  mkdir -p "${pkgdir}"/{boot,usr/lib/modules}
  make INSTALL_MOD_PATH="${pkgdir}/usr" modules_install
  make INSTALL_DTBS_PATH="${pkgdir}/boot/dtbs" dtbs_install
  cp arch/$KARCH/boot/uImage "${pkgdir}/boot/uImage"

  # make room for external modules
  local _extramodules="extramodules-${_basekernel}${_kernelname}"
  ln -s "../${_extramodules}" "${pkgdir}/usr/lib/modules/${_kernver}/extramodules"

  # add real version for building modules and running depmod from hook
  echo "${_kernver}" |
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modules/${_extramodules}/version"

  # remove build and source links
  rm "${pkgdir}"/usr/lib/modules/${_kernver}/{source,build}

  # now we call depmod...
  depmod -b "${pkgdir}/usr" -F System.map "${_kernver}"

  # sed expression for following substitutions
  local _subst="
    s|%PKGBASE%|${pkgbase}|g
    s|%KERNVER%|${_kernver}|g
    s|%EXTRAMODULES%|${_extramodules}|g
  "

  # install mkinitcpio preset file
  sed "${_subst}" ../linux.preset |
    install -Dm644 /dev/stdin "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"

  # install pacman hooks
  sed "${_subst}" ../60-linux.hook |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/60-${pkgbase}.hook"
  sed "${_subst}" ../90-linux.hook |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/90-${pkgbase}.hook"
}

_package-headers() {
  pkgdesc="Header files and scripts for building modules for linux kernel - ${_desc}"
  provides=("linux-headers=${pkgver}")
  conflicts=('linux-headers')

  cd "${srcdir}/${_srcname}"
  local _builddir="${pkgdir}/usr/lib/modules/${_kernver}/build"

  install -Dt "${_builddir}" -m644 Makefile .config Module.symvers
  install -Dt "${_builddir}/kernel" -m644 kernel/Makefile

  mkdir "${_builddir}/.tmp_versions"

  cp -t "${_builddir}" -a include scripts

  install -Dt "${_builddir}/arch/${KARCH}" -m644 arch/${KARCH}/Makefile
  install -Dt "${_builddir}/arch/${KARCH}/kernel" -m644 arch/${KARCH}/kernel/asm-offsets.s arch/$KARCH/kernel/module.lds

  cp -t "${_builddir}/arch/${KARCH}" -a arch/${KARCH}/include

  install -Dt "${_builddir}/drivers/md" -m644 drivers/md/*.h
  install -Dt "${_builddir}/net/mac80211" -m644 net/mac80211/*.h

  # add xfs and shmem for aufs building
  mkdir -p "${_builddir}"/{fs/xfs,mm}

  # copy in Kconfig files
  find . -name Kconfig\* -exec install -Dm644 {} "${_builddir}/{}" \;

  # remove unneeded architectures
  local _arch
  for _arch in "${_builddir}"/arch/*/; do
    [[ ${_arch} == */${KARCH}/ ]] && continue
    rm -r "${_arch}"
  done

  # remove files already in linux-docs package
  rm -r "${_builddir}/Documentation"

  # remove now broken symlinks
  find -L "${_builddir}" -type l -printf 'Removing %P\n' -delete

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

pkgname=("${pkgbase}" "${pkgbase}-headers")
for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    _package${_p#${pkgbase}}
  }"
done
