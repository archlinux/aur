# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=apifox-bin
_pkgname=Apifox
pkgver=2.3.23
pkgrel=1
pkgdesc="Apifox=Postman+Swagger+Mock+JMeter.API 文档、API 调试、API Mock、API 自动化测试"
arch=('aarch64' 'x86_64')
url="https://apifox.com/"
_githuburl="https://github.com/apifox/apifox"
license=('custom')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'bash'
    'electron22'
    'hicolor-icon-theme'
    'java-runtime'
    'gdk-pixbuf2'
    'lib32-gcc-libs'
    'libdbusmenu-glib'
    'lib32-glibc'
    'gtk2'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::https://cdn.apifox.cn/download/${_pkgname}-linux-arm64-latest.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::https://cdn.apifox.cn/download/${_pkgname}-linux-latest.zip")
source=("LICENSE.html"
    "${pkgname%-bin}.sh")
sha256sums=('3884df6451dd5aaadc867c2b6882a7feabccb10c7e1df98e48e9fe2414c9fe19'
            'cbf4154e6a26f4099a8da2f3bba63578b0ed9046141ba8bea9c2b4d585dbdf62')
sha256sums_aarch64=('ceac6e886202e68f2cc9d179e740bb5a8e3fbe5e702d2f2105a6d82966e5adc7')
sha256sums_x86_64=('3fc3fdb008fbbdc4123f22a0372f387b425791dde0e8d9bfa662489a5f08c9fc')
build() {
    chmod a+x "${srcdir}/${_pkgname}.AppImage"
    "${srcdir}/${_pkgname}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin} -no-sandbox|g;s|Utility|Development|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    find "${srcdir}/squashfs-root" -type d -perm 700 -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}