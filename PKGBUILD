# Maintainer:
# Contributor: h3li0p4us3 Moharami <h3li0p4us3 at proton dot me>

pkgname=dnschanger-desktop
pkgver=2.3.2
pkgrel=1
pkgdesc="DNS Changer for Windows, Mac and Linux operating systems"
arch=('x86_64')
url="https://dnschanger.github.io"
license=('MIT')
_electron=electron33
depends=('bash' "${_electron}" 'gcc-libs' 'glibc')
makedepends=('gendesk' 'npm' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/DnsChanger/dnsChanger-desktop/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname%-desktop}.sh")
sha256sums=('afe7b4c5686489201b2f99385dad16e2eae645a5e1d7802a4e957ebb7ea1ce7b'
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

    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    npm install
}

build() {
    cd "dnsChanger-desktop-${pkgver}"
    npm run build:code
    npx electron-builder --linux --dir \
        -c.electronDist="/usr/lib/${_electron}" \
        -c.electronVersion="$(cat /usr/lib/${_electron}/version)"
}

package() {
    cd "dnsChanger-desktop-${pkgver}"
    install -Dm644 "release/${pkgver}/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-desktop}"
    cp -r "release/${pkgver}/linux-unpacked/resources/app.asar.unpacked" -t "${pkgdir}/usr/lib/${pkgname%-desktop}"
    install -Dm644 public/icons/icon.png "${pkgdir}/usr/share/pixmaps/${pkgname%-desktop}.png"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm755 "${srcdir}/${pkgname%-desktop}.sh" "${pkgdir}/usr/bin/${pkgname%-desktop}"
}
