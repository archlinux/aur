# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Maxim Vuets <maxim.vuets@gmail.com>

pkgname=cuneiform
pkgver=1.1.0
pkgrel=19
pkgdesc="Linux port of an OCR system developed in Russia. Supports more than 20 languages"
arch=('x86_64')
url="https://launchpad.net/cuneiform-linux"
license=('BSD')
depends=('libmagick')
makedepends=('cmake')
source=(https://launchpad.net/cuneiform-linux/${pkgver%.*}/${pkgver%.*}/+download/$pkgname-linux-$pkgver.tar.bz2
	build-fix.patch)
sha256sums=('577e0d054de72086c33b4e8ae15033657776509b9a7af6eb272888eefcbdbbad'
            '3d9f4d923ec6ca5555550819096b7d66e364a8aeb74a9d1f0d961784d267642b')

prepare() {
  cd $pkgname-linux-$pkgver
  patch -Np1 -i ../build-fix.patch
  sed -i 's/lib64/lib/' install_files.cmake
}

build() {
  cd $pkgname-linux-$pkgver
  [[ -d build ]] || mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd $pkgname-linux-$pkgver/build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../cuneiform_src/Kern/license.txt "$pkgdir/usr/share/licenses/cuneiform/license.txt"
}
