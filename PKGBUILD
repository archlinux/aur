# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=hddfancontrol
pkgver=2.1.1
pkgrel=1
pkgdesc='Regulate fan speed according to hard drive temperature'
arch=('x86_64')
url="https://github.com/desbma/${pkgname}"
license=('GPL-3.0-only')
depends=('gcc-libs' 'hddtemp' 'hdparm' 'smartmontools')
optdepends=('sdparm: SAS drive support')
makedepends=('cargo')
backup=("etc/conf.d/${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('c8d6204e245a82e14ba16a91b6588e1c701edb61c079d61a2780146e80a591afa19d62459393f1b93ca41f8493f53a366d0054b3850ac6f932e9f6330b715d1d')

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
          -- \
          gen-man-pages ./target/man/
    rm ./target/man/${pkgname}-gen-*

    mkdir -p target/shellcompletions
    cargo run \
          --frozen \
          --features generate-extras \
          -- \
          gen-shell-completions ./target/shellcompletions

    cargo build --frozen --release
}

check() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm 755 -t "${pkgdir}/usr/bin" ./target/release/${pkgname}

    install -Dm 644 systemd/${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

    install -Dm 644 systemd/${pkgname}.conf "${pkgdir}/etc/conf.d/${pkgname}"

    install -Dm 644 -t "${pkgdir}/usr/share/man/man1" ./target/man/*

    install -Dm 644 -t "${pkgdir}/usr/share/bash-completion/completions" ./target/shellcompletions/*.bash
    install -Dm 644 -t "${pkgdir}/usr/share/zsh/site-functions" ./target/shellcompletions/_${pkgname}
    install -Dm 644 -t "${pkgdir}/usr/share/fish/vendor_completions.d" ./target/shellcompletions/*.fish
}
