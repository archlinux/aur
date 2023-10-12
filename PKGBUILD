# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=orca-writer
_pkgname=Orca
pkgver=0.7.0_pre_alpha
pkgrel=3
pkgdesc="React Electron App for Writing and Publishing Novels"
arch=('any')
url="https://orcawriter.app/"
_githuburl="https://github.com/zachhannum/orca"
license=('AGPL3')
conflicts=("${pkgname}")
depends=('libxfixes' 'libdrm' 'pango' 'glib2' 'libxcomposite' 'libxdamage' 'gcc-libs' 'libxkbcommon' 'at-spi2-core' 'nspr' 'gdk-pixbuf2' \
    'libxrandr' 'cairo' 'nss' 'libcups' 'libxcb' 'expat' 'hicolor-icon-theme' 'gtk3' 'mesa' 'libxext' 'alsa-lib' 'dbus' 'libx11' 'glibc')
makedepends=('npm' 'yarn' 'nodejs>=17.0.23' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver//_/-}.tar.gz")
sha256sums=('e0f2857dc98cbe9d83d7633d950a281bdfd0cbe2ce18971a73593c1112778668')
prepare() {
    gendesk -f -n -q --categories "Utility" --name "${pkgname}" --exec "${pkgname} --no-sandbox %U"
}
build() {
    cd "${srcdir}/orca-${pkgver//_/-}"
    rm -rf package-lock.json
    yarn
    yarn package
    cd "${srcdir}/${pkgname%-writer}-${pkgver//_/-}/release/build/linux-unpacked/resources"
    rm -rf app.asar.unpacked assets
}
package() {
    install -Dm755 -d "${pkgdir}/"{usr/bin,opt/"${pkgname}"}
    cp -r "${srcdir}/${pkgname%-writer}-${pkgver//_/-}/release/build/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-writer}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    for _icons in 256x256 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname%-writer}-${pkgver//_/-}/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}