# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=sacad
pkgver=3.0.0.r0
_pkgver=3.0.0
pkgrel=1
pkgdesc='Smart Automatic Cover Art Downloader'
arch=('x86_64')
url="https://github.com/desbma/${pkgname}"
license=('MPL2')
depends=('gcc-libs')
makedepends=('cargo' 'ffmpeg')
options=(!lto)  # causes issues, fat lto is already enabled for the release profile in Cargo.toml anyway
source=("${pkgname}-${_pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${_pkgver}.tar.gz")
sha512sums=('88dec8eaa24dbad5806fce2b4c2df4f07502adb06c858c93c89878f76a54e1cbd799df268f5748daaa8cd446a1ebadf6999ec48ba26eb654728e22bc05ae09b5')

prepare() {
    cd "${pkgname}-${_pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd "${pkgname}-${_pkgver}"
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
    cd "${pkgname}-${_pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --features generate-extras,tests-ffmpeg
}

package() {
    cd "${pkgname}-${_pkgver}"

    install -Dm 755 -t "${pkgdir}/usr/bin" ./target/release/${pkgname}{,_r}

    install -Dm 644 -t "${pkgdir}/usr/share/man/man1" ./target/man/*

    install -Dm 644 -t "${pkgdir}/usr/share/bash-completion/completions" ./target/shellcompletions/*.bash
    install -Dm 644 -t "${pkgdir}/usr/share/zsh/site-functions" ./target/shellcompletions/_${pkgname}{,_r}
    install -Dm 644 -t "${pkgdir}/usr/share/fish/vendor_completions.d" ./target/shellcompletions/*.fish
}
