# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=alpha-badger
_appname=Alpha-Badger
pkgver=0.4.1
pkgrel=4
pkgdesc="UI wrapper around FFmpeg"
arch=('x86_64')
url="https://github.com/NoamRa/alpha-badger"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'ffmpeg'
    'electron19'
)
makedepends=(
    'gendesk'
    'npm'
    'nodejs'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '7278e78909e70f319c57e6baa6743c19883f41d186ade67ed405e085ec14fded')
build() {
    gendesk -f -n -q --categories "AudioVideo" --name "${_appname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm ci --cache "${srcdir}/npm-cache"
    npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/out/${pkgname}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/brand/${_appname//-/_}_logo_1920x960.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}