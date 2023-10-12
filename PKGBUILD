# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hiregpt
_appname=HireGPT
pkgver=0.2.0
pkgrel=3
pkgdesc="Job application made easy with OpenAI GPT model"
arch=('x86_64')
url="https://github.com/jaejaywoo/HireGPT"
license=('MIT')
conflits=("${pkgname}")
depends=('bash' 'electron23')
makedepends=('npm' 'gendesk' 'nodejs>=16' 'asar')
source=("${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip"
    "${pkgname%-bin}.sh")
sha256sums=('339df14c582d864a7f4bf1043556ca42e108506d06f1ab77a8cc29a083ec618e'
            '67230bdc1ec269961c56c3a657834791a6ab9cf3d53362651c89dba812bc64cb')
prepare() {
    gendesk -f -q --categories "Utility" --name "${_appname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${_appname}-${pkgver}"
    npm install
    npm run package
    asar p "${srcdir}/${_appname}-${pkgver}/out/${_appname}-linux-x64/resources/app" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}