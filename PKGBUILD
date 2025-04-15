# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cpeditor-bin
pkgver=7.0.1
pkgrel=5
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
sha256sums=('30303f0c7bcac3ae9cc6550ed9e86e5be8c4c1d49e09542dca18f17a2561b0a6'
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