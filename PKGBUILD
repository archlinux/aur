# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>

pkgname=oblivion-desktop
pkgver=3.11.0
pkgrel=1
pkgdesc="Unofficial Warp Client"
arch=('x86_64')
url="https://github.com/bepass-org/oblivion-desktop"
license=('LicenseRef-oblivion-desktop')
_electron=electron38
depends=('bash' "${_electron}")
makedepends=('gendesk' 'nvm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.sh")
sha256sums=('15ec74b0ff1ad9da13d5512e15365b31dba6ab9cff38519f7f5fdb96b784f8a1'
            '31676f8268a42b7cc292e7e8d71e8dab3f41f9b4a5332471134428d821b4338f')

prepare() {
    source /usr/share/nvm/init-nvm.sh

    cd "${pkgname}-${pkgver}"
    sed "s/process.resourcesPath/path.dirname(app.getAppPath())/" -i src/main/main.ts
    sed "s/@ELECTRON@/${_electron}/" -i "${srcdir}/${pkgname}.sh"

    gendesk -f -n \
        --pkgname "${pkgname}" \
        --pkgdesc "${pkgdesc}" \
        --name 'Oblivion Desktop' \
        --categories 'Utility' \
        --custom StartupWMClass='Oblivion Desktop'

    nvm install 22
    npm install
}

build() {
    cd "${pkgname}-${pkgver}"
    npm run build
    npx electron-builder --linux --dir \
        -c.electronDist="/usr/lib/${_electron}" \
        -c.electronVersion="$(cat /usr/lib/${_electron}/version)"
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm644 release/build/linux-unpacked/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r release/build/linux-unpacked/resources/assets "${pkgdir}/usr/lib/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 assets/icon.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
