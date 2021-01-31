# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>

_pkgbasename=elfutils
pkgname=lib32-libelf-minimal-git
pkgver=0.182
pkgrel=1
pkgdesc="Libraries to handle ELF object files and DWARF debugging information (32-bit)"
arch=('x86_64')
url="https://sourceware.org/elfutils/"
license=('LGPL3' 'GPL' 'GPL3')
depends=('lib32-bzip2' 'lib32-zlib' 'lib32-xz' 'lib32-curl' 'libelf')
makedepends=('gcc-multilib')
provides=('lib32-elfutils' 'lib32-libelf')
conflicts=('lib32-elfutils' 'lib32-libelf')
replaces=('lib32-elfutils')
source=(git+https://sourceware.org/git/elfutils.git)
options=('staticlibs')
sha256sums=('SKIP')
#validpgpkeys=('47CC0331081B8BC6D0FD4DA08370665B57816A6A') # Mark J. Wielaard <mark@klomp.org>
#validpgpkeys+=('EC3CFE88F6CA0788774F5C1D1AA44BE649DE760A') # Mark Wielaard <mjw@gnu.org>

pkgver() {
  cd elfutils
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd elfutils
	
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
#  CFLAGS+=" -g"  # required for test-suite success
  
  autoreconf -fi

  ./configure --prefix=/usr --libdir=/usr/lib32 --disable-debuginfod --enable-deterministic-archives --disable-gconf --disable-debugpred --disable-gcov --disable-valgrind --without-valgrind --disable-valgrind-annotations --enable-maintainer-mode --disable-symbol-versioning
  make
}

package() {
  cd elfutils

  make DESTDIR=${pkgdir} install
  rm -rf ${pkgdir}/usr/{bin,include,share}
}
