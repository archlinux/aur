# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=amphitheatre-desktop-bin
pkgver=0.11.16
pkgrel=1
pkgdesc="Open source GUI application that enables you to interact with Amphitheatre."
arch=(
    'aarch64'
    'i686'
    'x86_64'
)
url="https://github.com/amphitheatre-app/desktop"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'glibc>=2.38'
    'libgcc'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-arm64.rpm")
source_i686=("${pkgname%-bin}-${pkgver}-i686.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-i386.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-amd64.rpm")
sha256sums_aarch64=('e053f44e625b70eb158ae053e8766e502c07f4930707e592c3a3f355c645e0e3')
sha256sums_i686=('853d753fd175df2de9e976f4087094b64749caf5d18205196201e4dae770a819')
sha256sums_x86_64=('926511e1a19d925384453a2a3efed4f47b5411d98be681e1bdee736c85fec34f')
prepare() {
    sed -i "s/\/usr\/local\/bin\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/local/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
}
