# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=thoughts-bin
_zhsname='思绪思维导图'
_debname=io.github.wanglin2.mind-map
pkgver=0.15.0
_electronversion=23
pkgrel=1
pkgdesc="A relatively powerful web mind map.(Prebuilt version.Use system-wide electron)一个还算强大的Web思维导图."
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://wanglin2.github.io/mind-map/#/index"
_ghurl="https://github.com/wanglin2/mind-map"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'squashfs-tools'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/wanglin2/mind-map/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_armv7l.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.snap::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_amd64.snap")
sha256sums=('8a19b651678a6a644640524d984ed89d0b9a78c662545715218a05130c7329c7'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('ac06cd1f76732c3b553c7169181cc9c332e1d1f27ce63ee8d87fb760950d1664')
sha256sums_armv7h=('87221ab022db12c113b9f6c26274d1b91733b64c295ef7aa2d682941f3ac62fd')
sha256sums_x86_64=('c9fb8484304cba404bc70c00085905fc8bee37fa34a451027da933d66e5a8bb9')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    case "${CARCH}" in
        "aarch64"|"armv7h")
            bsdtar -xf "${srcdir}/data."*
            sed -i -e "
                s/\"\/opt\/${_zhsname}\/${pkgname%-bin}\"/${pkgname%-bin}/g
                s/Utilities/Office/g
            " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
            ;;
        x86_64)
            unsquashfs "${srcdir}/${pkgname%-bin}-${pkgver}-x86_64.snap"
            sed -i "s/Icon=\${SNAP}\/meta\/gui\/icon.png/Icon=${pkgname%-bin}.png/g" "${srcdir}/squashfs-root/meta/gui/${pkgname%-bin}.desktop"
            sed -i "s/${_debname}/${pkgname%-bin}/g" "${srcdir}/squashfs-root/${_debname}.metainfo.xml"
            ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    case "${CARCH}" in
        "aarch64"|"armv7h")
            install -Dm644 "${srcdir}/opt/${_zhsname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
            _icon_sizes=(32x32 128x128 256x256)
            for _icon in "${_icon_sizes[@]}";do
                install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icon}/apps/${pkgname%-bin}.png" \
                    -t "${pkgdir}/usr/share/icons/hicolor/${_icon}/apps"
            done
            install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
            ;;
        x86_64)
            install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
            install -Dm644 "${srcdir}/squashfs-root/meta/gui/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
            install -Dm644 "${srcdir}/squashfs-root/meta/gui/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
            install -Dm644 "${srcdir}/squashfs-root/${_debname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.metainfo.xml"
            ;;
    esac
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}