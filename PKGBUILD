# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=hddfancontrol
pkgver=2.1.2
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
sha512sums=('1d9f08a9758445ec7eecd1c3ffb04adcddfd73e8e79ed4dc499519caac11bd06c50ff82ced914f1621df70022f19b21209d93590129ea802c028bed824c8f185')

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
