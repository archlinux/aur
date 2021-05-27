# Maintainer: rustemb <rustemb@systemli.org>

pkgname=shadowsocks-rust-git
pkgver=r1442.39b3567
pkgrel=2
pkgdesc='A Rust port of shadowsocks https://shadowsocks.org/ (git version)'
arch=('any')
url='https://github.com/shadowsocks/shadowsocks-rust'
license=('MIT')
depends=('openssl')
makedepends=('cargo' 'libsodium' 'git')
provides=('shadowsocks-rust')
conflicts=('shadowsocks-rust')
source=(
    "git+https://github.com/shadowsocks/${pkgname/-git/}.git"
    'shadowsocks-rust@.service'
    'shadowsocks-rust-server@.service')

sha512sums=('SKIP'
            'fccb02b922369a6ba01e7d438bd8bf306fe25b15d54e0a91e33832bd2726add8e9c01705f1f7a3afe44f3034f6438c3cc8c0fcad8905d67cb789f4f21feef102'
            '573df735263cafc37f5eb315aa5de106141a787a3dfb98a47499f8ed196ca32f1873a644188685512f5e58e062049674c4bcdf6ca9a87ee8dfb840614c69bb55')

pkgver() {
    cd "${srcdir}/${pkgname/-git/}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname/-git/}"
    cargo build --release
}

package() {
    cd "${srcdir}/${pkgname/-git/}"
    install -Dm755 "target/release/sslocal" "${pkgdir}/usr/bin/sslocal-rust"
    install -Dm755 "target/release/ssserver" "${pkgdir}/usr/bin/ssserver-rust"
    install -Dm755 "target/release/ssurl" "${pkgdir}/usr/bin/ssurl-rust"
    install -Dm644 "${srcdir}/shadowsocks-rust@.service" "${pkgdir}/usr/lib/systemd/system/shadowsocks-rust@.service"
    install -Dm644 "${srcdir}/shadowsocks-rust-server@.service" "${pkgdir}/usr/lib/systemd/system/shadowsocks-rust-server@.service"
    install -Dm644 "examples/config_ext.json" "${pkgdir}/etc/shadowsocks/config_ext_rust.json.example"
    install -Dm644 "examples/config.json" "${pkgdir}/etc/shadowsocks/config_rust.json.example"
}
