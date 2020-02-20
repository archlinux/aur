# Maintainer: David Runge <dvzrv@archlinux.org>

_name=libinstpatch
pkgname=lib32-libinstpatch
pkgver=1.1.2
pkgrel=1
pkgdesc="Instrument file software library"
arch=('x86_64')
url="https://github.com/swami/libinstpatch"
license=('LGPL2.1')
depends=('lib32-glib2' 'lib32-glibc')
makedepends=('cmake' 'lib32-libsndfile' 'libinstpatch' 'python')
provides=('libinstpatch-1.0.so')
source=("$pkgname-$pkgver.tar.gz::https://github.com/swami/${_name}/archive/v${pkgver}.tar.gz")
sha512sums=('27d8e5c7bfb2bb98074aac12a3d1017d65598b5fd34e4ae0e7843bb45120509cf8f579078dbbefb2815be39d18b316513121bb870357009b7c814d1677018530')

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
