# Upstream Maintainer: josephgbr <rafael.f.f1@gmail.com>
# Container: Florian Pritz <flo@xssn.at>
# Maintainer: Fantix King <fantix.king at gmail.com>

_pkgbase=curl
pkgname=libx32-${_pkgbase}
pkgver=7.28.0
pkgrel=1.1
pkgdesc="An URL retrieval utility and library (x32 ABI)"
arch=('x86_64')
url="http://curl.haxx.se"
license=('MIT')
depends=('libx32-zlib' 'libx32-openssl' 'libx32-libssh2' "${_pkgbase}")
makedepends=('gcc-multilib-x32' 'ca-certificates')
options=('!libtool')
source=("http://curl.haxx.se/download/${_pkgbase}-${pkgver}.tar.gz")
md5sums=('cbdc0a79bdf6e657dd387c3d88d802e3')

build() {
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  cd ${_pkgbase}-${pkgver}

  ./configure \
      --prefix=/usr \
      --mandir=/usr/share/man \
      --disable-dependency-tracking \
      --disable-ldap \
      --disable-ldaps \
      --enable-ipv6 \
      --disable-manual \
      --enable-versioned-symbols \
      --enable-threaded-resolver \
      --without-libidn \
      --with-random=/dev/urandom \
      --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt \
      --libdir=/usr/libx32
      
  make
}

package() {
  cd ${_pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{share,bin}
  #remove all headers, except for curlbuild.h
  find "${pkgdir}/usr/include/curl" -type f -not -name curlbuild.h -delete
  mv "${pkgdir}/usr/include/curl/curlbuild.h" "${pkgdir}/usr/include/curl/curlbuild-x32.h"

  install -dm755 "${pkgdir}/usr/share/licenses"
  ln -s ${_pkgbase} "${pkgdir}/usr/share/licenses/${pkgname}"
}
