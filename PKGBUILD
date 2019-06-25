# Maintainer: Jiuyang Liu <liujiuyang1994@gmail.com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=riscv-pk-git
pkgver=1
pkgrel=1
pkgdesc='RISC-V proxy kernel and boot loader'
arch=(x86_64)
url='https://github.com/riscv/riscv-pk'
license=(custom)
depends=(riscv64-linux-gnu-binutils riscv64-linux-gnu-gcc riscv64-linux-gnu-glibc)
makedepends=(git)
groups=(risc-v)
source=("git+$url#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p build
  cd build
  export CFLAGS=""
  export RISCV=/usr/riscv64-linux-gnu
  "$srcdir/$pkgname/configure" \
    --prefix=/usr \
    --host=riscv64-linux-gnu \
    --enable-shared \
    --with-gcc \
    --with-gnu-as \
    --with-gnu-ld \
    --bindir=/usr/riscv64-linux-gnu/bin/ \
    --with-sysroot="/usr/riscv64-linux-gnu"
  make
}

package() {
   make -C build install DESTDIR="$pkgdir" PREFIX=/usr/riscv64-linux-gnu
}
