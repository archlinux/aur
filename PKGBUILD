# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=sacad
pkgver=3.0.3
pkgrel=1
pkgdesc='Smart Automatic Cover Art Downloader'
arch=('x86_64')
url="https://github.com/desbma/${pkgname}"
license=('MPL2')
depends=('gcc-libs')
makedepends=('cargo' 'ffmpeg')
options=(!lto)  # causes issues, fat lto is already enabled for the release profile in Cargo.toml anyway
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('61d95c93101feae8c25ded498f04ab7f4dcef347cdaa998c1a724b56e8767e5496f938026bc747d7788ce085d8f6dbee571f7f4505f72cb8b26ebfcaf08b3ab3')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable

    mkdir -p target/man
    cargo run \
          --frozen \
          --features generate-extras \
          --bin ${pkgname}_gen_extras \
          -- \
          gen-man-pages ./target/man/

    mkdir -p target/shellcompletions
    cargo run \
          --frozen \
          --features generate-extras \
          --bin ${pkgname}_gen_extras \
          -- \
          gen-shell-completions ./target/shellcompletions

    cargo build --frozen --release
}

check() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --features generate-extras,tests-ffmpeg
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm 755 -t "${pkgdir}/usr/bin" ./target/release/${pkgname}{,_r}

    install -Dm 644 -t "${pkgdir}/usr/share/man/man1" ./target/man/*

    install -Dm 644 -t "${pkgdir}/usr/share/bash-completion/completions" ./target/shellcompletions/*.bash
    install -Dm 644 -t "${pkgdir}/usr/share/zsh/site-functions" ./target/shellcompletions/_${pkgname}{,_r}
    install -Dm 644 -t "${pkgdir}/usr/share/fish/vendor_completions.d" ./target/shellcompletions/*.fish
}
