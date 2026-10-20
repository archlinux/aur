# Maintainer: thefangeddeity
pkgbase=ele-messenger
pkgname=('ele-messenger' 'elemesh')
pkgver=1.4.1
pkgrel=1
pkgdesc="Resilience-first household messenger: a server, and a mesh that works with no infrastructure"
arch=('x86_64' 'aarch64')
url="https://github.com/thefangeddeity/ele-messenger"
license=('GPL-3.0-or-later')
makedepends=('cargo' 'dbus')
# makepkg's GCC LTO turns the bundled SQLite into objects the Rust linker can't read.
options=('!lto')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/thefangeddeity/ele-messenger/archive/refs/tags/v$pkgver.tar.gz"
        "ele-messenger.install")
sha256sums=('d976b7b38dff1f9484b71bf8e6e297468018f0583315e0324af158d2ea7f7174'
            'SKIP')

prepare() {
    cd "$pkgbase-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgbase-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release -p elemesh -p ele-client
}

check() {
    cd "$pkgbase-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release -p elemesh
}

package_ele-messenger() {
    pkgdesc="ELE Messenger server: accounts, direct messages, groups and images over the LAN, with a web client"
    arch=('any')
    install=ele-messenger.install
    depends=('python' 'python-fastapi' 'uvicorn' 'python-websockets' 'python-aiosqlite' 'python-bcrypt' 'nginx' 'avahi')
    optdepends=('elemesh: make this server a node of the ELE Mesh too'
                'tailscale: reach the server off-site')
    # Host-specific: keep local edits on upgrade (pacman writes .pacnew).
    backup=('usr/lib/ele-messenger/config.json'
            'etc/avahi/services/ele-messenger.service'
            'etc/nginx/sites-available/ele-messenger'
            'etc/nginx/snippets/ele-messenger.conf')

    cd "$srcdir/$pkgbase-$pkgver/pkg"
    cp -r usr var etc "$pkgdir/"
    chmod 644 "$pkgdir/etc/systemd/system/ele-messenger.service"
    chmod 644 "$pkgdir/etc/nginx/sites-available/ele-messenger"
}

package_elemesh() {
    pkgdesc="ELE Mesh: chat between nearby machines over Bluetooth and Wi-Fi, no router, server or internet; daemon and desktop client"
    depends=('bluez' 'dbus' 'gcc-libs' 'glibc' 'libxkbcommon' 'libgl' 'hicolor-icon-theme')
    optdepends=('libx11: desktop client on X11'
                'wayland: desktop client on Wayland')
    provides=('ele-messenger-client')
    conflicts=('ele-messenger-client')
    replaces=('ele-messenger-client')

    cd "$srcdir/$pkgbase-$pkgver"
    install -Dm755 target/release/elemesh "$pkgdir/usr/bin/elemesh"
    install -Dm755 target/release/ele "$pkgdir/usr/bin/ele"
    sed 's|^ExecStart=.*|ExecStart=/usr/bin/elemesh run|' mesh/dist/linux/elemesh.service \
        | install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/elemesh.service"
    install -Dm644 flutter/assets/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/ele.png"
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/ele.desktop" <<'DESKTOP'
[Desktop Entry]
Name=ELE
GenericName=Mesh messenger
Comment=Chat with the ELE machines around you, no internet needed
Exec=ele
Icon=ele
Type=Application
Categories=Network;InstantMessaging;
DESKTOP
    install -Dm644 mesh/README.md "$pkgdir/usr/share/doc/elemesh/README.md"
    install -Dm644 client/README.md "$pkgdir/usr/share/doc/elemesh/client.md"
}
