# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpit-agent-secret-service
pkgver=0.9.0
pkgrel=1
pkgdesc="Moshpit agent daemon — GNOME Keyring / KWallet (Secret Service) unlock backend"
arch=('x86_64')
url="https://github.com/rustyhorde/moshpit"
license=('MIT' 'Apache-2.0')
provides=('moshpit-agent')
conflicts=('moshpit-agent' 'moshpit-agent-fido2' 'moshpit-agent-systemd-creds'
           'moshpit-agent-ssh-agent-piggyback' 'moshpit-agent-tpm' 'moshpit-agent-fprintd'
           'moshpit-agent-full')
depends=('dbus')
makedepends=('cargo' 'cmake' 'gcc' 'dbus')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rustyhorde/moshpit/archive/v$pkgver.tar.gz")
sha256sums=('728cf19995ea86f0d824dbff9af1b58f3074f61387a4527a84e5a269f2c2de29')

prepare() {
    cd "moshpit-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
    cd "moshpit-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export VERGEN_IDEMPOTENT=1
    cargo build --release --locked --bin mpa --features secret-service
    cargo xtask dist mpa
}

package() {
    cd "moshpit-$pkgver"

    install -Dm755 "target/release/mpa" "$pkgdir/usr/bin/mpa"
    install -Dm644 "dist/mpa/mpa.1" "$pkgdir/usr/share/man/man1/mpa.1"
    install -Dm644 "dist/mpa/mpa.bash" \
        "$pkgdir/usr/share/bash-completion/completions/mpa"
    install -Dm644 "dist/mpa/_mpa" \
        "$pkgdir/usr/share/zsh/site-functions/_mpa"
    install -Dm644 "dist/mpa/mpa.fish" \
        "$pkgdir/usr/share/fish/vendor_completions.d/mpa.fish"
    install -Dm644 "dist/mpa/moshpit-agent.service" \
        "$pkgdir/usr/lib/systemd/user/moshpit-agent.service"
    install -Dm644 "dist/mpa/moshpit-agent.socket" \
        "$pkgdir/usr/lib/systemd/user/moshpit-agent.socket"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE-MIT    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
