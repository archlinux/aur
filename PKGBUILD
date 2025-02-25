# Maintainer: Dct Mei <dctxmei at yandex dot com>
# Co-Maintainer: RogueGirl <3a33oxx40 at mozmail dot com>

pkgname=geph4-client
pkgver=4.99.32
pkgrel=1
pkgdesc="The command-line Geph client"
arch=('x86_64')
url="https://github.com/geph-official/geph4-client"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
backup=('etc/default/geph4-client')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "geph4-client.default"
        "geph4-client.service")
sha256sums=('fd6585717448b796d90b7b6dadd609c86c806ee7b4c9f0a21e27ffb47e8ff59c'
            '214d884807236b9d4d82ba01d8cd468afc62071e9c352cca642037426b2da661'
            '317191b59af3d7c674069268738f4734237f12da01b31814d871a9df669f4927')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin/"
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/geph4-client.default" "${pkgdir}/etc/default/geph4-client"
    install -Dm644 "${srcdir}/geph4-client.service" -t "${pkgdir}/usr/lib/systemd/system/"
}
