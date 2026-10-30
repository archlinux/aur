# Maintainer: thefangeddeity
pkgname=ele-messenger
pkgver=1.5.4
pkgrel=1
pkgdesc="Household chat that keeps working without internet, router or power: one mesh over Bluetooth, Wi-Fi and the tailnet"
arch=('x86_64' 'aarch64')
url="https://github.com/thefangeddeity/ele-messenger"
license=('GPL-3.0-or-later')
depends=('bluez' 'dbus' 'gcc-libs' 'glibc' 'libxkbcommon' 'libgl' 'hicolor-icon-theme')
makedepends=('cargo')
optdepends=('libx11: desktop app on X11'
            'wayland: desktop app on Wayland'
            "nginx: share this machine's mesh page with phones and other devices at /elem/")
# Published before as elemesh and as the Flutter ele-messenger-client; until
# 1.5 a separate chat server shipped as ele-messenger-server. The mesh is now
# the only chat, so this replaces all three.
provides=('elemesh' 'ele-messenger-client' 'ele-messenger-server')
conflicts=('elemesh' 'ele-messenger-client' 'ele-messenger-server')
replaces=('elemesh' 'ele-messenger-client' 'ele-messenger-server')
backup=('etc/nginx/snippets/ele-messenger-mesh.conf')
install=ele-messenger-app.install
# makepkg's GCC LTO turns the bundled SQLite into objects the Rust linker can't read.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/thefangeddeity/ele-messenger/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8acb5e923f2a5ef9eeb34235a64a13a52095b181ac236259f927a4f0ffeefce0')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release -p elemesh -p ele-client
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release -p elemesh
}

package() {
    cd "$pkgname-$pkgver"
    sh dist/linux/install-tree.sh target/release "$pkgdir"
}

