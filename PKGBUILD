# Maintainer: Huayu ZHANG <zhanghuayu.dev@gmail.com>

pkgname=qemu-full-aarch64
pkgver=7.2
pkgrel=1
pkgdesc="qemu full build from source for Arch Linux ARM (aarch64) with KVM enabled"
arch=('arm64')
url="https://www.qemu.org/"
license=('LGPL')
depends=('ninja' 'pixman' 'meson' 'gtk3-debug' 'capstone' 'vte' 'sdl2' 'glib2-debug' 'python' 'bzip2-debug' 'zlib-debug' 'dtc' 'slirp')
source=("https://github.com/qemu/qemu/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('36b38ab8e6596d75ae2e12f4f8fae897781c8f34d385983ad92520493e2f7fd6')

prepare() {
    cd "$srcdir/v$pkgver"
    mkdir full-build
    mkdir aarch64-kvm
    
}

build() {
    cd "$srcdir/v$pkgver"

    # build full first
    cd full-build

    ./configure \
        --prefix=/usr
    # edit /etc/makepkg.conf `MAKEFLAG` to speed up build
    make

    # build aarch64 with kvm  support
    cd ../aarch64-kvm

    ./configure \
        --prefix=/usr
        --target-list=aarch64-softmmu \
        --enable-fdt \
        --enable-kvm

    make
}

package() {
    cd "$srcdir/v$pkgver"
    cd full-build
    make DESTDIR="$pkgdir" install

    cd ../aarch64-kvm
    make DESTDIR="$pkgdir" install
}

