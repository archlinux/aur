# Maintainer: mirh
# Contributor: sl1pkn07
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Manolis Tzanidakis <manolis@archlinux.org>

_pkgbase=libieee1284
pkgname=lib32-libieee1284
pkgver=0.2.11
_tag=${pkgver//\./_}
pkgrel=6
pkgdesc="A library to query devices connected in parallel port"
arch=('x86_64')
license=('GPL2')
url="https://github.com/twaugh/libieee1284"
depends=('lib32-glibc' "${_pkgbase}=${pkgver}")
makedepends=('gcc-multilib')
source=(libieee1284-$pkgver.zip::https://github.com/twaugh/libieee1284/archive/V$_tag.zip)
sha1sums=('5e24fb4e69652e2460e24af0b7ef6ca960c78965')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'  
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${_pkgbase}-${_tag}"

  # We don't want to builkd docs
  sed -ie '42,93d' Makefile.am

  ./bootstrap
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --without-python
  make
}

package() {
  cd "${_pkgbase}-${_tag}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/include
  mv "${pkgdir}/usr/bin/libieee1284_test" "${pkgdir}/usr/bin/libieee1284_test-32"
}
