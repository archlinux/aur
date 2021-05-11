# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Emil Renner Berthing <aur@esmil.dk>

_target=riscv64-linux-gnu
pkgname=$_target-binutils
pkgver=2.36
pkgrel=1
pkgdesc='Assemble and manipulate binary and object files for 32-bit and 64-bit RISC-V'
arch=(x86_64)
url='https://gnu.org/software/binutils/'
license=(GPL)
groups=(risc-v)
makedepends=(setconf)
source=("https://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.xz")
sha512sums=('0b89b70d4ad5cfe5bd0011dc7e342ae9de96efdbfc3442a0d6b5f7660e38bbcad36f2c72ba8f074323f02bde022ff1cd723ae99f0ea55cf94ee2dbbc0e4efdb2')

prepare() {
  setconf binutils-$pkgver/libiberty/configure ac_cpp "'\$CPP \$CPPFLAGS -O2'"
}

build() {
  cd "binutils-$pkgver"

  unset CPPFLAGS
  ./configure \
    --disable-nls \
    --enable-deterministic-archives \
    --enable-gold \
    --enable-ld=default \
    --enable-multilib \
    --enable-plugins \
    --prefix=/usr \
    --target=$_target \
    --with-gnu-as \
    --with-gnu-ld \
    --with-sysroot=/usr/$_target \
    --with-system-zlib
  make
}

check() {
  # * Unset LDFLAGS as testsuite makes assumptions about which ones are active.
  # * Do not abort on errors - manually check log files.
  make -C "binutils-$pkgver" LDFLAGS="" -k check
}

package() {
  make -C "binutils-$pkgver" DESTDIR="$pkgdir" install

  # Remove info documents that conflict with host version
  rm -r "$pkgdir/usr/share/info"

  rm "$pkgdir"/usr/lib/bfd-plugins/libdep.so
}

# getver: gnu.org/software/binutils
