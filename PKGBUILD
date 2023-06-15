# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hiregpt-bin
_appname=HireGPT
pkgver=0.2.0
pkgrel=1
pkgdesc="Job application made easy with OpenAI GPT model"
arch=('x86_64')
url="https://github.com/jaejaywoo/HireGPT"
license=('MIT')
options=(!strip)
conflits=("${pkgname%-bin}")
depends=('at-spi2-core' 'mesa' 'expat' 'libxcb' 'libxkbcommon' 'libxdamage' 'gtk3' 'glib2' 'libx11' 'libxcomposite' 'libxext' \
    'libdrm' 'glibc' 'nspr' 'alsa-lib' 'gcc-libs' 'libxfixes' 'pango' 'dbus' 'libcups' 'libxrandr' 'python' 'cairo' 'nss')
makedepends=('pnpm' 'gendesk')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0314ae43b6671d7e80e261c096c76cdb564c509104b1cfbca20b1340ebb87ebd')

build() {
    cd "${srcdir}/${_appname}-${pkgver}"
    pnpm install && pnpm run package
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${_appname}-${pkgver}/out/${_appname}-linux-x64/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "${pkgname%-bin}" --exec "/opt/${pkgname%-bin}/${_appname} %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}