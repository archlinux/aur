# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=electron-gpt
pkgname="${_pkgname}-git"
pkgver=r765.a1f4b09
pkgrel=1
pkgdesc="Simplified chat using OpenAI's GPT"
arch=('x86_64')
url="https://github.com/Bubuclem/electron-gpt"
license=('custom:CC0-1.0')
depends=(
    'electron27'
    'python>=3.9'
    'sqlite'
    'python-setuptools'
)
makedepends=(
    'npm'
    'git'
    'nodejs'
    'gendesk'
    'make'
    'gcc'
)
source=(
    "${_pkgname}::git+${url}.git#tag=master"
    "${_pkgname}.sh"
)
sha256sums=('SKIP'
            'a1349203622d4710bed1b45354488e42729fa2be71ee791cacd54f736f193b70')
pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    gendesk -q -f -n --pkgname "${_pkgname}" --categories "Utility" --name "${_pkgname}" --exec "${_pkgname}"
    cd "${srcdir}/${_pkgname}"
    npm install
    npm update node-abi
    npm run package
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${_pkgname}"
    cp -r "${srcdir}/${_pkgname}/out/chatgpt-linux-x64/resources/app" "${pkgdir}/usr/lib/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}/assets/favicon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}