# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=shh
pkgver=2025.7.13
pkgrel=1
pkgdesc='Automatic systemd service hardening guided by strace profiling'
arch=('x86_64')
url="https://github.com/desbma/${pkgname}"
license=('GPL3')
depends=('gcc-libs'
         'strace')
makedepends=('cargo' 'systemd')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('956d5eba3c6252d54da1e862392851430b00c001d402c19c99bb10ee8662cb95f49ab888a7305a4f49cb7e94a81657188f3d4e170eaad2740e870aa7eb4531f3')

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
