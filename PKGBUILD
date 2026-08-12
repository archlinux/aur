# Maintainer: DonQuinleone <don@donquinleone.com>
pkgname=antiphon
pkgver=1.5.0
pkgrel=1
pkgdesc='A modern mail client for the terminal'
arch=(x86_64 aarch64)
url='https://git.sr.ht/~donquinleone/antiphon'
license=(GPL-3.0-or-later)
depends=(notmuch)
optdepends=('gnupg: OpenPGP signing and decryption via gpg-agent')
makedepends=(cargo scdoc)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e1c9e385cd2ae640f401941c1e750471799c63d4cac465db0b4d0d4d364e892c')

prepare() {
    cd "$pkgname-v$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV \
        | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-v$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export ANTIPHON_VERSION="v$pkgver"
    cargo build --frozen --release --workspace
    scdoc <doc/antiphon.1.scd >antiphon.1
    scdoc <doc/antiphond.1.scd >antiphond.1
    scdoc <doc/antiphon-sendmail.1.scd >antiphon-sendmail.1
}

check() {
    cd "$pkgname-v$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --workspace
}

package() {
    cd "$pkgname-v$pkgver"
    install -Dm755 target/release/antiphon \
        "$pkgdir/usr/bin/antiphon"
    install -Dm755 target/release/antiphond \
        "$pkgdir/usr/bin/antiphond"
    install -Dm644 antiphon.1 \
        "$pkgdir/usr/share/man/man1/antiphon.1"
    install -Dm644 antiphond.1 \
        "$pkgdir/usr/share/man/man1/antiphond.1"
    install -Dm644 antiphon-sendmail.1 \
        "$pkgdir/usr/share/man/man1/antiphon-sendmail.1"
    install -Dm644 dist/systemd/antiphond.service \
        "$pkgdir/usr/lib/systemd/user/antiphond.service"
    # dist/systemd targets a cargo install; repoint it at the
    # package's own binary.
    sed -i 's|%h/\.cargo/bin/antiphond|/usr/bin/antiphond|' \
        "$pkgdir/usr/lib/systemd/user/antiphond.service"
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
}
