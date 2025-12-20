# Maintainer: Martin Liska <martin.liska@hey.com>

_target=loongarch64-elf
pkgname=$_target-binutils
pkgver=2.45.1
pkgrel=1
pkgdesc='Assemble and manipulate binary and object files for 32-bit and 64-bit LoongArch'
arch=(x86_64)
url='https://gnu.org/software/binutils/'
license=(GPL-2.0-or-later)
groups=(loongarch64)
depends=(
  glibc
  libelf
  zlib libz.so
  zstd libzstd.so
)
makedepends=(setconf)
source=("https://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.xz")
sha256sums=('5fe101e6fe9d18fdec95962d81ed670fdee5f37e3f48f0bef87bddf862513aa5')
b2sums=('1ccab38659ec47f9100b61322627345fe79ebd04ed0b1e872c988edded4d292d7c9ac33d9f6ea47bf265ec823dfba60da0e84374900c15ec89e3aa9280ac020c')

prepare() {
  setconf binutils-$pkgver/libiberty/configure ac_cpp "'\$CPP \$CPPFLAGS -O2'"
}

build() {
  cd "binutils-$pkgver"

  unset CPPFLAGS
  ./configure \
    --disable-gprofng \
    --disable-nls \
    --enable-deterministic-archives \
    --enable-gold \
    --enable-ld=default \
    --enable-multilib \
    --enable-new-dtags \
    --enable-plugins \
    --prefix=/usr \
    --target=$_target \
    --with-gnu-as \
    --with-gnu-ld \
    --with-sysroot=/usr/$_target \
    --with-system-zlib
  make -O
}

check() {
  # * Unset LDFLAGS as testsuite makes assumptions about which ones are active.
  # * Do not abort on errors - manually check log files.
  # Currently failing tests:
  # FAIL: replacing non-deterministic member (wrong size, expected: 1120)
  make -O -C "binutils-$pkgver" LDFLAGS="" -k check || true
}

package() {
  make -C "binutils-$pkgver" DESTDIR="$pkgdir" install

  # Remove info documents that conflict with host version
  rm -r "$pkgdir/usr/share/info"

  rm "$pkgdir"/usr/lib/bfd-plugins/libdep.so
}

# getver: gnu.org/software/binutils
