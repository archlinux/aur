# Maintainer: Your Name <your@email.com>
pkgbase=linux-galaxyaudio-bin
pkgname=(linux-galaxyaudio-bin linux-galaxyaudio-headers-bin)
pkgver=6.18.9
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
sha256sums=('c6ded1e1fe2905332d730a649a4dac39a51001e7ba76a4c917c3b45dd96f0a20' '3405b7f17443c916bc23ea2af1aff31a47b1b432f8fd6983cb0869c8b5402774' 'ed5f628f80039519b190f5ee5d529d167b6521a041ab20701f0c86a76a4ae963')
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
