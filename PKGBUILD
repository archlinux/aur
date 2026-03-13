# Maintainer: nari <nari@codeberg.org>
pkgname=waypai-git
pkgver=r13.edc13d1
pkgrel=1
pkgdesc='Minimal Wayland overlay for drawing on your screen'
arch=('x86_64')
url='https://codeberg.org/nari/waypai'
license=('MIT')
makedepends=('cargo' 'git')
depends=('wayland')
provides=('waypai')
conflicts=('waypai')
source=('git+https://codeberg.org/nari/waypai.git')
sha256sums=('SKIP')

pkgver() {
    cd waypai
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd waypai
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd waypai
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd waypai
    install -Dm755 target/release/waypai "$pkgdir/usr/bin/waypai"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
