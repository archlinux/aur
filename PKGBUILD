# Maintainer: Your Name <your@email.com>
pkgbase=linux-galaxyaudio-bin
pkgname=(linux-galaxyaudio-bin linux-galaxyaudio-headers-bin)
pkgver=7.1.8
pkgrel=1
pkgdesc='Linux kernel for Samsung Galaxy Book 4 with MAX98390 sound support (Binary Release)'
arch=(x86_64)
url="https://github.com/antpln/linux-galaxyaudio"
license=('GPL2')
makedepends=('tar' 'zstd')
options=('!strip')

_pkgname=linux-galaxyaudio
source=(
  "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst::https://github.com/antpln/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst"
  "${_pkgname}-headers-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst::https://github.com/antpln/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-headers-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst"
  "${_pkgname}.preset"
)
sha256sums=('ffae047f462660b71f96a772439491812faaf76b9ea27532e259b9e5152a0722' '6168085f02e92373cf62691f649a7ccf40287f1685b5dddac3390a87c4bc97a8' 'ed5f628f80039519b190f5ee5d529d167b6521a041ab20701f0c86a76a4ae963')
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" "${_pkgname}-headers-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")

package_linux-galaxyaudio-bin() {
  pkgdesc="The ${_pkgname} kernel and modules (Binary)"
  depends=(coreutils kmod initramfs)
  optdepends=('linux-firmware: firmware images needed for some devices')
  provides=("linux=${pkgver}" "linux-galaxyaudio=${pkgver}")
  conflicts=(linux-galaxyaudio)
  install=linux-galaxyaudio-bin.install

  msg2 "Extracting kernel package..."
  bsdtar -xf "${srcdir}/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}"
  
  # Remove package metadata files that come from the original package
  rm -f "${pkgdir}"/.PKGINFO "${pkgdir}"/.BUILDINFO "${pkgdir}"/.MTREE "${pkgdir}"/.INSTALL 2>/dev/null || true

  # Install mkinitcpio preset file
  msg2 "Installing mkinitcpio preset..."
  install -Dm644 "${srcdir}/${_pkgname}.preset" "${pkgdir}/etc/mkinitcpio.d/${_pkgname}.preset"
}

package_linux-galaxyaudio-headers-bin() {
  pkgdesc="Headers and scripts for building modules for the ${_pkgname} kernel (Binary)"
  depends=(pahole)
  provides=("linux-headers=${pkgver}" "linux-galaxyaudio-headers=${pkgver}")
  conflicts=(linux-headers linux-galaxyaudio-headers)

  msg2 "Extracting headers package..."
  bsdtar -xf "${srcdir}/${_pkgname}-headers-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}"
  
  # Remove package metadata files
  rm -f "${pkgdir}"/.PKGINFO "${pkgdir}"/.BUILDINFO "${pkgdir}"/.MTREE "${pkgdir}"/.INSTALL 2>/dev/null || true
}
