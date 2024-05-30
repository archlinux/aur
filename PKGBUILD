# Maintainer: metamuffin <metamuffin@disroot.org>

pkgname=keks-meet-server
pkgver=1.1.0
pkgrel=2
pkgdesc="Server for keks-meet, a simple and secure conferencing application for the web."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://codeberg.org/metamuffin/keks-meet"
license=('AGPL3')
makedepends=('rustup' 'esbuild')
backup=('etc/keks-meet-server.toml')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/metamuffin/keks-meet/archive/v$pkgver.tar.gz"
        "keks-meet-server.service"
        "sysusers.conf")
sha256sums=('40cd5203f227d2019bc2179ca018a25a264570dd6c31ba023dacc92847d632db'
            '7760ad9c44dd9a0a8d6e74ae647911eb2375776fea6d0f635024f1126c1618ce'
            '8cc9a7ace869b934732bfe376fd09b4ab82d22f52c70619e9df4ead0fae9a9aa')

prepare() {
    cd "keks-meet"
    cargo fetch --locked --target "$CHOST"
}
build() {
    cd "keks-meet"
    make client-build
    cargo +nightly build --frozen --release --bin keks-meet-server --target "$CHOST"
}
package() {
    install -Dm755 keks-meet/target/$CHOST/release/keks-meet-server "$pkgdir/usr/bin/keks-meet-server"
    install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/keks-meet-server.conf"
    install -Dm644 keks-meet-server.service "$pkgdir/usr/lib/systemd/system/keks-meet-server.service"
    install -Dm644 keks-meet/COPYING "$pkgdir/usr/share/licenses/keks-meet/COPYING"
    install -Dm644 keks-meet/config/default.toml "$pkgdir/etc/keks-meet-server.toml"
}
