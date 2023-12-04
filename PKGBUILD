# Maintainer: Ralph Torres <mail at ralphptorr dot es>
# Contributor: ny-a <nyaarch64 at gmail dot com>
# Contributor: Jean Lucas <jean at 4ray dot co>

_pkgname=tiny
pkgname=tiny-irc-client
pkgver=0.11.0
pkgrel=1
pkgdesc='A terminal IRC client written in Rust'
arch=(x86_64)
url=https://github.com/osa1/tiny
license=(MIT)

provides=($pkgname)
conflicts=($pkgname)
depends=(dbus)
makedepends=(cargo)
source=($_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=(4bd412760a35ff41220ab918702d003c710379537db9621477f63ee201a68440)

prepare() {
    cd "$srcdir"/$_pkgname-$pkgver
    cargo update
    cargo fetch --locked --target $CARCH-unknown-linux-gnu
}

build() {
    cd "$srcdir"/$_pkgname-$pkgver
    cargo build --frozen --release --features desktop-notifications
}

check() {
    cd "$srcdir"/$_pkgname-$pkgver
    cargo test --frozen --workspace --features desktop-notifications
}

package() {
    cd "$srcdir"/$_pkgname-$pkgver
    install -Dm755 -t "$pkgdir"/usr/bin target/release/$_pkgname
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$_pkgname LICENSE
    install -Dm644 -t "$pkgdir"/usr/share/doc/$_pkgname \
        ARCHITECTURE.md CHANGELOG.md README.md
    install -Dm644 -t "$pkgdir"/usr/share/$_pkgname crates/$_pkgname/config.yml
}
