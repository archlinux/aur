# Maintainer: Gökçe Aydos <aur_2023_01@aydos.de>
# Adapted from ABS:
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

_target=riscv64-elf
pkgname=$_target-binutils-git
pkgver=gdb.13.branchpoint.r268.gb46632ca160
pkgrel=1
pkgdesc='A set of programs to assemble and manipulate binary and object files for the RISCV64 (bare-metal) target'
arch=(x86_64)
url='https://www.gnu.org/software/binutils/'
license=(GPL)
depends=(zlib)
makedepends=(git)
source=("git+https://sourceware.org/git/binutils-gdb.git"
)
sha512sums=(SKIP)
conflicts=(riscv64-elf-binutils)
provides=(riscv64-elf-binutils)

pkgver() {
  cd binutils-gdb
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd binutils-gdb
  sed -i '/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/' libiberty/configure
}

build() {
  cd binutils-gdb
  ./configure --target=$_target \
              --with-sysroot=/usr/$_target \
              --prefix=/usr \
              --enable-multilib \
              --enable-interwork \
              --with-gnu-as \
              --with-gnu-ld \
              --disable-nls \
              --enable-ld=default \
              --enable-gold \
              --enable-plugins \
              --enable-deterministic-archives

  make
}

check() {
  cd binutils-gdb

  # unset LDFLAGS as testsuite makes assumptions about which ones are active
  # do not abort on errors - manually check log files
  make LDFLAGS="" -k check || true
}

package() {
  cd binutils-gdb

  make DESTDIR="$pkgdir" install

  # Remove file conflicting with host binutils and manpages for MS Windows tools
  rm "$pkgdir"/usr/share/man/man1/$_target-{dlltool,windres,windmc}*
  rm "$pkgdir"/usr/lib/bfd-plugins/libdep.so

  # Remove info documents that conflict with host version
  rm -r "$pkgdir"/usr/share/info
}
