# Maintainer: Mat1RX <128741062+Mat1RX@users.noreply.github.com>
_pkgname=waybar-awg-toggle
pkgname=waybar-awg-toggle-git
pkgver=r12.443de88
pkgrel=1
pkgdesc="A lightweight Waybar plugin for managing AmneziaWG connections (Rust)"
arch=('x86_64' 'aarch64')
url="https://github.com/Mat1RX/waybar-awg-toggle"
license=('GPL-3.0-only')
depends=('amneziawg-tools' 'polkit')
makedepends=('cargo' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git"
        "10-awg-toggle.rules")
sha256sums=('SKIP'
            '64f00d73bd99069a999224c56e604f6a91fcd01542b063125e15008c41ec64d2')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    export CARGO_HOME="${srcdir}/cargo-home"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${_pkgname}"
    export CARGO_HOME="${srcdir}/cargo-home"
    cargo build --release --frozen
}

package() {
    cd "${srcdir}/${_pkgname}"
    
    install -Dm755 "target/release/awg-toggle" "${pkgdir}/usr/bin/awg-toggle"
    
    install -Dm644 "${srcdir}/10-awg-toggle.rules" "${pkgdir}/etc/polkit-1/rules.d/10-awg-toggle.rules"
    
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
