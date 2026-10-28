# Maintainer: Leonardo Mora Castro <leomc145@gmail.com>

pkgname=kanata-switcher
pkgver=1.2.0
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
    'curl: download the matching GNOME Shell extension during setup'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/7mind/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
        'kanata-switcher.install')
b2sums=('e246e23a0b2872120238d4a1f5bd6f397c3f7a1fa64a16357decd8dc56d28a6e0aa31af60f479bf664ea240a9b1abba810dc497db4efcb0da20f5a38fb354b8c'
        'c56e0979f2fcc1d12bb1c630056537004d140ba73ccc9b2f80c08bed19f0c8ddfac3c204cd3db185291aaf843c003c66d420aa254fa5615926d2f0ae61108c1b')
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
    sed --in-place 's|^ExecStart=%h/.cargo/bin/|ExecStart=/usr/bin/|' "$pkgdir/usr/lib/systemd/user/kanata-switcher.service" || return 1
    install -Dm0755 "$srcdir/kanata-switcher.install" "$pkgdir/usr/lib/$pkgname/gnome-setup" || return 1
    install -dm0755 "$pkgdir/usr/share/$pkgname" || return 1
    printf '%s\n%s\n' "$pkgver" "${b2sums[0]}" > "$pkgdir/usr/share/$pkgname/source-info"
}
