# Maintainer: Jonathon Fernyhough <jonathon+m2x+dev>
# Contributor: Jefferson Gonzalez <jgmdev@gmail.com>

# PKGBUILD based on/adapted from https://github.com/jgmdev/archlinux-odroid/tree/master/linux-amlogic-panfrost-510

pkgbase=linux-odroid
pkgname=($pkgbase
         $pkgbase-headers)
_kernelname=${pkgbase#linux}
pkgver=5.10.10
pkgrel=1
arch=('aarch64')
url="https://github.com/m2x-dev/linux/"
license=('GPL2')
makedepends=(bc docbook-xsl dtc git inetutils kmod uboot-tools vboot-utils xmlto)
options=('!strip')

_commit=3332f1f0a1e1e0e5deb1990dfbb0b6a82b8153d9
source=(
  "https://github.com/m2x-dev/linux/archive/${_commit}.tar.gz"
  'config'
  'linux.preset'
  '60-linux.hook'
  '90-linux.hook'
  '01-aegis-crypto.patch'
)
b2sums=('92aac138408b6689710e8f05003cd5ab71fe1c7a452e959f9c3e6baaac92ce9eed4d9fa4ec31d567853421d4c83ead09c313c99100faedaf106c150b0dea6e89'
        '4f11a4cfcdcd9206f3f95475119019e5fdde8d949aadf5c4eac5c57d5ef5dff0403a75887e3f45ea40dba821a8501467820cc8536eff6009ac605b59f4f9866a'
        '146bfc704a3ce69176055d6612d5c55b0048ccae83c13c27aa3c273424f5a81a3168fbfbcce6c78f6c69cbfd15d1161a46b08489d324495070731dbb43ac5b9f'
        '40e2e0ac9eec9f9c08593875ca5bb8a26f835e33ae42e3718b98e83d76bbbc51a68395215c707fe58269954127261f7f8d12ec47341d28c672de973f3c4e71e8'
        'f39994fda3d76407b0af192534ca9931782b3e9de4e438a3adbc7640fc794c261102e5c7bfa1523c291ef8c7256c1106e6dbd40814006329c48d90f51c569e82'
        '35f53af7b446f55b426b9b73b7f65dc99c4bacd444364e78666b868b5200dd04cf022dfd2784701684d2ec033076c0856d125df89d9e3b339ef32f749549eaf3')

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  cd linux-$_commit

  echo "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  #echo "${pkgbase#linux}" > localversion.20-pkgname

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  echo "Setting config..."
  cp ../config .config
  make olddefconfig

  # don't run depmod on 'make install'. We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh

  make -s kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"
}

build() {
  cd linux-$_commit

  # build!
  unset LDFLAGS
  make ${MAKEFLAGS} Image Image.gz modules

  # Generate device tree blobs with symbols to support applying device tree overlays in U-Boot
  make ${MAKEFLAGS} DTC_FLAGS="-@" dtbs
}

package_linux-odroid() {
  pkgdesc="The Linux Kernel and modules with patches for ODroid SBCs"
  depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
  optdepends=('crda: to set the correct wireless channels of your country')
  provides=('kernel26' "linux=${pkgver}")
  replaces=('linux-armv8')
  conflicts=('linux')
  backup=("etc/mkinitcpio.d/${pkgbase}.preset")
  install=${pkgname}.install

  cd linux-$_commit

  KARCH=arm64

  # get kernel version
  local _kernver="$(<version)"
  local _modulesdir="$pkgdir/usr/lib/modules/$_kernver"
  _basekernel=${_kernver%%-*}
  _basekernel=${_basekernel%.*}

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$_modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$_modulesdir/pkgbase"

  # add real version for building modules and running depmod from hook
  echo "${_kernver}" | install -Dm644 /dev/stdin "$_modulesdir/version"

  echo "Installing modules..."
  make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 modules_install

  make INSTALL_DTBS_PATH="${pkgdir}/boot/dtbs" dtbs_install
  cp arch/$KARCH/boot/Image{,.gz} "${pkgdir}/boot"

  # remove build and source links
  rm "$_modulesdir"/{source,build}

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

package_linux-odroid-headers() {
  pkgdesc="Header files and scripts for building modules for linux kernel with patches for ODroid SBCs"
  provides=("linux-headers=${pkgver}")
  conflicts=('linux-headers')

  cd linux-$_commit
  local _builddir="${pkgdir}/usr/lib/modules/$(<version)/build"

  install -Dt "${_builddir}" -m644 Makefile .config Module.symvers
  install -Dt "${_builddir}/kernel" -m644 kernel/Makefile

  mkdir "${_builddir}/.tmp_versions"

  cp -t "${_builddir}" -a include scripts

  install -Dt "${_builddir}/arch/${KARCH}" -m644 arch/${KARCH}/Makefile
  install -Dt "${_builddir}/arch/${KARCH}/kernel" -m644 arch/${KARCH}/kernel/asm-offsets.s

  cp -t "${_builddir}/arch/${KARCH}" -a arch/${KARCH}/include
  mkdir -p "${_builddir}/arch/arm"
  cp -t "${_builddir}/arch/arm" -a arch/arm/include

  install -Dt "${_builddir}/drivers/md" -m644 drivers/md/*.h
  install -Dt "${_builddir}/net/mac80211" -m644 net/mac80211/*.h

  # http://bugs.archlinux.org/task/13146
  install -Dt "${_builddir}/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # http://bugs.archlinux.org/task/20402
  install -Dt "${_builddir}/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "${_builddir}/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "${_builddir}/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  # add xfs and shmem for aufs building
  mkdir -p "${_builddir}"/{fs/xfs,mm}

  # copy in Kconfig files
  find . -name Kconfig\* -exec install -Dm644 {} "${_builddir}/{}" \;

  # remove unneeded architectures
  local _arch
  for _arch in "${_builddir}"/arch/*/; do
    [[ ${_arch} == */${KARCH}/ || ${_arch} == */arm/ ]] && continue
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
