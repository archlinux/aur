# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Johan Förberg <johan@forberg.se>

_pkgname=zstd
pkgname=lib32-zstd-git
pkgver=1.4.7
pkgrel=1
pkgdesc='Zstandard - Fast real-time compression algorithm (32-bit)'
url='https://www.zstd.net/'
arch=('x86_64')
license=('BSD' 'GPL2')
depends=('zstd' 'lib32-zlib' 'lib32-xz' 'lib32-lz4')
#makedepends=('gtest')
provides=(lib32-zstd)
conflicts=(lib32-zstd)
source=('git://github.com/facebook/zstd.git#branch=dev')
sha256sums=('SKIP')
sha512sums=('SKIP')
b2sums=('SKIP')

pkgver() {
    cd zstd
    git describe --tags | sed 's/-/+/g'
}

build() {
  cd zstd
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  make
  make zstdmt
  make -C contrib/pzstd
}

#check() {
#  cd ${_pkgname}-${pkgver}
#  make check
#  make -C contrib/pzstd test
#}

package() {
  cd zstd
  make \
    PREFIX=/usr \
    LIBDIR=/usr/lib32 \
    PKGCONFIGDIR=/usr/lib32/pkgconfig \
    DESTDIR="${pkgdir}" \
    install
  rm -rf "${pkgdir}"/usr/{share,include,bin}
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
