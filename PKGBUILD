# Maintainer: BigmenPixel <bigmen dot pixel at tuta dot io>
# Contributor: rustemb <rustemb at systemli dot org>

pkgname=shadowsocks-rust
pkgver=1.12.5
pkgrel=1
pkgdesc='A Rust port of shadowsocks https://shadowsocks.org/'
arch=('any')
url='https://github.com/shadowsocks/shadowsocks-rust'
license=('MIT')
depends=('openssl')
makedepends=('cargo-nightly' 'libsodium')
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
    'shadowsocks-rust@.service'
    'shadowsocks-rust-server@.service')

sha512sums=('43f047f9c957c7a1a201df126041d3152fe679d751bdaeb1b71a728bc6ba92951bee0d2d478f78175f03ccc5a850c5fd627f3f31daa9ddf413e2f735e560392a'
            '0f714e3f085406ee011155daabe4a69514b5bd5d0587a3d7ebc5be459565d4c090b0fd6977fc8af7ba681e876b0d38859aa7e39f51a984de66cc9a623375e736'
            '6292de41dd0da9b70a1f060a19e4d9acdb66e67f8b41e84d31b331d012296c29c59c63cfb02763538dd46931412243be1098876bc93078b8cb92573be2a32b24')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --features local-redir,local-tun
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo test --frozen --features local-redir,local-tun
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 "target/release/sslocal" "${pkgdir}/usr/bin/sslocal-rust"
    install -Dm755 "target/release/ssserver" "${pkgdir}/usr/bin/ssserver-rust"
    install -Dm755 "target/release/ssurl" "${pkgdir}/usr/bin/ssurl-rust"
    install -Dm755 "target/release/ssmanager" "${pkgdir}/usr/bin/ssmanager"
    install -Dm755 "target/release/ssservice" "${pkgdir}/usr/bin/ssservice"
    install -Dm644 "${srcdir}/${pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}@.service"
    install -Dm644 "${srcdir}/${pkgname}-server@.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}-server@.service"
    install -Dm644 "examples/config_ext.json" "${pkgdir}/etc/${pkgname}/config_ext_rust.json.example"
    install -Dm644 "examples/config.json" "${pkgdir}/etc/${pkgname}/config_rust.json.example"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
