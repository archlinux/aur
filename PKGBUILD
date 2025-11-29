# Maintainer: Martin Chang <marty188586@gmail.com>

pkgbase=python-luwen
pkgname=(python-luwen luwencpp)
pkgver=0.7.19
pkgrel=1
pkgdesc="Python package for the tenstorrent system interface library"
arch=('x86_64')
url='https://github.com/tenstorrent/luwen'
license=('Apache')
makedepends=(gcc rust make python python-pip maturin python-installer protobuf)
depends=()
provides=('python-luwen=0.7.18')
source=("luwen::git+https://github.com/tenstorrent/luwen.git")
sha256sums=('SKIP')

build() {
    cd luwen

    mkdir -p pybuild
    DEST_DIR="$(pwd)/pybuild"
    cd bind/pyluwen
    make whl

    cd ../libluwen
    cargo build --release
}

package_python-luwen() {
    cd luwen
    python -m installer --destdir="$pkgdir" target/wheels/*-linux*_x86_64.whl
}


package_luwencpp() {
    cd luwen
    install -Dm755 target/release/libluwen.so "$pkgdir/usr/lib/libluwen.so"
    install -Dm644 target/release/luwen.h "$pkgdir/usr/include/luwen.h"
}
