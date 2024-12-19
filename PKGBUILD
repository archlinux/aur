# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=teamide-bin
_pkgname=TeamIDE
pkgver=2.6.31
_electronversion=22
pkgrel=1
pkgdesc="Integrate MySQL, Oracle, Kingbase, Dameng, Shentong databases, SSH, FTP, Redis, Zookeeper, Kafka, Elasticsearch, Mongodb, small tools and other management tools.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/team-ide/teamide"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'unixodbc'
)
makedepends=(
    'asar'
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-linux-${pkgver}.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('90b6ce144aee2276c33866b6346073362c25b2c39b9f972d575404c0aa846a90'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i "s/AppRun --no-sandbox/${pkgname%-bin}/g" "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    find "${srcdir}/squashfs-root/resources" -type d -perm 700 -exec chmod 755 {} +
    rm -rf "${srcdir}/squashfs-root/resources/assets/server/server-linux-arm64"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/resources/assets" "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 64x64)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}