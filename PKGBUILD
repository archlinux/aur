# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=wol-rs
pkgver=0.4.0
pkgrel=1
pkgdesc='Wake up remote hosts with Wake On LAN magic packets'
arch=('i686' 'x86_64')
url="https://codeberg.org/swsnr/wol.rs"
license=('MPL-2.0')
depends=()
conflicts=('wol')
makedepends=('rust' 'cargo' 'git')
options=()
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('f7c35b0b440a08660a98f5459bcabb2c254b29c401a18a1ed2b88a8c69ab5a5d')

build() {
    cd "wol.rs" || return 1

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
    cd "wol.rs" || return 1
    install -Dm755 "target/release/wol" "${pkgdir}/usr/bin/wol"

    gzip -n wol.1
    install -Dm644 wol.1.gz "${pkgdir}/usr/share/man/man1/wol.1.gz"

    install -Dm644 complete.zsh "${pkgdir}/usr/share/zsh/site-functions/_wol"
    install -Dm644 complete.fish "${pkgdir}/usr/share/fish/vendor_completions.d/wol.fish"
}
