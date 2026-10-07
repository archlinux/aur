# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rayburst-bin
_pkgname=Rayburst
pkgver=4.0.1
pkgrel=1
pkgdesc="Redefining the open-source download manager."
arch=(
    'aarch64'
    'x86_64'
)
url="https://rayburst.pages.dev/"
_ghurl="https://github.com/AnInsomniacy/rayburst"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'libayatana-indicator'
    'libappindicator'
    'aria2-next'
)
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/AnInsomniacy/rayburst/v${pkgver}/LICENSE")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.x86_64.rpm")
sha256sums=('82e71190970399412c9e40fc3f4e2dc1cb070d56433ee7f25af7a4e67f401f0e')
sha256sums_aarch64=('858ed354697afbe0435d91c1c91bbcf2332842f4d2fe32b566094b75e5f63927')
sha256sums_x86_64=('06b08d124fa1f487c7450a2cc720eb9b9299f621ebb3db4213b77fb3e99b6633')
prepare() {
    sed -i "s/Categories=/Categories=Network;/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    mv "${srcdir}/usr/share/icons/hicolor/256x256@2" "${srcdir}/usr/share/icons/hicolor/512x512"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}"* -t "${pkgdir}/usr/bin"
    cp -a "${srcdir}/usr/lib" "${pkgdir}/usr"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"  
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
