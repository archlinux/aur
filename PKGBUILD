# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=htbrowser-bin
pkgver=5.0.2.4
pkgrel=2
pkgdesc="红莲花国密浏览器是政企专用浏览器，支持国产密码算法，全面适配信创环境，可以提供国产密码改造服务，既满足安全可靠又保障自主可控的浏览器使用需求。"
arch=('x86_64')
url="http://www.haitaibrowser.com"
_downurl="https://mirrors.sdu.edu.cn/spark-store-repository"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('nss' 'libxrandr' 'libdrm' 'libxshmfence' 'gtk2' 'libcups' 'libxcomposite' 'expat' 'gdk-pixbuf2' 'libxext' \
    'cairo' 'hicolor-icon-theme' 'dbus' 'glib2' 'zlib' 'libxdamage' 'libxfixes' 'alsa-lib' 'libxcb' 'gcc-libs' \
    'mesa' 'at-spi2-core' 'libx11' 'pango' 'sh' 'nspr' 'glibc')
source=("${pkgname%-bin}-${pkgver}.deb::${_downurl}/store/network/${pkgname%-bin}/${pkgname%-bin}_${pkgver}_amd64.deb"
        "LICENSE")
sha256sums=('644b6aa27f3a30d2e75eed25f5c30d4aecf55b6ef882906cf9fdbedd7cc31768'
            'c74e69c2dd5cd4543f078bce866947b1f6fdf9eea2de843810f0a6b89ee76f3f')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${pkgname%-bin}/${pkgname%-bin}.sh %U|${pkgname%-bin} --no-sandbox %U|g;s|/opt/${pkgname%-bin}/${pkgname%-bin}.png|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/opt/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/appdata/${pkgname%-bin}.appdata.xml" -t "${pkgdir}/usr/share/appdata"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 24x24 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/man/man1/${pkgname%-bin}.1.gz" -t "${pkgdir}/usr/share/man/man1"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}