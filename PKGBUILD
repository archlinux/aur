# Maintainer: David Runge <dvzrv@archlinux.org>

_name=libinstpatch
pkgname=lib32-libinstpatch
pkgver=1.1.6
pkgrel=1
pkgdesc="Instrument file software library"
arch=('x86_64')
url="https://github.com/swami/libinstpatch"
license=('LGPL2.1')
depends=('lib32-glibc' "libinstpatch=${pkgver}")
makedepends=('cmake' 'lib32-glib2' 'lib32-libsndfile' 'python')
provides=('libinstpatch-1.0.so')
source=("$pkgname-$pkgver.tar.gz::https://github.com/swami/${_name}/archive/v${pkgver}.tar.gz")
sha512sums=('0e22165fc3c045bbc3ab2e1c090728232ed9142797ddbd067b682b9bcfee93850deb76c23b78f49a776e3d099be25fa029673ce8e4a909b2f48860dcdc55803c')
b2sums=('c5881e6559a7fbcb40e1c43c7dbbfc1df9ac9445e83c70044855c192c3b04945ae125c0e06253ba76d3922a1f8fc6965810700ed57018864b319076ee9528d55')

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
