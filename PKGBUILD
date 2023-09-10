# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ppet3-bin
_pkgname=PPet3
pkgver=3.3.0
pkgrel=5
pkgdesc="Put a cute girl on your desk for more fun.在你的桌面放一个萌妹子，多一点乐趣"
arch=('x86_64')
url="https://github.com/zenghongtu/PPet"
license=('MIT')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('gtk3' 'at-spi2-core' 'nss' 'alsa-lib' 'libxcomposite' 'glibc' 'libx11' 'libxdamage' 'gcc-libs' 'gdk-pixbuf2' 'libdrm' 'libxfixes' \
    'libxkbcommon' 'nspr' 'pango' 'libxext' 'cairo' 'expat' 'libxcb' 'mesa' 'dbus' 'glib2' 'libcups' 'libxrandr' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/PPet3-${pkgver}.deb"
  "LICENSE.md::https://raw.githubusercontent.com/zenghongtu/PPet/v${pkgver}/LICENSE.md")
sha256sums=('cc2f126958fcf15aea6913c684126fef1bf3dd3a3eebfff3cd2c7648c029a00e'
            '4c34d72ca8a05bdc5568a82327063da521dfc431737c448fafeb97c7f98e006a')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin} --no-sandbox %U|g;s|Development|Utility|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}