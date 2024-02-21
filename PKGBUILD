# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cpeditor-bin
pkgver=7.0.1
pkgrel=2
pkgdesc="The IDE for competitive programming Fetch, Code, Compile, Run, Check, Submit"
arch=("x86_64")
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
    'syntax-highlighting5'
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
            'b4eae24229532b482599a1aeeba095b536f403a91f99a86a78918d4cebfb6fde')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
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