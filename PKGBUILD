# Contributor: Roman Zimbelmann <hut@hut.pm>
# Maintainer: Roman Zimbelmann <hut@hut.pm>

pkgname=outfly-git
pkgver=0.8.0_5_gc7e439a
pkgrel=1
pkgdesc="A breathtaking 3D space game in the rings of Jupiter"
arch=('any')
url="https://codeberg.org/hut/outfly"
license=('GPL-3.0-only')
depends=('glibc' 'libcap' 'gcc-libs' 'alsa-lib' 'systemd-libs')
makedepends=('git' 'rust' 'libx11' 'pkgconf')
provides=('outfly')
source=("$pkgname::git+https://codeberg.org/hut/outfly")
md5sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --always --tags | sed -e 's/-/_/g' -e '1s/^v//'
}

build() {
    cd "$srcdir/$pkgname"
    cargo build --release --features "x11 wayland"
}

package() {
    cd "$srcdir/$pkgname"
    src/build/linux/install.sh "$pkgdir"
}
