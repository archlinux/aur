# Maintainer: Jonas Bewig <jomosoto at proton dot me>

# Based on the riscv64-elf-binutils package by:
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

_target=cr16-elf
pkgname=$_target-binutils
pkgver=2.42
pkgrel=1
pkgdesc='A set of programs to assemble and manipulate binary and object files for the cr16 (bare-metal) target'
arch=(x86_64)
url='https://www.gnu.org/software/binutils/'
license=(GPL)
depends=(zlib)
source=("https://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.bz2"{,.sig})
sha512sums=('d2c6d264bbeaaaf2aad1fa3fc417c1841a5dd4a299fa47c47d15adb821c22dae733e58f19ebcfea3b0c5890ba56e4a5f92ab55128a572d585bcd5172b63f456c'
            'SKIP')
validpgpkeys=('EAF1C276A747E9ED86210CBAC3126D3B4AE55E93'  # Tristan Gingold <gingold@adacore.com>
              '3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F') # Nick Clifton (Chief Binutils Maintainer) <nickc@redhat.com>

build() {
  cd binutils-$pkgver

  ./configure --target=$_target \
              --with-sysroot=/usr/$_target \
              --prefix=/usr \
              --enable-multilib \
              --disable-nls \
              --enable-ld=default \
              --enable-gold \
              --enable-plugins \
              --enable-deterministic-archives

  make
}

check() {
  cd binutils-$pkgver

  # unset LDFLAGS as testsuite makes assumptions about which ones are active
  # do not abort on errors - manually check log files
  make LDFLAGS="" -k check || true
}

package() {
  cd binutils-$pkgver

  make DESTDIR="$pkgdir" install

  # Remove file conflicting with host binutils and manpages for MS Windows tools
  rm "$pkgdir"/usr/share/man/man1/$_target-{dlltool,windres,windmc}*
  rm "$pkgdir"/usr/lib/bfd-plugins/libdep.so

  # Remove info documents that conflict with host version
  rm -r "$pkgdir"/usr/share/info
}

