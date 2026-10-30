# Maintainer: thefangeddeity
pkgname=ele-messenger
pkgver=1.5.3
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
sha256sums=('3af4abe0f02227222c8731bbdbd3d7a84ff3b21b173b8dd41b7ede705542c45a')

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
    install -Dm755 target/release/elemesh "$pkgdir/usr/bin/elemesh"
    install -Dm755 target/release/ele "$pkgdir/usr/bin/ele"
    sed 's|^ExecStart=.*|ExecStart=/usr/bin/elemesh run|' mesh/dist/linux/elemesh.service \
        | install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/elemesh.service"
    install -Dm644 mesh/dist/nginx/elem.conf "$pkgdir/etc/nginx/snippets/ele-messenger-mesh.conf"
    install -Dm644 client/assets/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/ele.png"
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/ele.desktop" <<'DESKTOP'
[Desktop Entry]
Name=ELE Messenger
GenericName=Mesh messenger
Comment=Chat with the ELE machines around you, no internet needed
Exec=ele
Icon=ele
Type=Application
Categories=Network;InstantMessaging;
DESKTOP
    install -Dm644 mesh/README.md "$pkgdir/usr/share/doc/ele-messenger/README.md"
    install -Dm644 docs/USING-ELE.md "$pkgdir/usr/share/doc/ele-messenger/USING-ELE.md"
}
