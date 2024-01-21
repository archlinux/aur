# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Bo Davidson <bo.davidson@go.tarleton.edu>
# Contributor: Paul Davis <paul@dangersalad.com>
pkgname=openrgb
pkgver=0.9
pkgrel=2
pkgdesc="Open source RGB lighting control that doesn't depend on manufacturer software"
arch=("x86_64")
url="https://gitlab.com/CalcProgrammer1/OpenRGB"
license=('GPL2')
depends=('qt5-base' 'libusb' 'hidapi' 'mbedtls2')
makedepends=('pkgconf' 'qt5-tools')
optdepends=('i2c-tools: mainboard & RAM access')
# Using Link Time Optimization can cause segment fault at runtime. Disabled until upstream fix
# https://gitlab.com/CalcProgrammer1/OpenRGB/-/commit/8e6e5c1becdd610cd9206bbdcf5616ce4b43e0f1
# https://gitlab.com/CalcProgrammer1/OpenRGB/-/merge_requests/668
options=('!lto')
source=("https://gitlab.com/CalcProgrammer1/OpenRGB/-/archive/release_$pkgver/OpenRGB-release_$pkgver.tar.gz"
        openrgb-modules-load.conf
        openrgb.service)
sha256sums=('2e62799339b72b6d3afc4792e6ff39487583210bb5ddde93e2daa38ae35381c2'
            'b5a53d747422f8b594e3e9615e238457d696732efce94050cdd72182a8645ef2'
            '9a0210061e2a55ec0c7ea07bc7860f8fc216f72f84444493964e90457a4c0a00')

build() {
  # Remove -pipe because their weird build process needs -save-temps.
  export CXXFLAGS=${CXXFLAGS/-pipe}

  # Fix crashes
  export CXXFLAGS=${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS}
  export LDFLAGS="$LDFLAGS -L/usr/lib/mbedtls2" # props to AndyRTR for linking to mbedtls2 fix

  cd "$srcdir/OpenRGB-release_$pkgver"
  sed -i 's|rules.path=/lib|rules.path=/usr/lib|g' OpenRGB.pro
  qmake INCLUDEPATH+="/usr/include/mbedtls2" OpenRGB.pro
  make
}

package() {
  cd "$srcdir/OpenRGB-release_$pkgver"
  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 "$srcdir"/openrgb-modules-load.conf "$pkgdir"/usr/lib/modules-load.d/openrgb.conf
  install -Dm644 "$srcdir"/openrgb.service "$pkgdir"/usr/lib/systemd/system/openrgb.service
}
