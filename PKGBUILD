# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-vscode
pkgver=2.5.2
pkgrel=1
pkgdesc="Add VSCode workspaces to Gnome search"
arch=('x86_64')
url="https://codeberg.org/swsnr/gnome-search-providers-vscode"
license=('EUPL-1.2')
depends=('sqlite')
makedepends=('rust' 'just')
source=(
    "${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.tar.zst"
    "${pkgname}-v${pkgver}.tar.zst.sshsig::${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.tar.zst.sig"
    "${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-vendor.tar.zst"
    "${pkgname}-v${pkgver}-vendor.tar.zst.sshsig::${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-vendor.tar.zst.sig"
    "config.toml"
    "allowed-signers"
)
sha256sums=('d5c9296e6e6b440301e6691dc6e23c490e1103cd3d1a7b831a2125871814b9fa'
            '609c9c40dd11510005dcf2fc08c47380fb6e9764459820f7053967871d413575'
            '1c04d02db5467c3bfaeb27e19133ef71010aabb3b1475989ca39fb8f52ce9006'
            'bc4bd91e09fcc27a44dcb4b4036df91f6fd8f9f25bae26376fb6e2dd6547001e'
            '8dc330c974e99a362fd8d27f5d76f485da9559f80d576e0fd9ffb1779e4dd881'
            '2691054f647923a439befd20624c23e9cf2c0c0c300dccd33ceaa052b9fbb5ce')

verify() {
    for file in "${pkgname}-v${pkgver}.tar.zst" "${pkgname}-v${pkgver}-vendor.tar.zst"; do
        ssh-keygen -Y verify -f allowed-signers -I sebastian@swsnr.de -n file -s "${file}.sshsig" < "${file}"
    done
}

prepare() {
    cd "${pkgname}-v${pkgver}" || exit 1
    install -D -m644 "${srcdir}/config.toml" .cargo/config.toml
}

build() {
    cd "${pkgname}-v${pkgver}" || exit 1
    cargo build --release
}

package() {
    cd "${pkgname}-v${pkgver}" || exit 1
    just destdir="${pkgdir}" prefix="/usr" install
}
