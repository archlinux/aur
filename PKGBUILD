# Maintainer: Giorgi Gvelesiani <ggvelesiani@duck.com>
pkgname=haraltr
pkgver=0.2.0_alpha
pkgrel=1
pkgdesc="Proximity-based authentication daemon and PAM module using Bluetooth RSSI"
arch=('x86_64')
url="https://github.com/kdufla/haraltr"
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'pam' 'bluez' 'dbus')
makedepends=('cargo')
optdepends=('bluez-utils: bluetoothctl for initial device pairing')
options=('!debug')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver//_/-}.tar.gz")
b2sums=('12be8a99212d26ad9c6a51d99d08dfb25a1581b04e2af8a28365b215ab17db9f194c823ee66653d00f2b2aac3a6503e94f988dc556188d13147d4b3cd9f927a9')

prepare() {
    cd "$pkgname-${pkgver//_/-}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-${pkgver//_/-}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-${pkgver//_/-}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --workspace
}

package() {
    cd "$pkgname-${pkgver//_/-}"

    install -Dm755 "target/release/haraltrd" "$pkgdir/usr/bin/haraltrd"
    install -Dm755 "target/release/haraltr" "$pkgdir/usr/bin/haraltr"
    install -Dm644 "target/release/libpam.so" "$pkgdir/usr/lib/security/pam_haraltr.so"

    install -Dm644 "packaging/haraltrd.service" "$pkgdir/usr/lib/systemd/system/haraltrd.service"
    install -Dm644 "packaging/haraltrd.tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/haraltr.conf"

    install -Dm644 "config.example.toml" "$pkgdir/usr/share/doc/$pkgname/config.example.toml"

    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
