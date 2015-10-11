# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: TryA <tryagainprod@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-libproxy
pkgver=0.4.11
pkgrel=1
pkgdesc='A library that provides automatic proxy configuration management'
arch=('x86_64')
url='http://libproxy.googlecode.com'
license=('LGPL')
depends=('lib32-gcc-libs' 'libproxy')
makedepends=('cmake' 'gcc-multilib' 'lib32-zlib')
source=("http://libproxy.googlecode.com/files/libproxy-${pkgver}.tar.gz")
md5sums=('3cd1ae2a4abecf44b3f24d6639d2cd84')

build() {
  cd libproxy-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_C_FLAGS="${CFLAGS}" \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS" \
    -DCMAKE_SKIP_RPATH='TRUE' \
    -DLIBEXEC_INSTALL_DIR='/usr/lib32/libproxy' \
    -DLIB_SUFFIX='32' \
    -DPERL_VENDORINSTALL='FALSE' \
    -DWITH_{GNOME3,MOZJS,NATUS,NM,KDE4,PERL,PYTHON,WEBKIT}='FALSE'
  make
}

package() {
  cd libproxy-${pkgver}/build

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}

# vim: ts=2 sw=2 et:
