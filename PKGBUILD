# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Christian Hesse <mail@eworm.de>

_pkgname=libxcrypt
pkgname=lib32-${_pkgname}-compat
pkgver=4.4.28
pkgrel=3
pkgdesc='Modern library for one-way hashing of passwords: legacy API functions (32 bit library)'
arch=('x86_64')
url='https://github.com/besser82/libxcrypt/'
license=('GPL')
depends=('lib32-glibc' 'lib32-libxcrypt')
provides=('libcrypt.so.1')
options=(!emptydirs)
validpgpkeys=('678CE3FEE430311596DB8C16F52E98007594C21D') # Björn 'besser82' Esser
source=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('9e936811f9fad11dbca33ca19bd97c55c52eb3ca15901f27ade046cc79e69e87'
            'SKIP')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd ${_pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --disable-static \
    --enable-hashes=strong,glibc \
    --enable-obsolete-api=glibc \
    --disable-failure-tokens
  make
}

#check() {
#  cd ${_pkgname}-${pkgver}
#  make check 
#}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/usr/{include,share/man,lib32/pkgconfig}
  rm "$pkgdir"/usr/lib32/lib{,x}crypt.so
}
