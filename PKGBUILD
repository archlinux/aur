# Maintainer: Xiao Xiong <xiongxiao126 {at} gmail {dot} com>
pkgname=astrorama-elements
_pkgname=Elements
pkgver=6.3.4
pkgrel=2
pkgdesc="A C++/Python build framework that helps to organize the software into modules which are gathered into projects"
url="https://github.com/astrorama/Elements"
arch=('x86_64')
license=('LGPL-3.0-only')
depends=(boost-libs gcc-libs log4cpp python)
makedepends=(boost cmake)
checkdepends=(python-pytest)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/astrorama/Elements/archive/$pkgver.tar.gz"
  0001-fix_build.patch
  0002-fix_check.patch
)
sha256sums=(
  '75f453e1189007353ca5404cb84a2a1d64cef71d789a556a760820e33f625678'
  'ce12cfe247b580af5bae6ecc6d3efa6782ee3a7e8626b7ac059b6ff277e94240'
  '87993dcb7ce533dffbac288c986a43ea9885ab1678dbfb23f6a7ae1b550743a2'
)

prepare() {
  cd $_pkgname-$pkgver

  # Adapted from Fedora packaging by Alejandro Álvarez Ayllón.
  patch -Np1 -i ../0001-fix_build.patch
  patch -Np1 -i ../0002-fix_check.patch
  rm -r ElementsExamples
}

build() {
  cd "$_pkgname-$pkgver"

  cmake -B build -DCMAKE_INSTALL_PREFIX=/opt/astrorama -DPYTHON_EXPLICIT_VERSION=3 -DUSE_SPHINX=OFF -Wno-dev
  make -C build
}

check() {
  cd "$_pkgname-$pkgver"

  make -C build test
}

package() {
  cd "$_pkgname-$pkgver"

  make -C build DESTDIR="$pkgdir" install
  rm -r $pkgdir/opt/astrorama/bin/*_test
}
