# Maintainer: Leonardo Mora Castro <leomc145@gmail.com>

pkgname=kanata-switcher
pkgver=1.1.3
pkgrel=1
pkgdesc='Kanata layer switcher based on focused window for all Linux desktop environments'
url='https://github.com/7mind/kanata-switcher'
license=('MIT')
arch=('x86_64')
makedepends=('cargo' 'glib2')
depends=('dbus' 'glibc' 'libgcc')
optdepends=(
    'kanata: the keyboard remapper this tool controls'
    'dconf: persist system tray settings'
    'glib2: GNOME Shell extension schema and GSettings support'
    'gnome-shell: GNOME Shell extension integration'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/7mind/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('15dd5edc572582e96a2341a9039d58ea381397aa9d1fa10a03616a260f52fba538e9bf2470afb8fb15698a13e940f9d58436659a2a398cb3852e17a5bb9acab3')
install=kanata-switcher.install

prepare() {
    cd "$pkgname-$pkgver" || return 1
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver" || return 1
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver" || return 1
    install -Dm0755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname" || return 1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || return 1
    install -Dm644 systemd/kanata-switcher.service "$pkgdir/usr/lib/systemd/user/kanata-switcher.service" || return 1
    sed --in-place 's|^ExecStart=%h/.cargo/bin/|ExecStart=/usr/bin/|' "$pkgdir/usr/lib/systemd/user/kanata-switcher.service"
}
