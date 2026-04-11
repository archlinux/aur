# Maintainer: Plan-B-Development <https://github.com/Plan-B-Development>
pkgname=control-ofc-daemon
pkgver=1.0.1
pkgrel=1
pkgdesc="Hardware fan control daemon for Linux (OpenFan, hwmon, GPU)"
arch=('x86_64')
url="https://github.com/Plan-B-Development/control-ofc-daemon"
license=('MIT')
depends=('glibc' 'systemd-libs')
makedepends=('rust' 'cargo')
backup=('etc/control-ofc/daemon.toml')
install=control-ofc-daemon.install
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cee81621b2e9f75fd1bffd7210485c31b62b0c25ebbdc451b1d4ff0f8a61639f')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"

    # Binary
    install -Dm755 target/release/control-ofc-daemon "$pkgdir/usr/bin/control-ofc-daemon"

    # Restore script (runs on daemon stop to return fans to automatic)
    install -Dm755 packaging/control-ofc-restore-auto.sh "$pkgdir/usr/bin/control-ofc-restore-auto"

    # systemd service
    install -Dm644 packaging/control-ofc-daemon.service "$pkgdir/usr/lib/systemd/system/control-ofc-daemon.service"

    # Default config
    install -Dm644 packaging/daemon.toml.example "$pkgdir/etc/control-ofc/daemon.toml"

    # udev rules (template — user must fill in VID/PID for their device)
    install -Dm644 packaging/99-control-ofc.rules "$pkgdir/usr/lib/udev/rules.d/99-control-ofc.rules"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
