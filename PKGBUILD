# Maintainer:
# Contributor: h3li0p4us3 Moharami <h3li0p4us3 at proton dot me>

pkgname=dnschanger-desktop
pkgver=2.3.10
pkgrel=1
pkgdesc="DNS Changer for Windows, Mac and Linux operating systems"
arch=('any')
url="https://dnschanger.github.io"
license=('MIT')
_electron=electron43
depends=('bash' "${_electron}")
makedepends=('gendesk' 'npm' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/DnsChanger/dnsChanger-desktop/archive/v${pkgver}.tar.gz"
        "${pkgname%-desktop}.sh")
sha256sums=('f80dc6d19a21c02b8365130ac025e132384c791bef4d8578eb5fe44b38a8c4c9'
            '98d8ee3e79aab28eaad39a4064dce1c5eaf946b7f437fd421b3bca30dd294810')

prepare() {
    cd "dnsChanger-desktop-${pkgver}"
    gendesk -f -n \
        --pkgname "${pkgname}" \
        --pkgdesc "${pkgdesc}" \
        --name 'DNS Changer' \
        --categories 'Utilities' \
        --custom StartupWMClass='DNS Changer'
    sed "s/@ELECTRON@/${_electron}/" -i "${srcdir}/${pkgname%-desktop}.sh"
}

build() {
    cd "dnsChanger-desktop-${pkgver}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    npm install --force
    npm run build -- --linux --dir \
        --config.electronDist="/usr/lib/${_electron}" \
        --config.electronVersion="$(cat /usr/lib/${_electron}/version)"
}

package() {
    cd "dnsChanger-desktop-${pkgver}"
    install -Dm644 "release/${pkgver}/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-desktop}"
    install -Dm644 public/icons/icon.png "${pkgdir}/usr/share/pixmaps/${pkgname%-desktop}.png"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm755 "${srcdir}/${pkgname%-desktop}.sh" "${pkgdir}/usr/bin/${pkgname%-desktop}"
}
