# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cpeditor-bin
pkgver=7.1.1
pkgrel=1
pkgdesc="The IDE for competitive programming Fetch, Code, Compile, Run, Check, Submit.(Prebuilt version)"
arch=('x86_64')
url="https://cpeditor.org/"
_ghurl="https://github.com/cpeditor/cpeditor"
license=("GPL-3.0-or-later")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=('!strip')
depends=(
    'qt5-base'
    'libgpg-error'
    'freetype2'
    'libx11'
    'e2fsprogs'
    'fontconfig'
    'libglvnd'
    'libxcb'
    'syntax-highlighting'
)
optdepends=(
    'cf-tool: submit to Codeforces'
    'clang: C++ format and language server'
    'java-environment: compile Java'
    'java-runtime: execute Java'
    'python: execute Python'
    'wakatime: track coding stats'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-linux-amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('739fbb54c09f44e84b27012aa299c5c9dcb4c19df0f794e5d44e7feac74f8d6d'
            '187af44879585688a89874e74896e13840b3bb8defc9190a16ff6962adae01eb')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/share/lib/g" "${srcdir}/usr/share/${pkgname%-bin}/${pkgname%-bin}.sh"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share/${pkgname%-bin}" "${pkgdir}/usr/lib"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}
