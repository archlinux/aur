# Maintainer: Tyler Thompson <me@dhopcs.org>
pkgname=iron-heart-git
pkgver=r196.784c364
pkgrel=1
pkgdesc="A BLE Heart Rate Monitor bridge for Social VR, OBS, Data Logging, and more"
arch=('x86_64' 'aarch64')
url="https://github.com/nullstalgia/iron-heart"
license=('MIT')
depends=('dbus' 'openssl')
makedepends=('git' 'rust' 'cargo' 'pkgconf')
options=('!debug')
provides=('iron-heart')
conflicts=('iron-heart')
source=("$pkgname::git+https://github.com/nullstalgia/iron-heart.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname"

    install -Dm755 "target/release/iron-heart" \
        "$pkgdir/usr/bin/iron-heart"

    install -Dm644 "resources/iron-heart.desktop" \
        "$pkgdir/usr/share/applications/iron-heart.desktop"

    install -Dm644 "LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
