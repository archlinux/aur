# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mxiv-git
pkgver=r13.f8d07d8
_electronversion=26
pkgrel=1
pkgdesc="Media explorer and interactive viewer"
arch=('any')
url="https://github.com/rvcalisto/mxiv"
license=('MIT')
conflicts=(
    "${pkgname%-git}"
)
provides=(
    "${pkgname%-git}"
)
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'git'
    'nodejs'
    'npm'
)
source=(
    "${pkgname%-git}::git+${url}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '8915ca75d453698df81f7f3305cce6869f4261d754d90f0c3724b73c7b24ca84')
pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-git}|g" \
        -e "s|@appasar@|app|g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n --categories "AudioVideo" --name="${pkgname%-git}" --exec="${pkgname%-git}"
    cd "${srcdir}/${pkgname%-git}"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export npm_config_cache="${srcdir}/.npm_cache"
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    npm install
    npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname%-git}/out/${pkgname%-git}-linux-"*/resources/app "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}/src/icons/${pkgname%-git}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}