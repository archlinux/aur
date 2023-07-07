# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="orca-writer"
pkgver=0.7.0_pre_alpha
_pkgver=0.7.0-pre-alpha
pkgrel=1
pkgdesc="React Electron App for Writing and Publishing Novels"
arch=('any')
url="https://orcawriter.app/"
_githuburl="https://github.com/zachhannum/orca"
license=('AGPL3')
conflicts=("${pkgname}")
depends=('electron' 'hicolor-icon-theme' 'libvips' 'libgsf' 'orc' 'libexif' 'python' 'glibc' 'freetype2' 'expat' 'harfbuzz' 'gcc-libs' \
    'libjpeg-turbo' 'fribidi' 'cairo' 'pixman' 'libxml2' 'pango' 'giflib' 'librsvg' 'zlib' 'libwebp' 'lcms2' 'fontconfig' 'glib2' 'bash' \
    'gdk-pixbuf2' 'libpng')
makedepends=('npm' 'yarn' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${_pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('e0f2857dc98cbe9d83d7633d950a281bdfd0cbe2ce18971a73593c1112778668'
            '99ab9457c2ba6fa2b2d5011dee55b1a808ddecb1302a594d7181a040328ad831')
build() {
    cd "${srcdir}/orca-${_pkgver}"
    yarn install
    npx browserslist@latest --update-db -y
    yarn package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/opt/${pkgname}/${pkgname}"
    cp -r "${srcdir}/${pkgname%-writer}-${_pkgver}/release/build/linux-unpacked/resources/"* "${pkgdir}/opt/${pkgname}"
    for _icons in 256x256 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname%-writer}-${_pkgver}/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    gendesk -f -n --icon "${pkgname}" --categories "Utility" --name "${pkgname}" --exec "/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}