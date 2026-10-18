# Maintainer: abel0x <https://github.com/abel0x>
# CachyDPI — System-wide DPI bypass tool for Linux

pkgname=cachydpi
pkgver=1.9.1
pkgrel=1
pkgdesc="System-wide DPI bypass tool for Linux — GoodbyeDPI alternative"
arch=('x86_64' 'aarch64')
url="https://github.com/abel0x/cachydpi"
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
install="$pkgname.install"
backup=('etc/cachydpi/config.toml' 'etc/cachydpi/blacklist.txt')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7654f41796fa96c9815513e654a61cdc2060d53efa50d53710365b49b02f1e0d')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    # Optimisation (opt-level 3, fat LTO, one codegen unit, stripped) comes
    # from [profile.release] in Cargo.toml. Passing -C lto through RUSTFLAGS
    # instead breaks the build: it also reaches build scripts and proc macros,
    # which cargo compiles with -C embed-bitcode=no.

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

    # Pristine config kept as documentation: /etc/cachydpi/config.toml is a
    # backup= file and is never replaced, so recovering from a damaged one
    # needs a reference copy to restore from (see Troubleshooting in README).
    install -Dm644 "config/config.toml" "$pkgdir/usr/share/doc/$pkgname/config.toml"
    install -Dm644 "CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
