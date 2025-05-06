# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=git-gone
pkgver=1.3.0
pkgrel=1
pkgdesc='Prune stale local Git branches'
arch=('i686' 'x86_64')
url="https://codeberg.org/swsnr/git-gone"
license=('Apache-2.0')
depends=()
conflicts=('git-gone-git')
makedepends=('rust' 'cargo')
source=(
    "${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.tar.zst"
    "${pkgname}-v${pkgver}.tar.zst.sshsig::${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.tar.zst.sig"
    "${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-vendor.tar.zst"
    "${pkgname}-v${pkgver}-vendor.tar.zst.sshsig::${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-vendor.tar.zst.sig"
    "config.toml"
    "allowed-signers"
)
sha256sums=('dbdc45b90d496cfa63155f0c614f3dc69a6ff2fe834121bcac984ca8eeea4197'
            '469b1478a424d4fafc764466da76c959f72deba139750258bfb7401ba2f5bba3'
            '3b7cf87e563fbc9c715ec43a80a346f4262432899ec6b7cbb92e8a88a97c2090'
            '3b78e525ef81dd95cfc7a3ed3b89f24e61d528437ba8596f5e56334411d7515a'
            '8dc330c974e99a362fd8d27f5d76f485da9559f80d576e0fd9ffb1779e4dd881'
            '2691054f647923a439befd20624c23e9cf2c0c0c300dccd33ceaa052b9fbb5ce')

verify() {
    for file in "${pkgname}-v${pkgver}.tar.zst" "${pkgname}-v${pkgver}-vendor.tar.zst"; do
        ssh-keygen -Y verify -f allowed-signers -I sebastian@swsnr.de -n file -s "${file}.sshsig" < "${file}"
    done
}

prepare() {
    cd "${pkgname}-v${pkgver}" || return 1
    install -D -m644 "${srcdir}/config.toml" .cargo/config.toml
}

build() {
    cd "${pkgname}-v${pkgver}" || return 1
    cargo build --release --locked
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-v${pkgver}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
