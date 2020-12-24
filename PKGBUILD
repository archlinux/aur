# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>

pkgname=(elfutils-minimal-git libelf-minimal-git)
pkgver=0.182
pkgrel=1
pkgdesc='Utilities to handle ELF object files and DWARF debugging information'
arch=(x86_64)
url='https://sourceware.org/elfutils/'
license=(LGPL3 GPL GPL3)
makedepends=(gcc-libs zlib bzip2 xz libmicrohttpd sqlite libarchive curl)
options=(staticlibs)
source=(git+https://sourceware.org/git/elfutils.git)
sha512sums=('SKIP')
#validpgpkeys=('47CC0331081B8BC6D0FD4DA08370665B57816A6A')  # Mark J. Wielaard <mark@klomp.org>
#validpgpkeys+=('EC3CFE88F6CA0788774F5C1D1AA44BE649DE760A') # Mark Wielaard <mjw@gnu.org>

pkgver() {
   cd libelf
   git describe --tags | sed 's/-/+/g'
}

build() {
  cd libelf

#  CFLAGS+=" -g"  # required for test-suite success
  ./configure --prefix=/usr --program-prefix="eu-" --enable-deterministic-archives --disable-gconf --disable-debugpred --disable-gcov --disable-valgrind --without-valgrind --disable-valgrind-annotations

  make
}

#check() {
#  cd libelf

  # Some tests fail due to limited capabilities of build chroot
#  make check || :
#}

package_elfutils-minimal-git() {
  depends=(gcc-libs zlib bzip2 xz libmicrohttpd sqlite libarchive curl)

  cd libelf
  make DESTDIR="$pkgdir" install

  mkdir "$srcdir/libelf" 
  mv "$pkgdir"/usr/{lib,include} "$srcdir/libelf/"
}

package_libelf-minimal-git() {
  pkgdesc='Libraries to handle ELF object files and DWARF debugging information'
  depends=(gcc-libs zlib bzip2 xz curl)

  mv libelf "$pkgdir/usr"
}
