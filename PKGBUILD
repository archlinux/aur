# Maintainer: Valentin Weber
pkgbase="battery_status_rs"
pkgname=("battery_status_rs_notification"
         "battery_status_rs_sleep"
         "battery_status_rs_hibernate")
pkgver="4.0.0"
pkgrel="1"
pkgdesc="A utility to watch the battery level."
arch=('any')
depends=('systemd')
makedepends=('cargo'
             'git')

source=("git+https://git.unfug.hs-furtwangen.de/weva/battery_status_rs.git/#tag=$pkgver"
        "battery_status_rs_notification.service"
        "battery_status_rs_sleep.service"
        "battery_status_rs_hibernate.service")

sha256sums=('5d31fe8a45bcbf594f5f236357dde0d87f584b72ee1dd19173102e009f59171b'
            '92ecbb16524c4ec6423d87979f655838b502fc0c5206127f34553c5ff837f3f8'
            'e104c41b6c84c60ebca61545cc06a9e53c169f00d4eab50c2dd4df3d2f22500b'
            'eead0cc7d1ffff3e6670f8ff2ba9bacb609b2a5df949786e488c378f4e0fee5c')

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
        conflicts=('battery_status_rs_hibernate')
        install -Dm0755 -t "$pkgdir/usr/lib/systemd/system/" "$pkgname.service"
        install -Dm0755 -t "$pkgdir/usr/bin/" "battery_status_rs/target/release/$pkgname"
}

package_battery_status_rs_hibernate() {
        conflicts=('battery_status_rs_sleep')
        install -Dm0755 -t "$pkgdir/usr/lib/systemd/system/" "$pkgname.service"
        install -Dm0755 -t "$pkgdir/usr/bin/" "battery_status_rs/target/release/$pkgname"
}
