# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=imagefanreloaded-avalonia-bin
_pkgname=ImageFanReloaded
pkgver=1.2026.10.10
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
sha256sums_aarch64=('998eb8478f01db23b5f60c088b3d68d0ae2aaa629906d8aea855b8ad98c4f25e')
sha256sums_x86_64=('4711dc31da6c7321a24151440e89bb383da5b1f2743c96a8308b0853d7e94553')
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
    ln -sf "/usr/lib/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/icons/hicolor/64x64/apps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${_app_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
