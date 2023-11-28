# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gui-butler
pkgver=2.3.1
pkgrel=3
pkgdesc="A wrapper for itch.io's butler which lets you take advantage of the basic features without having to go through a CLI or set up build scripts for each new project."
arch=('x86_64')
url="https://seansleblanc.itch.io/gui-butler"
_ghurl="https://github.com/seleb/gui-butler"
license=('MIT')
conflicts=("${pkgname}")
noextract=("butler.zip")
depends=(
    'electron25'
)
makedepends=(
    'npm'
    'gendesk'
    'nvm'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}.git#tag=v${pkgver}"
    "butler.zip::https://broth.itch.ovh/butler/linux-amd64/LATEST/archive/default"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            'b640fceade5cafc7601b0ee57ba13c85913917eb5440375f7a605126f9ca2e1c'
            '56b4615628f0503dfaab44c19e4f9edc78d70775cb04375bdc16cac2b78cab6a')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install 18
    nvm use 18
}
build() {
    _ensure_local_nvm
    gendesk -f -n -q --categories "Development;Utility" --name "${pkgname}" --exec "${pkgname} --no-sandbox %U"
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install --force  --cache "${srcdir}/npm-cache"
    npm run build
    mkdir -p "${srcdir}/${pkgname}-${pkgver}/bin/${pkgname}-linux-x64/resources/app/butler"
    bsdtar -xf "${srcdir}/butler.zip" -C "${srcdir}/${pkgname}-${pkgver}/bin/${pkgname}-linux-x64/resources/app/butler"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/bin/${pkgname}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/favicon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}