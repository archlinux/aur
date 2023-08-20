# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mkfont
pkgver=1.2.2
pkgrel=1
pkgdesc="A free (libre) tool to create & export fonts from existing assets. Component-based workflow, with advanced features to nit-pick & tweak metrics in a non-destructive way!"
arch=('x86_64')
url="https://nebukam.github.io/mkfont/"
_githuburl="https://github.com/Nebukam/mkfont"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron24' 'python>=3' 'glibc')
makedepends=('gendesk' 'yarn')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('116b6cd51faef1d61720f7c57bc515645c474a5c637ab9e057cae50e7fa667c3'
            '5017fdeb3952432e03050cc4abb6721fd7a303cd3a7627d0aadd787c678b5aef')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    #Just build linux packages
    sed "36s|true|false|;70s|false|true|" -i nkmjs.config.json
    yarn install
    yarn run nkmjs build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/opt/${pkgname}/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/builds/${pkgver}/desktop/linux-x64-${pkgver}/linux-unpacked/resources/"* "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/128.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    gendesk -f -n --icon "${pkgname}" --categories "Utility" --name "${pkgname}" --exec "/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}