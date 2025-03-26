# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=wol-rs
pkgver=0.2.2
pkgrel=2
pkgdesc='Wake up remote hosts with Wake On LAN magic packets'
arch=('i686' 'x86_64')
url="https://github.com/swsnr/wol.rs"
license=('MPL-2.0')
depends=()
conflicts=('wol')
makedepends=('rust' 'cargo')
options=()
source=(
    "${url}/releases/download/v${pkgver}/wol-v${pkgver}.tar.zst"
    "wol-vendor-${pkgver}.tar.zst::${url}/releases/download/v${pkgver}/vendor.tar.zst"
    "config.toml"
)
sha256sums=('61b51a2b8008fedb3c162494ee5c7a79da63b40150e8a766b412400fd29f2edc'
            'd4c99fe4949938fb9aec5038686a494a9e8705a682c6485b2e2ac3fa86f87f10'
            '8dc330c974e99a362fd8d27f5d76f485da9559f80d576e0fd9ffb1779e4dd881')

prepare() {
    cd "wol-v${pkgver}" || return 1
    install -D -m644 "${srcdir}/config.toml" .cargo/config.toml
}

build() {
    cd "wol-v${pkgver}" || return 1

    # Dump completions and manpage
    cargo build --release --frozen --features cli,manpage,completions

    target/release/wol --print-manpage > wol.1
    # We do not generate bash completions, because this conflicts with the
    # bash-completions package which includes completions for the old C wol tool.
    for shell in zsh fish; do
        target/release/wol --print-completions="${shell}" > "complete.${shell}"
    done

    # Final build without embedded manpage and completions
    cargo build --release --frozen --features cli
 }

package() {
    cd "wol-v${pkgver}" || return 1
    install -Dm755 "target/release/wol" "${pkgdir}/usr/bin/wol"

    gzip -n wol.1
    install -Dm644 wol.1.gz "${pkgdir}/usr/share/man/man1/wol.1.gz"

    install -Dm644 complete.zsh "${pkgdir}/usr/share/zsh/site-functions/_wol"
    install -Dm644 complete.fish "${pkgdir}/usr/share/fish/vendor_completions.d/wol.fish"
}
