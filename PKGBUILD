# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cinematic-git
_pkgname=Cinematic
pkgver=0.10.0.r1070.g2dc9402
_electronversion=27
pkgrel=1
pkgdesc="Gorgeous desktop movie collections"
arch=('any')
url="http://gh.lacymorrow.com/cinematic/"
_ghurl="https://github.com/lacymorrow/cinematic"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
depends=(
    'alsa-lib'
    'libxext'
    'at-spi2-core'
    'mesa'
    'cairo'
    'libdrm'
    'expat'
    'libx11'
    'pango'
    'gtk3'
    'libxcb'
    'nss'
    'libxrandr'
    'libxkbcommon'
    'libxfixes'
    'libxcomposite'
    'libcups'
    'nspr'
    'libxdamage'
)
makedepends=(
    'gendesk'
    'git'
    'nodejs'
    'npm'
    'yarn'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
)
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
build() {
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname%-git} --no-sandbox %U"
    cd "${srcdir}/${pkgname//-/.}"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    sed -e '/"AppImage",/d' -e '/"apk",/d' -e '/"deb",/d' \
        -e '/"freebsd",/d'  -e '/"pacman",/d' -e 's|"rpm"|"AppImage"|g' \
        -i package.json
    yarn install  --cache-folder "${srcdir}/.yarn_cache"
    yarn package:linux
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-git}",usr/bin}
    cp -r "${srcdir}/${pkgname//-/.}/release/build/linux-"*/* "${pkgdir}/opt/${pkgname%-git}"
    ln -sf "/opt/${pkgname//-/.}/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/public/favicons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}