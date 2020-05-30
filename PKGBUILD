# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Maxim Vuets <maxim.vuets@gmail.com>

pkgname=cuneiform
pkgver=1.1.0
pkgrel=20
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
# Don't override LDFLAGS
  sed -e '/CMAKE_SHARED_LINKER_FLAGS/d' -i cuneiform_src/CMakeLists.txt
}

build() {
  CFLAGS+=' -fcommon'
  cmake -B build -S $pkgname-linux-$pkgver .. \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgname-linux-$pkgver/cuneiform_src/Kern/license.txt "$pkgdir/usr/share/licenses/cuneiform/license.txt"
}
