# Maintainer: Your Name <your@email.com>
pkgbase=linux-galaxyaudio-bin
pkgname=(linux-galaxyaudio-bin linux-galaxyaudio-headers-bin)
pkgver=7.1.4
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
sha256sums=('b6a2ea9b25048e06b73f18618e6cdef9b32f369c4239d3cc9f2dea6047ce0e8f' 'f8f3e9b9e30b20737c1a6a87133fc872d1424a81f350a0ed445a935e39b8df72' 'ed5f628f80039519b190f5ee5d529d167b6521a041ab20701f0c86a76a4ae963')
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
