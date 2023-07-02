# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libkeccak-musl
_pkgname=libkeccak
pkgver=1.4
pkgrel=1
pkgdesc='Keccak-family hashing library (musl-version)'
arch=('x86_64' 'i686')
url='https://codeberg.org/maandree/libkeccak'
license=('custom:ISC')
_compiler=gcc
depends=('musl' "${_compiler}")
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
b2sums=('645ae0cb8bb8c8f512487eec876bc63bd8c2e2a5243e3ebe32aca2e4cc79a3271a18a8295d097f6a1e536444bcf1af6331507ccf814bab2ae838c005434ca84f')

prepare() {
  cd ${_pkgname}
  sed -i 's#FLAGS\s\+=#FLAGS +=#g' optimised.mk
}

build() {
  cd ${_pkgname}
  make CONFIGFILE=optimised.mk PREFIX=/usr/lib/musl CC="musl-${_compiler} -std=c99"
}

check() {
  cd ${_pkgname}
  make CONFIGFILE=optimised.mk PREFIX=/usr/lib/musl CC="musl-${_compiler} -std=c99" check
}

package() {
  cd ${_pkgname}
  make CONFIGFILE=optimised.mk PREFIX=/usr/lib/musl DESTDIR="${pkgdir}" install
  rm -r -- "${pkgdir}/usr/lib/musl/share"
}
