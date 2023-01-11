# Maintainer: HelloImWar <helloimwar at proton dot me>

pkgname=mozwire-git
_pkgname=${pkgname%-git}
pkgver=0.8.0.r2.g69c3b49
pkgrel=2
pkgdesc='A cross-platform client for MozillaVPN'
url='https://github.com/NilsIrl/MozWire'
arch=('x86_64')
license=('GPL3')
depends=('gcc-libs')
makedepends=('git' 'cargo')
source=("${_pkgname}::git+${url}.git")
provides=(${_pkgname})
conflicts=(${_pkgname})
sha512sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgname}"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${_pkgname}"
    cargo build --release --locked --all-features --target-dir=target
}

check() {
    cd "${_pkgname}"
    cargo test --release --locked --all-features --target-dir=target
}

package() {
    cd "${_pkgname}"
    install -Dm 755 "target/release/mozwire" -t "${pkgdir}/usr/bin"
    install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
}
