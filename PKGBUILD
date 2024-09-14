# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libkeccak-musl
_pkgname=libkeccak
pkgver=1.4.1
pkgrel=1
pkgdesc='Keccak-family hashing library (musl-version)'
arch=('x86_64' 'i686')
url='https://codeberg.org/maandree/libkeccak'
license=('custom:ISC')
_compiler=gcc
depends=('musl' "${_compiler}")
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
b2sums=('b2863d4050aaab16717ce3bfb6461b2e0cc6dad7d6a44b27c382218e26c23aef50f3d6215a5d2418b0d7b5740eb5bbb67f30ed7c716d1ce987e2742d02ac5f4a')

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
