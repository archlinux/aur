# Maintainer: Xiaotian Wu <yetist@gmail.com>

_target=loongarch64-linux-gnu
pkgname=$_target-binutils
pkgver=2.39
_pkgdate=20220807
pkgrel=1
pkgdesc='Assemble and manipulate binary and object files for 64-bit LoongArch'
arch=(x86_64)
url='https://www.gnu.org/software/binutils/'
license=(GPL)
groups=(loongarch)
makedepends=(setconf)
source=("https://github.com/yetist/binutils-gdb/releases/download/v${_pkgdate}/binutils-${pkgver}-${_pkgdate}.tar.xz")
sha256sums=('e399f8e780eb1fea1ecd70117c3d188bb799eded194a58bf1fab978b9f1f94d2')

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
    --disable-multilib \
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
  make -O -C "binutils-$pkgver" LDFLAGS="" -k check || true
}

package() {
  make -C "binutils-$pkgver" DESTDIR="$pkgdir" install

  # Remove info documents that conflict with host version
  rm -r "$pkgdir/usr/share/info"

  rm "$pkgdir"/usr/lib/bfd-plugins/libdep.so
  rm "$pkgdir"/usr/include/gdb/jit-reader.h
  rm -rf "$pkgdir"/usr/share/{gdb,man}
}
