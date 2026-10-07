# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=imagefanreloaded-avalonia-bin
_pkgname=ImageFanReloaded
pkgver=1.2026.10.01
pkgrel=1
pkgdesc="ImageFan Reloaded is a light-weight image viewer, supporting multi-core processing."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/mihnea-radulescu/imagefanreloaded"
license=(
    "GPL-3.0-only"
    "MIT"
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=(
    '!strip'
    'staticlibs'
)
depends=(
    'fontconfig'
    'dotnet-runtime>=10'
)
makedepends=(
    'imagemagick'
    'gendesk'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/${pkgver}/${_pkgname}_Linux_x64.tar.gz")
sha256sums_aarch64=('abe22da28e34a54ed9e2e9f26a0f1482b39dd687ace9a462ff1337f77410d3ec')
sha256sums_x86_64=('51d772dac9f3056d82d44b93700777269208f524050530a6c4a64da4c453ade6')
_get_app_dir() {
	find "${srcdir}" -maxdepth 1 -type d -name "${_pkgname}_Linux_*" -print 2>/dev/null | head -n1
}
prepare() {
    magick "$(_get_app_dir)/ApplicationIcon.ico" "${srcdir}/${pkgname%-bin}.png"
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Graphics" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib/"${pkgname%-bin}"}
    local _app_dir="$(_get_app_dir)"
    cp -a "${_app_dir}/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/icons/hicolor/64x64/apps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${_app_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}