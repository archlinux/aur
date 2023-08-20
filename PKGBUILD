# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=spx-translation
pkgver=v2.0.4
pkgrel=1
pkgdesc="聚合翻译程序(谷歌+deepl)"
arch=('x86_64')
url="https://github.com/mlmdflr/spx-translation"
license=('custom')
conflicts=("${pkgname}")
depends=('libxkbcommon' 'gcc-libs' 'mesa' 'glibc' 'libxrandr' 'dbus' 'libxcomposite' 'libcups' \
    'expat' 'glib2' 'gtk3' 'libxdamage' 'alsa-lib' 'libxfixes' 'libdrm' 'cairo' 'nss' 'nspr' \
    'libx11' 'libxext' 'libxcb' 'at-spi2-core' 'pango')
makedepends=('gendesk' 'yarn')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a943252e2e5ef7bdc7dbffdfc79d41b3f94913112009d0d6bb9420557bae5656')
build() {
    cd "${srcdir}/${pkgname}-v${pkgver}"
    yarn install
    sed "s|'AppImage', 'snap', 'deb', 'rpm', 'pacman'|'AppImage'|g" -i scripts/cfg.js
    sed "s|'AppImage', 'snap', 'deb', 'rpm', 'pacman'|'AppImage'|g" -i scripts/build.js
    sed "14,22d" -i scripts/build.js
    yarn run build
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/${pkgname}-v${pkgver}/out/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-v${pkgver}/resources/build/icons/256x256.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    gendesk -f -n --categories "Utility" --name "${pkgname}" --exec "/opt/${pkgname}/${pkgname} --no-sandbox %U"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-v${pkgver}/out/linux-unpacked//LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}