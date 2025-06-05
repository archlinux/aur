# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=shh
pkgver=2025.6.5
pkgrel=1
pkgdesc='Automatic systemd service hardening guided by strace profiling'
arch=('x86_64')
url="https://github.com/desbma/${pkgname}"
license=('GPL3')
depends=('gcc-libs'
         'strace')
makedepends=('cargo' 'systemd')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('b84c38fab0272dd1d3103cb28379a55d1955ea516b632cb887b5b0011b25bc6455e21f3bd8745f9139be7716b50a00b93de14e13eafe82cd3f9b3794c10dbae9')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable

    mkdir -p target/man
    cargo run --frozen --features generate-extra -- gen-man-pages ./target/man/

    mkdir -p target/shellcompletions
    cargo run --frozen --features generate-extra -- gen-shell-complete ./target/shellcompletions

    cargo build --frozen --release
}

check() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --bins
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 -t "${pkgdir}/usr/bin" ./target/release/${pkgname}
    install -Dm 644 -t "${pkgdir}/usr/share/man/man1" ./target/man/*
    install -Dm 644 -t "${pkgdir}/usr/share/bash-completion/completions" ./target/shellcompletions/*.bash
    install -Dm 644 -t "${pkgdir}/usr/share/zsh/site-functions" ./target/shellcompletions/_shh
    install -Dm 644 -t "${pkgdir}/usr/share/fish/vendor_completions.d" ./target/shellcompletions/*.fish
}
