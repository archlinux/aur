# Maintainer: envolution
# Contributor: Miguel de Val-Borro <miguel.deval [at] gmail [dot] com>
# Contributor: Matteo Paoluzzi <duwath [at] gmail [dot] com>
# Contributor: jmf <jmf [at] mesecons [dot] net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=xephem
_pkgname=XEphem
pkgver=4.2.0
pkgrel=4
pkgdesc="The Serious Interactive Astronomical Software Ephemeris"
arch=('i686' 'x86_64')
url="https://github.com/XEphem/XEphem"
license=('MIT')
depends=('libxmu' 'openmotif' 'perl' 'openssl')
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
  cmake.patch::https://patch-diff.githubusercontent.com/raw/XEphem/XEphem/pull/60.patch
  strptime.patch::https://github.com/XEphem/XEphem/commit/30e14f685ede015fcd8985cd83ee6510f93f0073.patch
  "xephem.desktop" "xephem.png")
sha256sums=('4d67b923e342e56b2a4a49f574e576fc183f1747edb693bab3709e83c8ad9c1b'
            '6a5e029249caf72bb9e6d15fabfe6d0e8d0651a752b07ea3e983b6faf1ad4e5e'
            '71b966304970aedc73b60b0891368898f5b7cc89dfc7eb27e4a9f768581e39dc'
            'aa4e19b043cea5f13dcb9314b794c7152510a20289bf20a077a586ca913c65be'
            'fbca29143ecf5d89923ba6b68279cbc396886b229689dcd3b70999675bdb6c20')

prepare() {
  cd "${_pkgname}-${pkgver}"
  patch -Np1 -i ../cmake.patch || true
  patch -Np1 -i ../strptime.patch
}

build() {
  cd "${_pkgname}-${pkgver}"
  mkdir -p build
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "${_pkgname}-${pkgver}"
  DESTDIR="$pkgdir" cmake --install build

  #X11 app defaults
  install -d "$pkgdir"/usr/share/X11/app-defaults
  echo "XEphem.ShareDir: /usr/share/xephem" >"$pkgdir"/usr/share/X11/app-defaults/XEphem

  #desktop and icon
  install -Dm644 "$srcdir/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "$srcdir/${pkgname}.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"

  #license
  install -Dm644 "$srcdir"/${_pkgname}-${pkgver}/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
# vim:set ts=2 sw=2 et:
