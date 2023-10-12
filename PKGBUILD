# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gui-butler
pkgver=2.3.1
pkgrel=2
pkgdesc="A wrapper for itch.io's butler which lets you take advantage of the basic features without having to go through a CLI or set up build scripts for each new project."
arch=('x86_64')
url="https://seansleblanc.itch.io/gui-butler"
_githuburl="https://github.com/seleb/gui-butler"
license=('MIT')
conflicts=("${pkgname}")
noextract=("butler.zip")
depends=('glibc' 'expat' 'cairo' 'alsa-lib' 'libxdamage' 'gtk3' 'libxext' 'glib2' 'nspr' 'libxcb' 'libdrm' 'nss' 'libxfixes' \
    'bash' 'at-spi2-core' 'gcc-libs' 'libxcomposite' 'dbus' 'libxrandr' 'pango' 'libx11' 'libxkbcommon' 'libcups' 'mesa')
makedepends=('npm' 'gendesk' 'nodejs>=18')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz"
    "butler.zip::https://broth.itch.ovh/butler/linux-amd64/LATEST/archive/default")
sha256sums=('22364d6b0ee54059e28cd7b12d863b3b6e3b1f71a1d672d9d9dce7442bd2bb3d'
            'b640fceade5cafc7601b0ee57ba13c85913917eb5440375f7a605126f9ca2e1c')
prepare() {
    gendesk -f -n -q --categories "Development;Utility" --name "${pkgname}" --exec "${pkgname} --no-sandbox %U"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install --force
    npm run build
    mkdir -p "${srcdir}/${pkgname}-${pkgver}/bin/${pkgname}-linux-x64/resources/app/butler"
    bsdtar -xf "${srcdir}/butler.zip" -C "${srcdir}/${pkgname}-${pkgver}/bin/${pkgname}-linux-x64/resources/app/butler"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    cp -r "${srcdir}/${pkgname}-${pkgver}/bin/${pkgname}-linux-x64/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/favicon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}