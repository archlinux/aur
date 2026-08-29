# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=rusty-filer
pkgver=1.0.0
pkgrel=1
url='https://codeberg.org/thomas.leister/rusty-filer'
license=('MIT')
pkgdesc='External XMPP HTTP Upload Server for Prosody and Ejabberd'
arch=('x86_64')
depends=(glibc libgcc zstd)
makedepends=(cargo git)
backup=("etc/rusty-filer.toml")
install=rusty-filer.install
source=(git+https://codeberg.org/thomas.leister/rusty-filer.git#tag=v${pkgver}
        rusty-filer.service
        rusty-filer.sysusers
        rusty-filer.tmpfiles)
sha256sums=('3089bf336d4ed026dc3dbe0fe8af5756b9d5888ed1161fec56a12940bc1c8fab'
            '78701e484f746d376978c4b8c2c1418a7fd996d9abec636a25c77bb9ebb57ac8'
            '65e8834a77ec76edb8aaa123a0b3d71fbc33b8a61d3c6f83dbab7018699589df'
            'b0c359a4c719ba4e2a334093f61e2eb4eff0cd46a514f52b1671a0403266203c')


prepare() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export ZSTD_SYS_USE_PKG_CONFIG=1
    cargo build --frozen --release --all-features
}

package() {
    install -Dm0755 -t "${pkgdir}/usr/bin/" "${pkgname}/target/release/$pkgname"

    install -Dm0644 ${pkgname}/config.example.toml "${pkgdir}/etc/rusty-filer.toml"
    install -Dm0644 -t "${pkgdir}/usr/lib/systemd/system/" ${pkgname}.service
    install -Dm0644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm0644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
