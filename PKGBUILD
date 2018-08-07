# Maintainer: Felix Schindler <aur at felixschindler dot net>
# Contributor: Dan McGee <dan@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
#
# There is a bug in valgrind 3.13 which arises when used from qtcreater, see
# https://stackoverflow.com/questions/45531851/valgrind-in-qt-creator#45551442

pkgname=valgrind312
_pkgname=valgrind
pkgver=3.12.0
pkgrel=3
pkgdesc='A tool to help find memory-management problems in programs (version 3.12.0)'
arch=(i686 x86_64)
license=(GPL)
url='http://valgrind.org/'
depends=('glibc=2.28' 'perl')
makedepends=(gdb openmpi)
optdepends=('openmpi: MPI support')
options=(!emptydirs)
source=(http://valgrind.org/downloads/$_pkgname-$pkgver.tar.bz2)
sha1sums=('7a6878bf998c60d1e377a4f22ebece8d9305bda4')
provides=("${_pkgname}=${pkgver}")
conflicts=("$_pkgname")
replaces=("$_pkgname")

build() {
  # valgrind does not like stack protector flags
  CPPFLAGS=${CPPFLAGS/-D_FORTIFY_SOURCE=2/}
  CFLAGS=${CFLAGS/-fstack-protector-strong/}
  CXXFLAGS=${CXXFLAGS/-fstack-protector-strong/}

  cd $_pkgname-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man --with-mpicc=mpicc
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
