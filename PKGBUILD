# Maintainer: Adam Honse <calcprogrammer1@gmail.com>
# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Bo Davidson <bo.davidson@go.tarleton.edu>
# Contributor: Paul Davis <paul@dangersalad.com>
pkgname=openrgb-hotplug
pkgver=1.0
pkgrel=1
pkgdesc="Open source RGB lighting control that doesn't depend on manufacturer software.  Built with hotplug support"
arch=("x86_64")
url="https://gitlab.com/CalcProgrammer1/OpenRGB"
license=('GPL-2.0-or-later')
depends=('glibc' 'libgcc' 'libstdc++' 'qt6-base' 'libusb' 'hidapi-hotplug' 'mbedtls3' 'hicolor-icon-theme')
makedepends=('qt6-tools')
optdepends=('i2c-tools: mainboard & RAM access')
source=("https://gitlab.com/CalcProgrammer1/OpenRGB/-/archive/release_$pkgver/OpenRGB-release_${pkgver}.tar.gz"
        openrgb-modules-load.conf
        openrgb.tmpfiles
        openrgb.service)
sha256sums=('e2ddfc6f1fd60405e9b3f16476c97fb5ce05f41f4585fc559bb21b82fb102f83'
            'b5a53d747422f8b594e3e9615e238457d696732efce94050cdd72182a8645ef2'
            'e86604e9604d59cddcc13de60b71c0e652cd1f9b56d89de36b2158509849e51c'
            'f53328babef392393ee44086f8897174232e863280a84266630a3cd92facc190')

build() {
  # Fix crashes
  export CXXFLAGS=${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS}

  cd "$srcdir/OpenRGB-release_$pkgver"
  qmake6 OpenRGB.pro
  make
}

package() {
  cd "$srcdir/OpenRGB-release_$pkgver"
  make INSTALL_ROOT="$pkgdir" install

  # Generate udev rules using the binary we just built.
  install -d "$pkgdir"/usr/lib/udev/rules.d
  ./openrgb --generate-udev-rules "$pkgdir"/usr/lib/udev/rules.d/60-openrgb.rules

  install -Dm644 "$srcdir"/openrgb-modules-load.conf "$pkgdir"/usr/lib/modules-load.d/openrgb.conf
  install -Dm644 "$srcdir"/openrgb.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/openrgb.conf
  install -Dm644 "$srcdir"/openrgb.service "$pkgdir"/usr/lib/systemd/system/openrgb.service
}
