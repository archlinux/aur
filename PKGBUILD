# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cinematic-git
_pkgname=Cinematic
pkgver=1.1.2.r71.g2a3da03
pkgrel=1
pkgdesc="Gorgeous desktop movie collections"
arch=('any')
url="http://gh.lacymorrow.com/cinematic/"
_ghurl="https://github.com/lacymorrow/cinematic"
license=('MIT')
conflicts=(
    "${pkgname%-git}"
)
provides=(
    "${pkgname%-git}"
)
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
    'nodejs>=20.9.1'
    'npm'
    'yarn'
)
source=(
    "${pkgname%-git}"::"git+${_ghurl}.git"
)
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
build() {
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname%-git} --no-sandbox %U"
    cd "${srcdir}/${pkgname%-git}"
    sed -e '/"AppImage",/d' -e '/"apk",/d' -e '/"deb",/d' \
        -e '/"freebsd",/d'  -e '/"pacman",/d' -e 's|"rpm"|"AppImage"|g' \
        -i package.json
    yarn install
    yarn package:linux
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-git}",usr/bin}
    cp -r "${srcdir}/${pkgname%-git}/release/build/linux-unpacked/"* "${pkgdir}/opt/${pkgname%-git}"
    ln -sf "/opt/${pkgname%-git}/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}/public/favicons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}