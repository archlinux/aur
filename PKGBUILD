# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="calamus-appimage"
pkgver=0.6.2_pre_alpha
_pkgver=0.6.2-pre-alpha
pkgrel=2
pkgdesc="React Electron App for Writing and Publishing Novels"
arch=('x86_64')
url="https://orcawriter.app/"
_githuburl="https://github.com/zachhannum/orca"
license=('AGPL3')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
makedepends=('npm' 'yarn' 'electron' 'gendesk')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('4370a0199954dd04a21c712488d3f4c56cf05d3484431d14aedc6fef98eb621d')
build() {
    cd "${srcdir}/orca-${_pkgver}"
    yarn install
    yarn build
    npx browserslist@latest --update-db
    yarn package
}
package() {
    install -Dm755 "${srcdir}/orca-${_pkgver}/release/build/Calamus-${_pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/orca-${_pkgver}/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png"
    done
    gendesk -f -n --icon "${pkgname%-appimage}" --categories "Utility" --name "Calamus" --exec "${_install_path}/${pkgname%-appimage}.AppImage --no-sandbox %U"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}