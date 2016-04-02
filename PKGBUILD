# Maintainer: Luca Stefani <luca.stefani.ge1@gmail.com>

pkgname=make3
_pkgname=make
pkgver=3.82
pkgrel=1
conflicts=('make')
provides=("make=${pkgver}-${pkgrel}")
pkgdesc="GNU make utility to maintain groups of programs"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/make"
license=('GPL3')
depends=('glibc' 'sh')
install=${_pkgname}.install
source=(ftp://ftp.gnu.org/gnu/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2
        make-3.82-bug30612.patch
        make-3.82-bug30723.patch
        make-3.82-sort-blank.patch
        make-3.82-makeflags.patch
        make-3.82-expensive_glob.patch
        make-3.82-dont-prune-intermediate.patch)
md5sums=('1a11100f3c63fcf5753818e59d63088f'
         '8714ba22911a58ab3eb42ac3f4c6c3bd'
         '662e6450e19a5acdaa5c9fcb8ad78dea'
         '7d01a99f389d8f08dec93ed479071ee4'
         'bc12ad4d0c6e6c0e72d9fb61054f446b'
         'e58d4211c5b29d7d927a304d082849e7'
         '45ac9e987f4bf16c0d7e1685db943917')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  # http://savannah.gnu.org/bugs/?30612
  patch -Np1 -i $srcdir/make-3.82-bug30612.patch

  # http://savannah.gnu.org/bugs/?30723
  patch -Np1 -i $srcdir/make-3.82-bug30723.patch

  # https://bugs.archlinux.org/task/22733 (fix from Fedora)
  patch -Np1 -i $srcdir/make-3.82-sort-blank.patch

  # https://savannah.gnu.org/bugs/?33873
  patch -Np0 -i $srcdir/make-3.82-makeflags.patch

  # http://lists.gnu.org/archive/html/bug-make/2011-04/msg00002.html
  patch -Np0 -i $srcdir/make-3.82-expensive_glob.patch

  # https://savannah.gnu.org/bugs/?30653
  patch -Np0 -i $srcdir/make-3.82-dont-prune-intermediate.patch

  ./configure --prefix=/usr
  make
}

check() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make check
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
