# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Pylogmon <pylogmon@outlook.com>
_pkgname=pot
pkgname="${_pkgname}-translation-git"
pkgver=2.6.8.r0.g370bbcf
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
    pnpm install --force
    pnpm tauri build -b deb
}
package() {
    install -Dm755 "${srcdir}/${pkgname//-g/.g}/src-tauri/target/release/bundle/deb/${_pkgname}_2.6.8_amd64/data/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/${pkgname//-g/.g}/src-tauri/target/release/bundle/deb/${_pkgname}_2.6.8_amd64/data/usr/share/icons/hicolor/256x256@2/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps/${pkgname%-git}.png"
    done
}