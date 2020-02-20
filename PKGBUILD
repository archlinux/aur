# Maintainer: David Runge <dvzrv@archlinux.org>

_name=libinstpatch
pkgname=lib32-libinstpatch
pkgver=1.1.3
pkgrel=1
pkgdesc="Instrument file software library"
arch=('x86_64')
url="https://github.com/swami/libinstpatch"
license=('LGPL2.1')
depends=('lib32-glib2' 'lib32-glibc')
makedepends=('cmake' 'lib32-libsndfile' 'libinstpatch' 'python')
provides=('libinstpatch-1.0.so')
source=("$pkgname-$pkgver.tar.gz::https://github.com/swami/${_name}/archive/v${pkgver}.tar.gz")
sha512sums=('6a30a52d74bbccb0e7e7aa878fb0a6a9294e43fcc9cd0d88ad3d30be963859b3fa96e38da2863011956243ce149819982edad57a03d88c15e4f23018cd293d27')

prepare() {
  mv -v "${_name}-$pkgver" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DLIB_INSTALL_DIR=/usr/lib32 \
        -DLIB_SUFFIX=32 \
        -B build \
        -S .
  make VERBOSE=1 -C build
}

package() {
  depends+=('libsndfile.so')
  cd "$pkgname-$pkgver"
  make VERBOSE=1 DESTDIR="$pkgdir/" install -C build
  install -vDm 644 {AUTHORS,ChangeLog,README.md,TODO.tasks} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
  rm -rf "${pkgdir}/usr/include"
}
