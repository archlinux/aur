# Maintainer: Xiaotian Wu <yetist@gmail.com>

_target=loongarch64-linux-gnu
pkgname=$_target-binutils
pkgver=2.37.r107028.g6672b06b122
_pkgver=2.37
pkgrel=1
pkgdesc='Assemble and manipulate binary and object files for 64-bit LoongArch'
arch=(x86_64)
url='https://www.gnu.org/software/binutils/'
license=(GPL)
groups=(loongarch)
makedepends=(setconf)
source=('git+https://github.com/loongson/binutils-gdb.git#branch=loongarch-2_37')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/binutils-gdb"
	printf "${_pkgver}.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    setconf binutils-gdb/libiberty/configure ac_cpp "'\$CPP \$CPPFLAGS -O2'"
}

build() {
	cd "$srcdir/binutils-gdb"

    unset CPPFLAGS
    ./configure \
    --disable-nls \
    --enable-deterministic-archives \
    --disable-gold \
    --enable-ld=default \
    --disable-multilib \
    --enable-plugins \
    --prefix=/usr \
    --target=$_target \
    --with-gnu-as \
    --with-gnu-ld \
    --disable-gdb \
    --disable-werror \
    --with-sysroot=/usr/$_target \
    --with-system-zlib
    make
}

check() {
  # * Unset LDFLAGS as testsuite makes assumptions about which ones are active.
  # * Do not abort on errors - manually check log files.
  make -C "binutils-gdb" LDFLAGS="" -k check
}

package() {
  make -C "binutils-gdb" DESTDIR="$pkgdir" install

  # Remove info documents that conflict with host version
  rm -r "$pkgdir/usr/share/info"

  rm -r "$pkgdir/usr/lib/bfd-plugins/libdep.so"
  rm -r "$pkgdir/usr/include"
  rm -r "$pkgdir/usr/lib"
}
