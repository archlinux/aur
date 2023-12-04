# Maintainer: Ralph Torres <mail at ralphptorr dot es>
# Contributor: ny-a <nyaarch64 at gmail dot com>
# Contributor: Jean Lucas <jean at 4ray dot co>

_pkgname=tiny
pkgname=tiny-irc-client
pkgver=0.10.0
pkgrel=2
pkgdesc='A terminal IRC client written in Rust'
arch=(x86_64)
url=https://github.com/osa1/tiny
license=(MIT)

provides=($pkgname)
conflicts=($pkgname)
depends=(dbus)
makedepends=(cargo)
source=($_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=(7f4751b5e34057ba65e86f3819f2ae8288307a5a8e83e5fbb2733759c8100cb7)

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
