# Maintainer: rustemb <rustemb@systemli.org>

pkgname=shadowsocks-rust-git
pkgver=r1442.39b3567
pkgrel=1
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

sha512sums=(
    'SKIP'
    '3f56e02462ba8fa0a1cf62eaae5b796d7efb31ae1a8383a1132878244c1ab834ca3e23befa4c0c14c461c9883522d4f54f80aba45cd6331061bdd42618cbcfc6'
    '770c50dd191f29e4fb42d3273970b9c49c33fc1ca347b0f73fc34e04955f98ce1ca9486435c809bbb535fe79edb54c0107f37501e771a9cc9cc6ab727b596c6d'
)

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
