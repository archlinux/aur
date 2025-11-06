# Maintainer: amadejk <amadejkastelic7@gmail.com>
pkgname=hyprlux
pkgver=0.1.8
pkgrel=1
pkgdesc="Hyprland utility that automates vibrance and night light control"
arch=('x86_64')
url="https://github.com/amadejkastelic/Hyprlux"
license=('MIT')
depends=('hyprland')
makedepends=('cargo')
install="install.sh"
options=('!debug')
source=(
    "Hyprlux-${pkgver}.tar.gz::https://github.com/amadejkastelic/Hyprlux/archive/refs/tags/${pkgver}.tar.gz"
    "hyprlux.service"
    "config.toml"
)
sha256sums=(
    '591344aa05cf1d52375f7a8638a3c4d9c6e2a1c8c4125d1f3b81ff741f1e7b1e'
    '7e2586a52438688fb3fc1dfe0ac073b2751a4155cd6fc99b52abc0f152a2b0a8'
    '727f8015318fbf5914f3d8cda1302214e4f72da4b16296e4f140f1e9e4e6292f'
)

prepare() {
    cd "$srcdir/Hyprlux-${pkgver}"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
    cd "$srcdir/Hyprlux-${pkgver}"
    cargo build --frozen --release --target-dir target
}

check() {
    cd "$srcdir/Hyprlux-${pkgver}"
    cargo test --frozen --release
}

package() {
    cd "$srcdir/Hyprlux-${pkgver}"
    install -Dm755 "target/release/hyprlux" "$pkgdir/usr/bin/hyprlux"
    install -Dm644 "$srcdir/hyprlux.service" "$pkgdir/usr/lib/systemd/user/hyprlux.service"
    install -Dm644 "$srcdir/config.toml" "$pkgdir/usr/share/hyprlux/config.toml"
}