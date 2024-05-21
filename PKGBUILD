# Contributor: Roman Zimbelmann <hut@hut.pm>
# Maintainer: Roman Zimbelmann <hut@hut.pm>

pkgname=outfly-git
pkgver=0.9.0_23_g77b682a
pkgrel=1
pkgdesc="A breathtaking 3D space game in the rings of Jupiter"
arch=('any')
url="https://codeberg.org/outfly/outfly"
license=('GPL-3.0-only')
depends=('glibc' 'libcap' 'gcc-libs' 'alsa-lib' 'systemd-libs')
makedepends=('git' 'rust' 'libx11' 'pkgconf')
provides=('outfly')
source=("$pkgname::git+https://codeberg.org/outfly/outfly")
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
    cargo build --release --features "x11 wayland embed_assets"
}

package() {
    cd "$srcdir/$pkgname"
    build/linux/install.sh "$pkgdir"
}
