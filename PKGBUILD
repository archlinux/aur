# Maintainer: Martin Chang <marty188586@gmail.com>

pkgname='luwencpp-git'
pkgver=0.4.3
pkgrel=1
pkgdesc="Tenstorrent system interface library. C++ library and headers."
arch=('x86_64')
url='https://github.com/tenstorrent/luwen'
license=('Apache')
makedepends=(gcc rust make)
depends=()
provides=("luwencpp")
source=("luwen::git+https://github.com/tenstorrent/luwen.git")
sha256sums=('SKIP')

pkgver() {
  cd luwen
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd luwen
    cd crates/luwencpp
    cargo build --release
}

package() {
    cd luwen
    install -Dm755 target/release/libluwencpp.so "$pkgdir/usr/lib/libluwencpp.so"
    install -Dm644 target/release/luwen.h "$pkgdir/usr/include/luwen.h"
    # HCAK: Patch luwen.h to forware declare the Chip struct
    # See: https://github.com/tenstorrent/luwen/issues/8
    sed -i 's/extern "C" {/extern "C" {\nstruct Chip;/' "$pkgdir/usr/include/luwen.h"
}
