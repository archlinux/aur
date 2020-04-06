# Maintainer: David Runge <dvzrv@archlinux.org>

_name=libinstpatch
pkgname=lib32-libinstpatch
pkgver=1.1.4
pkgrel=1
pkgdesc="Instrument file software library"
arch=('x86_64')
url="https://github.com/swami/libinstpatch"
license=('LGPL2.1')
depends=('lib32-glib2' 'lib32-glibc')
makedepends=('cmake' 'lib32-libsndfile' 'libinstpatch' 'python')
provides=('libinstpatch-1.0.so')
source=("$pkgname-$pkgver.tar.gz::https://github.com/swami/${_name}/archive/v${pkgver}.tar.gz")
sha512sums=('7dae8fd21162e0053c1a72fbd69f228467cd1d05292b503670798a86de187265d0ebde4e822728440abfffa61a0b6b8c1011b794119f285e8bcb57728ab81240')

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
