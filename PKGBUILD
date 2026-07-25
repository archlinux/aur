# Maintainer: DonQuinleone <don@donquinleone.com>
pkgname=antiphon-git
pkgver=r0.0000000
pkgrel=1
pkgdesc='A modern mail client for the terminal (git version)'
arch=(x86_64 aarch64)
url='https://git.sr.ht/~donquinleone/antiphon'
license=(GPL-3.0-or-later)
depends=(notmuch)
optdepends=('gnupg: OpenPGP signing and decryption via gpg-agent')
makedepends=(cargo git scdoc)
provides=(antiphon)
conflicts=(antiphon)
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags 2>/dev/null \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
        || printf 'r%s.%s' \
            "$(git rev-list --count HEAD)" \
            "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV \
        | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --workspace
    scdoc <doc/antiphon.1.scd >antiphon.1
    scdoc <doc/antiphond.1.scd >antiphond.1
    scdoc <doc/antiphon-sendmail.1.scd >antiphon-sendmail.1
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release --workspace
}

package() {
    cd "$pkgname"
    install -Dm755 target/release/antiphon \
        "$pkgdir/usr/bin/antiphon"
    install -Dm755 target/release/antiphond \
        "$pkgdir/usr/bin/antiphond"
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
    sed 's|%h/.cargo/bin/antiphond|/usr/bin/antiphond|' \
        dist/systemd/antiphond.service \
        >antiphond.service
    install -Dm644 antiphond.service \
        "$pkgdir/usr/lib/systemd/user/antiphond.service"
    for page in antiphon antiphond antiphon-sendmail; do
        install -Dm644 "$page.1" \
            "$pkgdir/usr/share/man/man1/$page.1"
    done
}
