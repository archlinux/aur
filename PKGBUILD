# Maintainer: Plan-B-Development <https://github.com/Plan-B-Development>
pkgname=control-ofc-daemon
pkgver=1.5.0
pkgrel=1
pkgdesc="Hardware fan control daemon for Linux (OpenFan, hwmon, GPU)"
arch=('x86_64')
url="https://github.com/Plan-B-Development/control-ofc-daemon"
license=('MIT')
depends=('glibc' 'systemd-libs')
optdepends=('lm_sensors: sensors-detect for hardware not covered by built-in module list')
makedepends=('rust' 'cargo')
backup=('etc/control-ofc/daemon.toml'
        'etc/control-ofc/profiles/quiet.json'
        'etc/modules-load.d/control-ofc.conf')
install=control-ofc-daemon.install
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
# Placeholder — recomputed post-tag-push. Fix with a follow-up
# "fix: update PKGBUILD checksum for v1.1.5" commit.
sha256sums=('7879fbe00db4b298abeffe46c347c7e75139cd0142479fd23ef3d2f75dd41e95')

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

    # Profile drop-in directory (admin-owned, GUI reads from here after copy).
    # The daemon's own runtime state lives under /var/lib/control-ofc/, which
    # systemd creates via StateDirectory= in the unit file.
    install -dm755 "$pkgdir/etc/control-ofc/profiles"

    # Example profile — safe to ship (empty members list, drives no fans).
    # Gives first-run users a working schema reference. Covered by backup=()
    # so pacman preserves user edits across upgrades (.pacnew pattern).
    install -Dm644 packaging/profiles/quiet.json "$pkgdir/etc/control-ofc/profiles/quiet.json"

    # Optional udev rules example (documentation only).
    # The daemon auto-detects the OpenFan controller on /dev/ttyACM* and
    # /dev/ttyUSB* at startup — no udev rule is required for normal operation.
    # Ship the rule as a reference for users who want a stable
    # /dev/control-ofc-controller symlink; they copy it into
    # /etc/udev/rules.d/ and fill in their VID/PID.
    install -Dm644 packaging/99-control-ofc.rules \
        "$pkgdir/usr/share/doc/$pkgname/99-control-ofc.rules.example"

    # Kernel module loading — Super I/O chipset drivers that expose
    # motherboard fan headers and sensors. See packaging/modules-load.d/
    # for rationale. Covered by backup=() so pacman preserves user edits.
    install -Dm644 packaging/modules-load.d/control-ofc.conf \
        "$pkgdir/etc/modules-load.d/control-ofc.conf"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
