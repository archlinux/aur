# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Pylogmon <pylogmon@outlook.com>
_pkgname=pot
pkgname="${_pkgname}-translation-git"
pkgver=r1021.9d35035
pkgrel=1
pkgdesc="一个跨平台的划词翻译软件 | A cross-platform software for text translation."
arch=('x86_64')
url="https://pot.pylogmon.com/"
_githuburl="https://github.com/pot-app/pot-desktop"
license=('GPL3')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=('gcc-libs' 'glibc' 'glib2' 'gdk-pixbuf2' 'gtk3' 'openssl' 'cairo' 'libxcb' 'pango' 'webkit2gtk' 'libsoup' 'bzip2')
makedepends=('nodejs>=18.0.0' 'pnpm>=8.5.0' 'git' 'gendesk' 'rust>=1.69.0')
source=("${pkgname//-g/.g}::git+${_githuburl}.git")
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname//-g/.g}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    cd "${srcdir}/${pkgname//-g/.g}"
    pnpm install --force
    pnpm tauri build -b deb
}
package() {
    install -Dm755 "${srcdir}/${pkgname//-g/.g}/src-tauri/target/release/bundle/deb/${_pkgname}_2.0.0_amd64/data/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-git}"
    sed "s|Exec=${_pkgname}|Exec=${pkgname%-git}|g;s|Icon=${_pkgname}|Icon=${pkgname%-git}|g" \
        -i "${srcdir}/${pkgname//-g/.g}/src-tauri/target/release/bundle/deb/${_pkgname}_2.0.0_amd64/data/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/${pkgname//-g/.g}/src-tauri/target/release/bundle/deb/${_pkgname}_2.0.0_amd64/data/usr/share/applications/${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
    install -Dm644 "${srcdir}/${pkgname//-g/.g}/src-tauri/target/release/bundle/deb/${_pkgname}_2.0.0_amd64/data/usr/share/icons/hicolor/256x256@2/apps/${_pkgname}.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
}