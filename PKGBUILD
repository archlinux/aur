# Maintainer: Aeldit <aeldit.66@proton.me>

pkgname=aeosd
pkgver=0.4.2
pkgrel=1
pkgdesc="An OSD for changing screen brightness"
arch=("any")
url="https://git.sr.ht/~aeldit/aeosd"
license=("GPL-2.0-only")
depends=(
    glibc
    gcc-libs
)
makedepends=(cargo)
source=("$url/archive/$pkgver.tar.gz")
sha256sums=("7baf64ba7a18b7fcda54e67ec197d167c967061da934ccbd0597245a1fd2c08b")

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

    # UDEV rules, install and reload/trigger so it takes effect
    install -vDm644 -t "$pkgdir/etc/udev/rules.d/" "90-aeosd.rules"
    udevadm control --reload
    udevadm trigger --subsystem-match=backlight --action=add
}
