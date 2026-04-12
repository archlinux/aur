# Maintainer: ByAlphas <https://github.com/byalphas>
# CachyDPI — System-wide DPI bypass tool for Linux

pkgname=cachydpi
pkgver=1.0.0
pkgrel=1
pkgdesc="System-wide DPI bypass tool for Linux — GoodbyeDPI alternative"
arch=('x86_64' 'aarch64')
url="https://github.com/byalphas/cachydpi"
license=('GPL-3.0-or-later')
depends=(
    'libnetfilter_queue'
    'libnfnetlink'
    'libmnl'
    'nftables'
)
makedepends=(
    'rust'
    'cargo'
    'pkg-config'
)
backup=('etc/cachydpi/config.toml' 'etc/cachydpi/blacklist.txt')
source=("$pkgname-$pkgver.tar.gz::https://github.com/byalphas/cachydpi/archive/v$pkgver.tar.gz")
sha256sums=('dde09621a5fb84af11c7befcceeea9855d4075f0677ba164a49a9710e01f0464')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    # Use CachyOS-optimized build flags
    export RUSTFLAGS="-C opt-level=3 -C lto=fat -C codegen-units=1 -C strip=symbols"

    cargo build --frozen --release
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install binaries
    install -Dm755 "target/release/cachydpi" "$pkgdir/usr/bin/cachydpi"
    install -Dm755 "target/release/cachydpi-monitor" "$pkgdir/usr/bin/cachydpi-monitor"

    # Install systemd service
    install -Dm644 "systemd/cachydpi.service" "$pkgdir/usr/lib/systemd/system/cachydpi.service"

    # Install sysusers config (creates cachydpi user)
    install -Dm644 "systemd/cachydpi.sysusers" "$pkgdir/usr/lib/sysusers.d/cachydpi.conf"

    # Install tmpfiles config (creates directories)
    install -Dm644 "systemd/cachydpi.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/cachydpi.conf"

    # Install configuration
    install -Dm644 "config/config.toml" "$pkgdir/etc/cachydpi/config.toml"

    # Install blacklist
    install -Dm644 "config/blacklist.txt" "$pkgdir/etc/cachydpi/blacklist.txt"

    # Install documentation
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

post_install() {
    systemd-sysusers cachydpi.conf
    systemd-tmpfiles --create cachydpi.conf

    echo ""
    echo ">>> CachyDPI installed!"
    echo ">>> Start with: sudo systemctl enable --now cachydpi"
    echo ">>> Status: sudo systemctl status cachydpi"
    echo ">>> Configuration: /etc/cachydpi/config.toml"
    echo ""
}

post_upgrade() {
    systemd-sysusers cachydpi.conf
    systemd-tmpfiles --create cachydpi.conf

    echo ""
    echo ">>> CachyDPI updated. Restart the service:"
    echo ">>> sudo systemctl restart cachydpi"
    echo ""
}

pre_remove() {
    systemctl stop cachydpi 2>/dev/null || true
    systemctl disable cachydpi 2>/dev/null || true
    # Remove nftables rules
    /usr/bin/cachydpi remove-rules 2>/dev/null || true
}
