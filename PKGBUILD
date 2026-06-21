# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=wol-rs
pkgver=0.5.1
pkgrel=1
pkgdesc='Wake up remote hosts with Wake On LAN magic packets'
arch=('i686' 'x86_64')
url="https://codeberg.org/swsnr/wol.rs"
license=('MPL-2.0')
depends=()
conflicts=('wol')
makedepends=('rust' 'cargo' 'git' 'openssh')
options=()
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('e781a9fe5fd09300867f931b409a159a7b8d5aa945048623abca026bc2a6f817')

verify() {
    cat > "${srcdir}/allowed-signers" <<EOF
sebastian@swsnr.de ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBmga3fwFXxHTireSwL/YLdNpOuQcJXB8hW4FwOc6SCm
EOF
    git -C "wol.rs" -c gpg.ssh.allowedSignersFile="${srcdir}/allowed-signers" \
        verify-tag "v${pkgver}"
}

build() {
    cd "wol.rs" || return 1

    # Dump completions and manpage
    cargo build --release --frozen --features cli,manpage,completions

    target/release/wol --print-manpage | gzip > wol.1.gz

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
    install -Dm644 wol.1.gz "${pkgdir}/usr/share/man/man1/wol.1.gz"
    install -Dm644 complete.zsh "${pkgdir}/usr/share/zsh/site-functions/_wol"
    install -Dm644 complete.fish "${pkgdir}/usr/share/fish/vendor_completions.d/wol.fish"
}
