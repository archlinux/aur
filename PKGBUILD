# Maintainer: Andras Biro <bbandi86@gmail.com>
# Contributor: Alex Forencich <alex at alexforencich dot com>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: danst0 <danst0@west.de>
_pkgnamenoplatform=libc
_pkgnamenobrand=avr-${_pkgnamenoplatform}
pkgname=${_pkgnamenobrand}-atmel
pkgver=1.8.0
_atmelver=3.4.4
pkgrel=1
pkgdesc="The C runtime library for the AVR family of microcontrollers"
url="http://www.atmel.com/tools/ATMELAVRTOOLCHAINFORLINUX.aspx"
arch=('x86_64' 'i686')
license=('BSD' 'custom')
depends=('avr-gcc-atmel')
conflicts=("avr-libc")
provides=("avr-libc=$pkgver")
options=('!strip' 'staticlibs')
source=("http://distribute.atmel.no/tools/opensource/Atmel-AVR-GNU-Toolchain/${_atmelver}/${_pkgnamenobrand}-${pkgver}.tar.bz2")
md5sums=('9afc252d6457957622909af9f197abe8')

_dirname="libc/avr-libc"

build() {
  #replace headers - it's not necessary, it's replaced in the tarball already
#   cd ${srcdir}/avr/
#   for i in io[0-9a-zA-Z]*.h
#   do
#     cp --verbose --force $i ../${_dirname}/include/avr
#   done
  
  cd ${srcdir}/${_dirname}
  ./bootstrap
  ./configure --host=avr\
              --prefix="/usr" \
              --disable-versioned-doc
  make
}

package() {
  cd ${srcdir}/${_dirname}
  make DESTDIR=${pkgdir} install
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}

# vim:set ts=2 sw=2 et: