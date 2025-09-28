# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Bo Davidson <bo.davidson@go.tarleton.edu>
# Contributor: Paul Davis <paul@dangersalad.com>
pkgname=openrgb
pkgver=1.0rc2
pkgrel=4
pkgdesc="Open source RGB lighting control that doesn't depend on manufacturer software"
arch=("x86_64")
url="https://gitlab.com/CalcProgrammer1/OpenRGB"
license=('GPL-2.0-or-later')
depends=('glibc' 'gcc-libs' 'qt5-base' 'libusb' 'hidapi' 'mbedtls' 'hicolor-icon-theme')
makedepends=('qt5-tools')
optdepends=('i2c-tools: mainboard & RAM access'
            'openrazer-driver-dkms: for Razer devices')
source=("https://gitlab.com/CalcProgrammer1/OpenRGB/-/archive/release_candidate_$pkgver/OpenRGB-release_candidate_${pkgver}.tar.gz"
        openrgb-modules-load.conf
        openrgb.tmpfiles
        openrgb.service)
sha256sums=('7ecef99ab1607bd8f47427eef59e060e407dc97a40bb9083c5ade6f30145b762'
            'b5a53d747422f8b594e3e9615e238457d696732efce94050cdd72182a8645ef2'
            'e86604e9604d59cddcc13de60b71c0e652cd1f9b56d89de36b2158509849e51c'
            'f53328babef392393ee44086f8897174232e863280a84266630a3cd92facc190')

build() {
  # Remove -pipe because their weird build process needs -save-temps.
  export CXXFLAGS=${CXXFLAGS/-pipe}

  # Fix crashes
  export CXXFLAGS=${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS}

  cd "$srcdir/OpenRGB-release_candidate_$pkgver"
  sed -i 's|rules.path=/lib|rules.path=/usr/lib|g' OpenRGB.pro
  qmake OpenRGB.pro
  make
}

package() {
  cd "$srcdir/OpenRGB-release_candidate_$pkgver"
  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 "$srcdir"/openrgb-modules-load.conf "$pkgdir"/usr/lib/modules-load.d/openrgb.conf
  install -Dm644 "$srcdir"/openrgb.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/openrgb.conf
  install -Dm644 "$srcdir"/openrgb.service "$pkgdir"/usr/lib/systemd/system/openrgb.service
  # Remove the upstream service file sicne we prefer ours
  rm -r "$pkgdir"/etc
}
