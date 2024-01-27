# Maintainer: metamuffin <metamuffin@disroot.org>

pkgname=keks-meet-server
pkgver=1.0.1
pkgrel=1
pkgdesc="Server for keks-meet, a simple and secure conferencing application for the web."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://codeberg.org/metamuffin/keks-meet"
license=('AGPL3')
makedepends=('rustup' 'esbuild')
backup=('etc/keks-meet-server.toml')
source=("https://codeberg.org/metamuffin/keks-meet/archive/v$pkgver.tar.gz"
        "keks-meet-server.service"
        "sysusers.conf")
sha256sums=("97e27120c7c76304f0fd7afea2f76fb451dd24ccac07461c15d413e885b3f80d"
            "SKIP"
            "SKIP")

build() {
    cd "keks-meet"
    make client-build
    cargo +nightly build --release --bin $pkgname
    strip -s target/release/$pkgname
}
package() {
    install -Dm755 keks-meet/target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/keks-meet-server.conf"
    install -Dm644 keks-meet-server.service "$pkgdir/usr/lib/systemd/system/keks-meet-server.service"
    install -Dm644 keks-meet/config/default.toml "$pkgdir/etc/keks-meet-server.toml"
}
