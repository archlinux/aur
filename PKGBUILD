# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=scramblery
pkgname="${_appname}-cuda-bin"
_pkgname=Scramblery
pkgver=4.4.0
pkgrel=1
pkgdesc="Desktop app for image and video scrambling with various methods including Fourier phase scramble: Entire image/video or just detected facial area.CUDA version."
arch=('x86_64')
url="https://github.com/altunenes/scramblery"
license=('MIT')
provides=("${_appname}=${pkgver}")
conflicts=(
    "${_appname}"
    "${_appname}-openvino"
    "${_appname}-webgpu"
    "${_appname}-migraphx"
)
depends=(
    'gstreamer'
    'gst-plugins-base-libs'
    'fontconfig'
    'gtk3'
    'cuda'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/altunenes/scramblery/v${pkgver}/LICENSE"
)
sha256sums=('785b4a9dff296bd184e7bf70c5f31e090454e16343513b78f9037cb0cbe33835'
            '8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/Exec=${_appname}\ /Exec=${pkgname%-bin}/g
        s/Icon=${_appname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_appname}.desktop"
    [ -d "${srcdir}/usr/share/icons/hicolor/256x256@2" ] && mv "${srcdir}/usr/share/icons/hicolor/256x256@2" "${srcdir}/usr/share/icons/hicolor/512x512"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_appname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/usr/bin/"*.so -t "${pkgdir}/usr/bin"
    [ -d "${srcdir}/usr/lib" ] && cp -a "${srcdir}/usr/lib" "${pkgdir}/usr/"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
