# Maintainer: devome <evinedeng@hotmail.com>

pkgname=cmd-wrapped
pkgver=0.2.0
pkgrel=1
pkgdesc="Find out what the past year looks like in command line!"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/YiNNx/${pkgname}"
license=('MIT')
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('06f21be755a0a0b362472bbe565391c26056d27aeed6ca81457a9b7977f553e6')

prepare() {
    cd "${pkgname}-${pkgver}"
    cargo update
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --frozen --all-features
}

check() {
    cd "${pkgname}-${pkgver}"
    cargo test --frozen --all-features --workspace
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 License "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" *.md
}
