# Maintainer: Valentin Weber
pkgbase="battery_status_rs"
pkgname=("battery_status_rs_notification"
         "battery_status_rs_sleep")
pkgver="3.1.0"
pkgrel="1"
pkgdesc="A utility to watch the battery level."
arch=('any')
depends=('systemd')
makedepends=('cargo'
             'git')

source=("git+https://git.unfug.hs-furtwangen.de/weva/battery_status_rs/#tag=$pkgver"
        "battery_status_rs_notification.service"
        "battery_status_rs_sleep.service")

sha256sums=('a8a9a10f8d2bdf61e2035862d7defd647a53ba0a323b9b5aede904e4883b0e95'
            '92ecbb16524c4ec6423d87979f655838b502fc0c5206127f34553c5ff837f3f8'
            'e104c41b6c84c60ebca61545cc06a9e53c169f00d4eab50c2dd4df3d2f22500b')

prepare() {
        cd battery_status_rs
        cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
        cd battery_status_rs
        export RUSTUP_TOOLCHAIN=stable
        export CARGO_TARGET_DIR=target
        cargo build --frozen --release --all-features
}

package_battery_status_rs_notification() {
        install -Dm0755 -t "$pkgdir/usr/lib/systemd/user/" "$pkgname.service"
        install -Dm0755 -t "$pkgdir/usr/bin/" "battery_status_rs/target/release/$pkgname"
}

package_battery_status_rs_sleep() {
        install -Dm0755 -t "$pkgdir/usr/lib/systemd/system/" "$pkgname.service"
        install -Dm0755 -t "$pkgdir/usr/bin/" "battery_status_rs/target/release/$pkgname"
}
