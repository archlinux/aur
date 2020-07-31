# Maintainer: Florian Pritz <bluewind@xinu.at>

_pkgbasename=libidn
pkgname=lib32-$_pkgbasename
pkgver=1.36
pkgrel=1
pkgdesc="Implementation of the Stringprep, Punycode and IDNA specifications (32 bit)"
url="https://www.gnu.org/software/libidn/"
arch=('x86_64')
license=('GPL3' 'LGPL')
depends=('lib32-glibc' "$_pkgbasename>=$pkgver")
source=("https://ftp.gnu.org/gnu/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.gz"{,.sig})
sha512sums=('0d66e10bf7a8de4b27f692a427d2c8e901b8bed73b0a36268d8f939205df81f6a30f0634fd3b87370d4e81c1327c0b10391fa122a0a5459c32a3541b8a2149ad'
            'SKIP')
validpgpkeys=('9AA9BDB11BB1B99A21285A330664A76954265E8C'  # Simon Josefsson <simon@josefsson.org>
              '1CB27DBC98614B2D5841646D08302DB6A2670428') # Tim Rühsen <tim.ruehsen@gmx.de>

prepare() {
  cd ${_pkgbasename}-${pkgver}
  # https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=cca32830b5
  sed -i '/pragma weak pthread_create/d' {lib/,}gltests/glthread/thread.h
}

build() {
  cd ${_pkgbasename}-${pkgver}
  ./configure --prefix=/usr --libdir=/usr/lib32 CC='gcc -m32'
  make
}

package() {
  cd ${_pkgbasename}-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
