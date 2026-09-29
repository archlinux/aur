# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rayburst-bin
_pkgname=Rayburst
pkgver=4.0.0
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
)
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/AnInsomniacy/rayburst/v${pkgver}/LICENSE")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.x86_64.rpm")
sha256sums=('82e71190970399412c9e40fc3f4e2dc1cb070d56433ee7f25af7a4e67f401f0e')
sha256sums_aarch64=('551b56338543e8a7841022354f3f3afba63bec70dcdd9f30fa463b4deb30af38')
sha256sums_x86_64=('fd789c646d354dd4a40ef2ba61b9d995940a5904956fa6a1569cec9e717c4c14')
prepare() {
    sed -i "s/Categories=/Categories=Network;/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    mv "${srcdir}/usr/share/icons/hicolor/256x256@2" "${srcdir}/usr/share/icons/hicolor/512x512"
}
package() {
    if [ -x "/usr/bin/aria2-next" ];then
        install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}"* -t "${pkgdir}/usr/bin"
    else
        install -Dm755 "${srcdir}/usr/bin/"* -t "${pkgdir}/usr/bin"
    fi
    if [ -d "${srcdir}/usr/lib" ];then
        cp -a "${srcdir}/usr/lib" "${pkgdir}/usr"
    fi
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"  
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
