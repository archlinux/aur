# Maintainer: Leonardo Mora Castro <leomc145@gmail.com>

pkgname=kanata-switcher
pkgver=1.1.1
pkgrel=2
pkgdesc='Kanata layer switcher based on focused window for all Linux desktop environments'
url='https://github.com/7mind/kanata-switcher'
license=('MIT')
arch=('x86_64')
makedepends=('cargo' 'glib2')
depends=('dbus' 'glibc')
optdepends=(
    'kanata: the keyboard remapper this tool controls'
    'glib2: GNOME Shell extension schema support'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/7mind/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('386276bd0fec836478da7e0bed791f486b7852b800f61a57a3fec8821c0cb05bc5a0b1e839a44e740860ed57a746cce6b01907a658c6d7e04d26984b1167fc5d')
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
