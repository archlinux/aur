# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=random-browser-git
_pkgname="Random Browser"
pkgver=2.0.0.r0.g81835b1
_electronversion=22
pkgrel=1
pkgdesc="A little experiment of an internet browser"
arch=('x86_64')
url="https://github.com/YisusGaming/random-browser"
license=('custom:CC BY-NC-ND 4.0')
conflicts=(
    "${pkgname%-git}"
)
provides=(
    "${pkgname%-git}"
)
depends=(
    "electron${_electronversion}"
    'nodejs'
)
makedepends=(
    'gendesk'
    'git'
    'npm'
    'yarn'
    'imagemagick'
)
source=(
    "${pkgname%-git}::git+${url}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '5ce46265f0335b03568aa06f7b4c57c5f8ffade7a226489ea39796be91a511bf')
pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-git}|g" \
        -e "s|@appasar@|app|g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n --categories "Network" --name="${_pkgname}" --exec="${pkgname%-git}"
    cd "${srcdir}/${pkgname%-git}"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    convert assets/icons/icon.ico "${srcdir}/${pkgname%-git}/${pkgname%-git}.png"
    yarn install --cache-folder "${srcdir}/.yarn_cache"
    yarn build
    cp -r src/public build
    npx electron-packager . random-browser --overwrite --asar=false --platform=linux --icon=random-browser.png --prune=true --out=dist
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname%-git}/dist/${pkgname%-git}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}/${pkgname%-git}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}