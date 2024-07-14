# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>

pkgname=oblivion-desktop
_pkgver=0.35.1-beta
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc="Unofficial Warp Client"
arch=('x86_64')
url="https://github.com/bepass-org/oblivion-desktop"
license=('LicenseRef-oblivion-desktop')
_electron=electron27
depends=('bash' "${_electron}")
makedepends=('gendesk' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz"
        "${pkgname}.sh"
        'tray-icon.patch')
sha256sums=('051233707510cf9639d10f73b7b9e8f5ffdfe10335ab3a30899510e74364c636'
            '31676f8268a42b7cc292e7e8d71e8dab3f41f9b4a5332471134428d821b4338f'
            'd73fe075981f414a2cd3f821f102a9aeadc6b4b61fdeefeb7ba540a3c9150289')

prepare() {
    sed "s/@ELECTRON@/${_electron}/" -i "${pkgname}.sh"

    cd "${pkgname}-${_pkgver}"
    patch -p1 -i "${srcdir}/tray-icon.patch"

    gendesk -f -n \
        --pkgname "${pkgname}" \
        --pkgdesc "${pkgdesc}" \
        --name 'Oblivion Desktop' \
        --categories 'Utility' \
        --custom StartupWMClass='Oblivion Desktop'

    npm install
}

build() {
    cd "${pkgname}-${_pkgver}"
    npm run build
    npx electron-builder --linux --dir \
        -c.electronDist="/usr/lib/${_electron}" \
        -c.electronVersion="$(cat /usr/lib/${_electron}/version)"
}

package() {
    cd "${pkgname}-${_pkgver}"
    install -d "${pkgdir}/usr/lib"
    cp -r release/build/linux-unpacked/resources "${pkgdir}/usr/lib/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 assets/icon.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
