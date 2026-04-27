# Maintainer: devome <evinedeng@hotmail.com>

_reponame=ChatLab
pkgname="${_reponame,,}"
pkgver=0.18.2
pkgrel=1
pkgdesc="Rediscover your social memories with local, AI-powered analysis"
arch=('x86_64' 'aarch64')
url="https://github.com/hellodigua/${_reponame}"
license=("GPL-3.0-only")
_electron="electron35"
depends=("bash" "curl" "${_electron}" "hicolor-icon-theme")
makedepends=("npm" "pnpm" "python")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=('82700cd68c3fa753f7e1d39a253f8651aa2345e5c9445587f8ad0745d4f9a316'
            '7623be40b49f98301c1b5685f4e911aff107cd20354433214266cd892abea4f5'
            '9f72ce7e5c0a405da9024fdce1d9b486d9d52ae04da499f42161a78199551992')

prepare() {
    export NODE_ENV="development"

    cd "${_reponame}-${pkgver}"
    pnpm install
}

build() {
    cd "${_reponame}-${pkgver}"
    pnpm run build
    pnpm exec electron-builder --linux dir --config electron-builder.yml --publish never
    rm -rf "dist/linux-unpacked/resources/app-update.yml"
}

package() {
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 "${pkgname}.sh"      "${pkgdir}/usr/bin/${pkgname}"

    cd "${_reponame}-${pkgver}"
    install -Dm644 "README.md"          "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "build/icon.png"     "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -dm755 "${pkgdir}/usr/lib"
    cp -r "dist/linux-unpacked/resources" "${pkgdir}/usr/lib/${pkgname}"

    cd docs
    find . -type f -name "*.md" -exec install -Dm644 {} "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
}
