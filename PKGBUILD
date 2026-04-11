# Maintainer: Plan-B-Development <https://github.com/Plan-B-Development>
pkgname=control-ofc-daemon
pkgver=1.1.1
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
# Placeholder — recomputed post-tag-push. The release workflow
# (.github/workflows/release-aur.yml) will fail until this matches the
# GitHub tarball hash. Fix with a follow-up "fix: update PKGBUILD
# checksum for v1.1.1" commit, same pattern as commit a1d2b7b.
sha256sums=('738b8a0872a656112a43996395d5908c8827c416a115a45c911df64d0c38fdc8')

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

    # udev rules (template — user must fill in VID/PID for their device)
    install -Dm644 packaging/99-control-ofc.rules "$pkgdir/usr/lib/udev/rules.d/99-control-ofc.rules"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
