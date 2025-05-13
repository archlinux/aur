# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=acodec-bin
_pkgname=ACodec
pkgver=2.6.0
pkgrel=1
pkgdesc="Encoder & decoder for various algorithms with graphical user interface.(Prebuilt version)"
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url="https://github.com/albertus82/acodec"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'java-runtime'
)
makedepends=(
    'gendesk'
)
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-gtk-linux-armhf-bin.tar.gz")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-gtk-linux-aarch64-bin.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-gtk-linux-x86-bin.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-gtk-linux-x86_64-bin.tar.gz")
sha256sums_aarch64=('66f7e31f3cbba813abbdaf65c91878708ab8472a65741245662c6f97ca64cdb8')
sha256sums_armv7h=('f35fec70cca332f0666a4bfea9adcdc58a505b4b502568988b57e13416d6dfff')
sha256sums_i686=('7980d4b43caedd33957181d3cbc6a6e5973b0ce2ebba987a1b76c029864187e6')
sha256sums_x86_64=('9fe428454793762344e59569b778e1d46e9b4de6527207b6b0bec9ad8518ced6')
prepare() {
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin}"
    cp "${srcdir}/${pkgname%-bin}.desktop" "${srcdir}/${pkgname%-bin}w.desktop"
    sed -i -e "
        s/Name=${_pkgname}/Name=${_pkgname}-w/g
        s/Exec=${pkgname%-bin}/Exec=${pkgname%-bin}w/g
    " "${srcdir}/${pkgname%-bin}w.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib}
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname%-bin}" "${pkgdir}/usr/lib/"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}w.sh" "${pkgdir}/usr/bin/${pkgname%-bin}w"
    install -Dm644 "${srcdir}/${pkgname%-bin}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname%-bin}/icon/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}w.desktop" -t "${pkgdir}/usr/share/applications"
}