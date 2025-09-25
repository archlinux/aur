# Maintainer: Martin Chang <marty188586@gmail.com>

pkgbase=python-luwen-git
pkgname=(python-luwen-git luwencpp-git)
pkgver=0.7.13.r10.gfc6ba05
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
    DEST_DIR="$(pwd)/pybuild" make whl

    cd crates/luwencpp
    cargo build --release
}

package_python-luwen-git() {
    cd luwen
    python -m installer --destdir="$pkgdir" pybuild/*-linux*_x86_64.whl
}


package_luwencpp-git() {
    cd luwen
    install -Dm755 target/release/libluwencpp.so "$pkgdir/usr/lib/libluwencpp.so"
    install -Dm644 target/release/luwen.h "$pkgdir/usr/include/luwen.h"
    # HCAK: Patch luwen.h to forware declare the Chip struct
    # See: https://github.com/tenstorrent/luwen/issues/8
    sed -i 's/extern "C" {/extern "C" {\nstruct Chip;/' "$pkgdir/usr/include/luwen.h"
}
