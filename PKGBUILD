# Maintainer: Leonardo Mora Castro <leomc145@gmail.com>

pkgname=kanata-switcher
pkgver=1.1.1
pkgrel=1
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/7mind/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
        "kanata-switcher.service")
b2sums=('386276bd0fec836478da7e0bed791f486b7852b800f61a57a3fec8821c0cb05bc5a0b1e839a44e740860ed57a746cce6b01907a658c6d7e04d26984b1167fc5d'
        '10cd6e5c170775453d12494e8329e582e289f2b0c1bbe1ccddb7fb3a5d2c9fcff8ff8b3b8687493e4a330ede38ccdcafb707d19e37a187ee1288ce9031b4ecb6')
install=kanata-switcher.install

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/kanata-switcher.service" "$pkgdir/usr/lib/systemd/user/kanata-switcher.service"
}
