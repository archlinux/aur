# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=query-master
pkgver=0.2.7
pkgrel=1
pkgdesc="Just another MySQL GUI client"
arch=('any')
url="https://github.com/invisal/query-master"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron23' 'hicolor-icon-theme')
makedepends=('yarn' 'npm' 'gendesk' 'nodejs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('84116690d62b60fa0933619cae9bdac14111867776464b7c158ea9131a57486c'
            'f5bb4e8fe5754a81567447bc021176a928d2fd196ec2c19a9c3a35b3219ed0b3')
build() {
    cd "${srcdir}/${pkgname%-appimage}-${pkgver}"
    yarn install
    yarn package
}
package() {
    install -Dm0755 -d "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/release/build/linux-unpacked/resources/"* "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    gendesk -f -n --icon "${pkgname}" --categories "Development;Utility" --name "${pkgname}" --exec "/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/opt/${pkgname}/${pkgname}"
}