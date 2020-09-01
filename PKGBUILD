# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Emil Renner Berthing <aur@esmil.dk>

_target=riscv64-linux-gnu
pkgname=$_target-binutils
pkgver=2.35
pkgrel=1
pkgdesc='Assemble and manipulate binary and object files for 32-bit and 64-bit RISC-V'
arch=(x86_64)
url='https://gnu.org/software/binutils/'
license=(GPL)
groups=(risc-v)
makedepends=(setconf)
source=("https://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.xz")
sha512sums=('9f222e4ab6720036402d03904fb11b73ab87714b85cd84997f7d357f405c7e10581d70202f9165a1ee0c70538632db27ecc9dfe627dddb1e6bc7edb1537cf786')

prepare() {
  setconf binutils-$pkgver/libiberty/configure ac_cpp="'\$CPP \$CPPFLAGS -O2'"
}

build() {
  cd "binutils-$pkgver"

  unset CPPFLAGS
  ./configure \
    --target=$_target \
    --prefix=/usr \
    --with-sysroot=/usr/$_target \
    --with-gnu-as \
    --with-gnu-ld \
    --with-system-zlib \
    --disable-nls \
    --enable-multilib \
    --enable-ld=default \
    --enable-gold \
    --enable-plugins \
    --enable-deterministic-archives
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
}

# getver: gnu.org/software/binutils
# vim: ts=2 sw=2 et:
