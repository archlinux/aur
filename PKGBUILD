# Maintainer: Jiuyang Liu <liujiuyang1994@gmail.com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

_pkgname=riscv-pk
pkgname="$_pkgname-git"
pkgver=r644.9c61d29
pkgrel=1
pkgdesc='RISC-V proxy kernel and boot loader'
arch=(x86_64)
url="https://github.com/riscv-software-src/$_pkgname"
license=(custom)
depends=(spike-git)
makedepends=(riscv64-linux-gnu-gcc git)
groups=(risc-v)
options=('!strip')  # Because it would use the wrong target architecture of the strip tool.
source=("git+$url#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    mkdir -p build
    cd build
    export CFLAGS=""
    export RISCV=/usr/riscv64-linux-gnu
    "$srcdir/$_pkgname/configure" \
        --prefix=/usr \
        --host=riscv64-linux-gnu
    make
}

package() {
    make -C build install DESTDIR="$pkgdir"
    cd "$pkgdir"
    _bindir='usr/riscv64-unknown-elf/bin'
    mkdir -p "$_bindir"
    cd "$_bindir"
    ln -s ../../riscv64-linux-gnu/bin/pk .
    ln -s ../../riscv64-linux-gnu/bin/bbl .
}
