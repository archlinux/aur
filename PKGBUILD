# Maintainer: Jérôme Poulin <jeromepoulin@gmail.com>

pkgname=wol-rs-git
pkgver=0.5.1
pkgrel=1
pkgdesc='Wake up remote hosts with Wake On LAN magic packets'
arch=('i686' 'x86_64')
url="https://codeberg.org/swsnr/wol.rs"
license=('EUPL-1.2')
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'git')
provides=('wol' 'wol-rs')
conflicts=('wol' 'wol-rs')
options=('!lto')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "wol.rs"
    git describe --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
    cd "wol.rs"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "wol.rs"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    # First build with manpage and completions, then dump them
    cargo build --release --frozen --features cli,manpage,completions
    target/release/wol --print-manpage > wol.1
    # No bash completions: conflicts with the bash-completion package's old C wol tool
    for shell in zsh fish; do
        target/release/wol --print-completions="${shell}" > "complete.${shell}"
    done

    # Final build without embedded manpage and completions
    cargo build --release --frozen --features cli
}

check() {
    cd "wol.rs"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --features cli
}

package() {
    cd "wol.rs"
    install -Dm755 "target/release/wol" "${pkgdir}/usr/bin/wol"

    gzip -n wol.1
    install -Dm644 wol.1.gz "${pkgdir}/usr/share/man/man1/wol.1.gz"

    install -Dm644 complete.zsh "${pkgdir}/usr/share/zsh/site-functions/_wol"
    install -Dm644 complete.fish "${pkgdir}/usr/share/fish/vendor_completions.d/wol.fish"
}
