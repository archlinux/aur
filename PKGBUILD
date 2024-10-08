# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libkeccak-musl
_pkgname=libkeccak
pkgver=1.4.2
pkgrel=1
pkgdesc='Keccak-family hashing library (musl-version)'
arch=('x86_64' 'i686')
url='https://codeberg.org/maandree/libkeccak'
license=('custom:ISC')
_compiler=gcc
depends=('musl' "${_compiler}")
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
b2sums=('619cd806261b3d764d54912a6a760f266422e371e7140a4446053e7f3bae19957539e15d027d71d2f63b9f7a994bd4606548a6402d6454f29e351b0e1a4c0d43')

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
