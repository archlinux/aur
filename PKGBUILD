# Maintainer: Alexander Inglessi <inglessi glsk net>

pkgname=luxd
pkgver=0.1.1
pkgrel=1
pkgdesc="Automatic display brightness daemon driven by configurable shell commands"
arch=('x86_64' 'aarch64')
url="https://git.glsk.net/glsk/luxd"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cargo')
optdepends=(
    'libkscreen: monitor brightness control via kscreen-doctor'
    'iio-sensor-proxy: reads ambient light sensor'
)
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b5c12669230b8d469ea9c5bc93701912a3b16be3e31f8d10f3aae2c2d88a34aa')

prepare() {
    cd "$pkgname"
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    cd "$pkgname"
    install -Dm0755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm0644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm0644 config.example.toml -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm0644 luxd.service "$pkgdir/usr/lib/systemd/user/$pkgname.service"
}
