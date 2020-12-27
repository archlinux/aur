# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>

pkgname=(libelf-minimal-git)
pkgver=0.182
pkgrel=1
pkgdesc='Utilities to handle ELF object files and DWARF debugging information'
arch=(x86_64)
url='https://sourceware.org/elfutils/'
license=(LGPL3 GPL GPL3)
depends=('glibc' 'bzip2' 'xz' 'zlib' 'sh')
makedepends=('git')
provides=('elfutils' 'libelf')
conflicts=('elfutils' 'libelf')
options=(staticlibs)
source=(git+https://sourceware.org/git/elfutils.git)
sha512sums=('SKIP')
#validpgpkeys=('47CC0331081B8BC6D0FD4DA08370665B57816A6A')  # Mark J. Wielaard <mark@klomp.org>
#validpgpkeys+=('EC3CFE88F6CA0788774F5C1D1AA44BE649DE760A') # Mark Wielaard <mjw@gnu.org>

pkgver() {
   cd elfutils
   git describe --tags | sed 's/-/+/g'
}

build() {
  cd elfutils

  autoreconf -fi
#  CFLAGS+=" -g"  # required for test-suite success
  ./configure --prefix=/usr --program-prefix="eu-" --enable-deterministic-archives --disable-gconf --disable-debugpred --disable-gcov --disable-valgrind --without-valgrind --disable-valgrind-annotations --enable-maintainer-mode --disable-debuginfod --disable-symbol-versioning

  make
}

#check() {
#  cd elfutils

  # Some tests fail due to limited capabilities of build chroot
#  make check || :
#}

package_libelf-minimal-git() {

  cd elfutils
  make DESTDIR="$pkgdir" install
}
