# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=query-master
pkgver=0.3.4
pkgrel=1
pkgdesc="Just another MySQL GUI client"
arch=('any')
url="https://github.com/invisal/query-master"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron23' 'hicolor-icon-theme')
makedepends=('npm>=7' 'gendesk' 'nodejs>=14')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('ec906d4d3a00f088fa59a3b203cc38d85b599334da6c4329c04c1b6b90ad35c1'
            'f5bb4e8fe5754a81567447bc021176a928d2fd196ec2c19a9c3a35b3219ed0b3')
build() {
    cd "${srcdir}/${pkgname%-appimage}-${pkgver}"
    npm install --force
    npm run package
}
package() {
    install -Dm0755 -d "${pkgdir}/opt/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/release/build/linux-unpacked/resources/"* "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    gendesk -f -n --categories "Development;Utility" --name "${pkgname}" --exec "${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}