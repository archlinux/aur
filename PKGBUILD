# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hiregpt
_appname=HireGPT
pkgver=0.2.0
pkgrel=2
pkgdesc="Job application made easy with OpenAI GPT model"
arch=('x86_64')
url="https://github.com/jaejaywoo/HireGPT"
license=('MIT')
conflits=("${pkgname}")
depends=('bash' 'electron23')
makedepends=('npm' 'gendesk' 'nodejs' 'asar')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname%-bin}.sh")
sha256sums=('0314ae43b6671d7e80e261c096c76cdb564c509104b1cfbca20b1340ebb87ebd'
            '809b269bd9209365ca66ffcbb7d7c3185960abf9f19ef059b16f9a683dbf470b')
build() {
    cd "${srcdir}/${_appname}-${pkgver}"
    npm install
    npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar pack "${srcdir}/${_appname}-${pkgver}/out/${_appname}-linux-x64/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    gendesk -f -n --icon "${pkgname}" --categories "Utility" --name "${_appname}" --exec "/opt/${pkgname}/${_appname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}