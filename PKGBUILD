# Maintainer: kvunoff <kvunoff@proton.me>
pkgname=whoisthat
pkgver=0.9.0
pkgrel=1
pkgdesc="Modern terminal-based VPN client with Xray-core backend"
arch=('x86_64')
url="https://github.com/kvunoff/whoisthat"
license=('MIT')
depends=('xray')
makedepends=('rust' 'go')
optdepends=('tun2socks: for TUN mode VPN support'
            'tun2socks-bin: for TUN mode VPN support (alternative)'
            'hysteria: for hysteria2 / hy2:// profiles')
install=whoisthat.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kvunoff/whoisthat/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    cd parser
    cargo build --release
    cd ..

    cd core/core
    go build -o whoisthat-core
    cd ../..

    cargo build --release
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 target/release/whoisthat              "${pkgdir}/usr/bin/whoisthat"
    install -Dm755 core/core/whoisthat-core               "${pkgdir}/usr/bin/whoisthat-core"
    install -Dm755 parser/target/release/whoisthat-parser "${pkgdir}/usr/bin/whoisthat-parser"
}
