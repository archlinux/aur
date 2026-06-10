# Maintainer: Cristian Ciro <cristian_ciro@icloud.com>
#
# AUR PKGBUILD for hpd-handheld-power-daemon (build-from-source).
# This file is a TEMPLATE — placeholders in the pkgver and sha256sums
# lines below are rewritten at release time by scripts/aur-sync.sh.
# Do not push the template verbatim to AUR; push the rendered file.

pkgname=hpd-handheld-power-daemon
pkgver=2.7.2
# pkgrel is static (not a placeholder): reset to 1 when bumping pkgver,
# increment for packaging-only respins of the same version.
pkgrel=1
pkgdesc="Linux system daemon for handheld PCs: TDP, charge, profile, fan (ROG Ally family)"
arch=('x86_64')
url="https://github.com/CiroDev-Git/hpd-handheld-power-daemon"
license=('GPL-3.0-or-later')
depends=('dbus' 'polkit' 'systemd')
makedepends=('rust' 'cargo' 'pkgconf' 'systemd-libs')
conflicts=('power-profiles-daemon')
backup=('etc/hpd/config.toml.example')
install="hpd.install"
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0a2cb29dda8e9a263d92dae9c26c93aee1436242e62ec552112256a54bb9faa4')

prepare() {
    cd "$pkgname-$pkgver"
    # Vendor dependencies so the build is offline-reproducible and
    # `cargo build --frozen` doesn't try to hit crates.io from inside
    # the AUR sandbox.
    cargo fetch --locked
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen --workspace
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release --frozen --workspace
}

package() {
    cd "$pkgname-$pkgver"

    # Binaries land at /usr/bin (AUR convention; install.sh in-repo
    # uses /usr/local/bin but the AUR package follows the distro
    # standard).
    install -Dm755 target/release/hpd-daemon "$pkgdir/usr/bin/hpd-daemon"
    install -Dm755 target/release/hpdctl     "$pkgdir/usr/bin/hpdctl"

    # systemd unit: rewrite ExecStart to point at /usr/bin so the
    # shipped unit works against the AUR install layout.
    install -dm755 "$pkgdir/usr/lib/systemd/system"
    sed -E 's|/usr/local/bin/hpd-daemon|/usr/bin/hpd-daemon|' \
        package/hpd.service > "$pkgdir/usr/lib/systemd/system/hpd.service"
    chmod 644 "$pkgdir/usr/lib/systemd/system/hpd.service"

    # D-Bus and polkit policies.
    install -Dm644 package/dev.cirodev.hpd.conf \
        "$pkgdir/usr/share/dbus-1/system.d/dev.cirodev.hpd.conf"
    install -Dm644 package/polkit/dev.cirodev.hpd.policy \
        "$pkgdir/usr/share/polkit-1/actions/dev.cirodev.hpd.policy"
    install -Dm644 package/polkit/49-hpd.rules \
        "$pkgdir/usr/share/polkit-1/rules.d/49-hpd.rules"

    # Reference operator config — never overwritten on upgrade
    # (declared in backup=()).
    install -Dm644 package/hpd-example.toml \
        "$pkgdir/etc/hpd/config.toml.example"

    # License + docs.
    install -Dm644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
