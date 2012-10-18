# Upstream Maintainer: josephgbr <rafael.f.f1@gmail.com>
# Maintainer: Fantix King <fantix.king at gmail.com>

_pkgbase=db
pkgname=libx32-${_pkgbase}
pkgver=5.3.21
pkgrel=1.1
pkgdesc="The Berkeley DB embedded database system (x32 ABI)"
arch=('x86_64')
url="http://www.oracle.com/technology/software/products/berkeley-db/index.html"
license=('custom')
depends=('libx32-gcc-libs' "${_pkgbase}")
makedepends=('gcc-multilib-x32')
options=('!libtool')
source=("http://download.oracle.com/berkeley-db/db-${pkgver}.tar.gz")
sha1sums=('32e43c4898c8996750c958a90c174bd116fcba83')

build() {
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  cd ${_pkgbase}-${pkgver}/build_unix
  ../dist/configure \
    --prefix=/usr \
    --enable-compat185 \
    --enable-shared \
    --enable-static \
    --enable-cxx \
    --enable-dbm \
    --libdir=/usr/libx32
  make LIBSO_LIBS=-lpthread
}

package() {
  cd ${_pkgbase}-${pkgver}/build_unix
  make DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}"/usr/{docs,include,bin}

  # install license
  install -dm755 "$pkgdir"/usr/share/licenses
  ln -s ${_pkgbase} "${pkgdir}"/usr/share/licenses/${pkgname}
}
