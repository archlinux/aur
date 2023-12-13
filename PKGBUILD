# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cpeditor-bin
pkgver=6.10.3
pkgrel=4
pkgdesc="The IDE for competitive programming Fetch, Code, Compile, Run, Check, Submit"
arch=("x86_64")
url="https://cpeditor.org/"
_ghurl="https://github.com/cpeditor/cpeditor"
license=("GPL3")
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
sha256sums=('47ce8cd065753557d04270dcd32d2bc8b737e3ce8a9a48e59017c0e0f4786a33'
            'a1a0ea8587bea028986bad7f0bda405ebea7d52403e22af09eaf092e4edc0acd')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runappname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|usr/share|opt|g" -i "${srcdir}/usr/share/${pkgname%-bin}/${pkgname%-bin}.sh"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt"
    cp -r "${srcdir}/usr/share/${pkgname%-bin}" "${pkgdir}/opt"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/"* -t "${pkgdir}/opt/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}