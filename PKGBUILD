# AArch64 multi-platform
# PKGBUILD Maintainer: Raanu <Gero3977@gmail.com>
# Kernel maintainer: Ayufan <ayufan@ayufan.eu> 

# The below variables get updated from external script when new builds are released
_kernver=4.4.138-1094-rockchip-ayufan-gf13a8a9a4eee
_imagename=linux-image-4.4.138-1094-rockchip-ayufan-gf13a8a9a4eee_4.4.138-1094-rockchip-ayufan_arm64.deb
_headersname=linux-headers-4.4.138-1094-rockchip-ayufan-gf13a8a9a4eee_4.4.138-1094-rockchip-ayufan_arm64.deb
_releasetag=4.4.138-1094-rockchip-ayufan
_pkgver=4.4.138_1094



_desc="AArch64 for Rock64. This package will fetch a Debian built kernel as a temporary workaround for USB 3.0 fixes."
pkgbase=linux-aarch64-rock64-bin
pkgname=('linux-aarch64-rock64-bin' 'linux-aarch64-rock64-bin-headers')
pkgver="${_pkgver}"
pkgrel=1
arch=('aarch64')
url="https://github.com/ayufan-rock64/linux-kernel"
license=('GPL2')
options=('!strip')
depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
provides=("linux=${pkgver}" "linux-aarch64=${pkgver}")
conflicts=('linux' 'linux-aarch64' 'linux-arch64-rc')
source=("https://github.com/ayufan-rock64/linux-kernel/releases/download/${_releasetag}/${_imagename}"
"https://github.com/ayufan-rock64/linux-kernel/releases/download/${_releasetag}/${_headersname}"
        'linux.preset'
        '99-linux.hook'
        'linux-aarch64-rock64-bin.install')
sha256sums=('f61a9c611043e1f914ddd9df2c0d71cfab6eebe647e153b8ee24f9734ad576bc'
            'e7a28757bf5242ed3e0f7d46542e9b1c1b65604ae6cc7fef8c1f21bbb339d2e7'
            '9757ea513c67c9fb14e9ba9b681069f091e60bc5f892c9a2c4fe3cd57ca3fbe4'
            'be679ded489c484ec6a9eeed78c6383f9c5a7fab20d2b1f00be67ac6c7185fe6'
            'c87f3c6d4fa19319d5f81b65a45d62ab71e570bdf549c7e6c0f89292dcb5174f')
noextract=("${_imagename}"
           "${_headersname}")


prepare() {
  cd "${srcdir}"

  # extract the prebuilt kernel files
  mkdir -p linux-image/
  cp "${_imagename}" linux-image/
  cd linux-image/
  ar xf "${_imagename}"
  tar -xf data.tar.xz
  
  cd "${srcdir}"

  # extract the related linux headers
  mkdir -p linux-headers/
  cp "${_headersname}" linux-headers/
  cd linux-headers/
  ar xf "${_headersname}" 
  tar -xf data.tar.xz 
}

package_linux-aarch64-rock64-bin() {
  pkgdesc="The Linux Kernel and modules - ${_desc}"
  depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
  optdepends=('crda: to set the correct wireless channels of your country' 'linux-aarch64-rock64-bin-headers')
  provides=("linux=${pkgver}" "linux-aarch64=${pkgver}")
  conflicts=('linux' 'linux-aarch64' 'linux-arch64-rc')  provides=('kernel26' "linux=${pkgver}")
  replaces=('linux-armv8')
  backup=("etc/mkinitcpio.d/${pkgbase}.preset")
  install=${pkgname}.install

  cd "${srcdir}/linux-image"

  # copy boot files  
  cp -r boot "${pkgdir}/boot"
  cp "boot/vmlinuz-${_kernver}" "${pkgdir}/boot/Image"
  mkdir -p "${pkgdir}/boot/dtbs/rockchip"
  mv "usr/lib/linux-image-${_kernver}/rockchip" "${pkgdir}/boot/dtbs/rockchip"

  # copy kernel files
  mkdir -p "${pkgdir}/usr"
  mkdir -p "${pkgdir}/lib"
  cp -r usr "${pkgdir}/"
  cp -r lib "${pkgdir}/"
  
  # set correct depmod command for install
  sed \
    -e  "s/KERNEL_NAME=.*/KERNEL_NAME=${_kernelname}/g" \
    -e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" \
    -i "${startdir}/${pkgname}.install"

  # install mkinitcpio preset file for kernel
  install -D -m644 "${srcdir}/linux.preset" "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"
  sed \
    -e "1s|'linux.*'|'${pkgbase}'|" \
    -e "s|ALL_kver=.*|ALL_kver=\"${_kernver}\"|" \
    -i "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"

  # install pacman hook for initramfs regeneration
  sed "s|%PKGBASE%|${pkgbase}|g" "${srcdir}/99-linux.hook" |
    install -D -m644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/99-${pkgbase}.hook"

  # Now we call depmod...
  depmod -b "$pkgdir" -F "boot/System.map-${_kernver}" "$_kernver"

  # move module tree /lib -> /usr/lib
  mkdir -p "${pkgdir}/usr"
  cp -r "$pkgdir/lib" "$pkgdir/usr"
  rm -rf "$pkgdir/lib"

}

package_linux-aarch64-rock64-bin-headers() {
  pkgdesc="Header files and scripts for building modules for linux kernel - ${_desc}"
  provides=("linux-headers=${pkgver}")
  replaces=('linux-armv8-headers')
  conflicts=('linux-headers')
  optdepends=('linux-aarch64-rock64-bin')

  KARCH=arm64
  
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build"
  cp -rT "${srcdir}/linux-headers/usr/src/linux-headers-${_kernver}/" "${pkgdir}/usr/lib/modules/${_kernver}/build"

  install -dm755 "${pkgdir}/usr/lib/modules/${_kernver}"
  
  cd "${srcdir}/linux-headers/usr/src/linux-headers-${_kernver}"
  install -D -m644 Makefile \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/Makefile"
  install -D -m644 kernel/Makefile \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/kernel/Makefile"
  install -D -m644 .config \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/.config"

  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include"
  
  # fix permissions on scripts dir
  chmod og-w -R "${pkgdir}/usr/lib/modules/${_kernver}/build/scripts"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/.tmp_versions"

  chown -R root.root "${pkgdir}/usr/lib/modules/${_kernver}/build"
  find "${pkgdir}/usr/lib/modules/${_kernver}/build" -type d -exec chmod 755 {} \;

  # strip scripts directory
  find "${pkgdir}/usr/lib/modules/${_kernver}/build/scripts" -type f -perm -u+w 2>/dev/null | while read binary ; do
    case "$(file -bi "${binary}")" in
      *application/x-sharedlib*) # Libraries (.so)
        /usr/bin/strip ${STRIP_SHARED} "${binary}" || true;;
      *application/x-archive*) # Libraries (.a)
        /usr/bin/strip ${STRIP_STATIC} "${binary}" || true;;
      *application/x-executable*) # Binaries
        /usr/bin/strip ${STRIP_BINARIES} "${binary}" || true;;
    esac
  done

  # remove unneeded architectures
  rm -rf "${pkgdir}"/usr/lib/modules/${_kernver}/build/arch/{alpha,arc,arm,arm26,avr32,blackfin,c6x,cris,frv,h8300,hexagon,ia64,m32r,m68k,m68knommu,metag,mips,microblaze,mn10300,openrisc,parisc,powerpc,ppc,s390,score,sh,sh64,sparc,sparc64,tile,unicore32,um,v850,x86,xtensa}
}
