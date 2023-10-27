# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=switchhosts
pkgname="${_pkgname}-git"
pkgver=4.2.0.beta.r22.gb88ec9d
pkgrel=1
pkgdesc="An app for managing hosts file,and switch hosts quickly!"
arch=('any')
url="https://github.com/oldj/SwitchHosts"
license=('Apache')
conflicts=(
    "${_pkgname}"
)
provides=(
    "${_pkgname}"
)
depends=(
    'bash'
    'electron24'
    'hicolor-icon-theme'
)
makedepends=(
    'gendesk'
    'git'
    'nodejs>=18.15.11'
    'npm>=9.0.0'
)
source=(
    "${_pkgname}"::"git+${url}.git"
    "${_pkgname}.sh"
)
sha256sums=('SKIP'
            'ce889ad0fb018ef15b123c3c26671e2979e947fc333a68b854b1cd964a490979')
pkgver() {
    cd "${srcdir}/${_pkgname}"
    #git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
    git describe --tags | sed 's/\w\+\///g;s/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}
build() {
    gendesk -q -f -n --categories "Utility" --pkgname="${_pkgname}" --name="SwitchHosts" --exec="${_pkgname}"
    cd "${srcdir}/${_pkgname}"
    npm install
    npm run build
    npm run make:linux
    cd "${srcdir}/${_pkgname}/dist/.icon-set"
    cp icon_16x16.png app_16.png
    cp icon_48x48.png app_48.png
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    case "${CARCH}" in
        x86_64)
            _architecture="linux-unpacked"
        ;;
        aarch64)
            _architecture="linux-arm64-unpacked"
        ;;
        armv7h)
            _architecture="linux-armv7l-unpacked"
        ;;
    esac
    install -Dm644 "${srcdir}/${_pkgname}/dist/${_architecture}/resources/app.asar" -t "${pkgdir}/usr/lib/${_pkgname}/"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16 32 48 64 128 256 512;do
        install -Dm644 "${srcdir}/${_pkgname}/dist/.icon-set/app_${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
