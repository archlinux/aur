# Maintainer: Martin Chang <marty188586@gmail.com>

pkgbase=python-luwen-git
pkgname=(python-luwen-git luwencpp-git)
pkgver=0.7.16.r0.gfbad73b
pkgrel=1
pkgdesc="Python package for the tenstorrent system interface library"
arch=('x86_64')
url='https://github.com/tenstorrent/luwen'
license=('Apache')
makedepends=(gcc rust make python python-pip maturin python-installer protobuf)
depends=()
provides=("python-luwen")
source=("luwen::git+https://github.com/tenstorrent/luwen.git")
sha256sums=('SKIP')

pkgver() {
  cd luwen
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

build() {
    cd luwen

    mkdir -p pybuild
    DEST_DIR="$(pwd)/pybuild"
    cd bind/pyluwen
    make whl

    cd ../libluwen
    cargo build --release
}

package_python-luwen-git() {
    cd luwen
    python -m installer --destdir="$pkgdir" target/wheels/*-linux*_x86_64.whl
}


package_luwencpp-git() {
    cd luwen
    install -Dm755 target/release/libluwen.so "$pkgdir/usr/lib/libluwen.so"
    install -Dm644 target/release/luwen.h "$pkgdir/usr/include/luwen.h"
}
