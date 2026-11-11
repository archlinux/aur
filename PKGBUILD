# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=passwordsecure-bin
_pkgname=PasswordSecure
pkgver=1.2026.11.11
pkgrel=1
pkgdesc="A cross-platform password manager that uses strong AES-256 encryption.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/mihnea-radulescu/passwordsecure"
license=(
    'GPL-3.0-only'
    'MIT'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=(
    '!strip'
    'staticlibs'
)
depends=(
    'fontconfig'
    'dotnet-runtime'
)
makedepends=(
    'gendesk'
    'icoutils'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/${pkgver}/${_pkgname}_Linux_x64.tar.gz")
source=("${pkgname%-bin}.sh")
sha256sums=('088a945383def01b8512d96ce68cc3c2035e64056c5539302be36e6f730290bd')
sha256sums_aarch64=('28981f92c7d43881abad91d07097b574636c49f374b3860aa305cf04ea0f2597')
sha256sums_x86_64=('8795f5a3e2f4bbd2fade59c5fb4cda8e1e886081a37b30939f92f9190e42c142')
_get_app_dir() {
	find "${srcdir}" -type f -name "${_pkgname}" -printf '%h\n' 2>/dev/null
}
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    icotool -i 1 -x "$(_get_app_dir)/ApplicationIcon.ico" -o "${srcdir}/${pkgname%-bin}.png"
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "$(_get_app_dir)/." "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "$(_get_app_dir)/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}