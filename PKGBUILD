# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Pylogmon <pylogmon@outlook.com>
_pkgname=pot
pkgname="${_pkgname}-translation-git"
pkgver=2.7.0.r0.g81d8ccb
pkgrel=1
pkgdesc="一个跨平台的划词翻译软件 | A cross-platform software for text translation."
arch=('x86_64')
url="https://pot.pylogmon.com/"
_githuburl="https://github.com/pot-app/pot-desktop"
license=('GPL3')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=(
    'gdk-pixbuf2'
    'gtk3'
    'openssl'
    'cairo'
    'libxcb'
    'pango'
    'webkit2gtk'
    'libsoup'
    'bzip2'
    'hicolor-icon-theme'
    'tessdata'
    'libxrandr'
    'tesseract'
    'xdotool'
    'libayatana-appindicator'
)
makedepends=(
    'nodejs>=18.0.0'
    'pnpm>=8.5.0'
    'git'
    'gendesk'
    'rust>=1.69.0'
)
source=("${pkgname//-g/.g}::git+${_githuburl}.git")
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname//-g/.g}"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
build() {
    gendesk -q -f -n --pkgname "${_pkgname}-translation-git" --categories "Office;Utility" --name "${pkgname%-git}" --exec "${pkgname%-git}"
    cd "${srcdir}/${pkgname//-g/.g}"
    sed "s|icon.ico|icon.png|g" -i src-tauri/tauri.linux.conf.json
    pnpm install --force
    pnpm tauri build -b deb
    _pkgver=`cat package.json | grep version | awk '{print $2}' | tr -d '"' | tr -d ","`
}
package() {
    install -Dm755 "${srcdir}/${pkgname//-g/.g}/src-tauri/target/release/bundle/deb/${_pkgname}_${_pkgver}_amd64/data/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-g/.g}/src-tauri/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
}