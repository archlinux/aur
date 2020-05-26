# Maintainer: David Runge <dvzrv@archlinux.org>

_name=libinstpatch
pkgname=lib32-libinstpatch
pkgver=1.1.5
pkgrel=1
pkgdesc="Instrument file software library"
arch=('x86_64')
url="https://github.com/swami/libinstpatch"
license=('LGPL2.1')
depends=('lib32-glibc' "libinstpatch=${pkgver}")
makedepends=('cmake' 'lib32-glib2' 'lib32-libsndfile' 'python')
provides=('libinstpatch-1.0.so')
source=("$pkgname-$pkgver.tar.gz::https://github.com/swami/${_name}/archive/v${pkgver}.tar.gz")
sha512sums=('162b71cb80915cbb1b7572b524f0eb5280c9e09c758c1d8dd660b2c3ab4a3da2a7d2372971ece14a8997fa7c2b016b2334dca41bb23bba20ae438550b14f35fa')

prepare() {
  mv -v "${_name}-$pkgver" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"
  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DLIB_INSTALL_DIR=/usr/lib32 \
        -DCMAKE_BUILD_TYPE='None' \
        -DLIB_SUFFIX=32 \
        -Wno-dev \
        -B build \
        -S .
  make VERBOSE=1 -C build
}

package() {
  depends+=('libglib-2.0.so' 'libgobject-2.0.so' 'libsndfile.so')
  cd "$pkgname-$pkgver"
  make VERBOSE=1 DESTDIR="$pkgdir/" install -C build
  install -vDm 644 {AUTHORS,ChangeLog,README.md,TODO.tasks} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
  rm -rf "${pkgdir}/usr/include"
}
