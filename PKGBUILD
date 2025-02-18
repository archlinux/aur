# Maintainer: hexchain <arch at hexchain.org>

pkgname=libkrun
pkgver=1.10.1
pkgrel=1
pkgdesc="A dynamic library providing Virtualization-based process isolation capabilities"
url='https://github.com/containers/libkrun'
arch=('x86_64')
license=('Apache-2.0')
makedepends=('cargo' 'patchelf' 'clang')
depends=('glibc' 'gcc-libs' 'libkrunfw' 'pipewire' 'virglrenderer')
source=("https://github.com/containers/libkrun/archive/refs/tags/v$pkgver/$pkgname-$pkgver.tar.gz")
options=(!debug)

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export CARGO_TARGET_DIR=target
    make GPU=1 BLK=1 NET=1 SND=1
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr LIBDIR_Linux=lib install
}
sha256sums=('e5b9ab0249402c429a37ce405449ab451d4ca52543a03ecbd3cca3effe123e24')
