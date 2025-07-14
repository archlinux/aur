# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=typora
pkgname="${_appname}-free-with-plugin"
_pkgname=Typora
pkgver=1.15.3
_typoraver=0.11.18
_electronversion=13
pkgrel=1
pkgdesc="A minimal markdown editor and reader(free version).With obgnail/typora_plugin plugins."
arch=(
    'aarch64'
    'x86_64'
)
url="https://typora.io/"
_dlurl="https://github.com/wyf9661/typora-free"
_pluginurl="https://github.com/obgnail/typora_plugin"
license=('LicenseRef-custom')
provides=("${_appname}=${pkgver}")
conflicts=(
    "${_appname}"
    "${_appname}-free"
    "${_appname}-cn"
    "${_appname}-free-cn"
    "${_appname}-electron"
)
depends=(
    "electron${_electronversion}"
    'alsa-lib'
)
source=(
    "${_appname}-plugin-${pkgver}.zip::${_pluginurl}/releases/download/${pkgver}/${_appname}-plugin@v${pkgver}.zip"
)
source_aarch64=("${pkgname}-${_typoraver}-aarch64.deb::${_dlurl}/releases/download/v${_typoraver}/${_appname}_${_typoraver}_arm64.deb")
source_x86_64=("${pkgname}-${_typoraver}-x86_64.deb::${_dlurl}/releases/download/v${_typoraver}/${_appname}_${_typoraver}_amd64.deb")
sha256sums=('405e89cebb210afbfd81a53ad11a2c0e6826015d4214a0e0e02aeffcf567a121')
sha256sums_aarch64=('12ad46732c4da7d9414701c584fee942baf83b89165563f18ba03d859eb59ad8')
sha256sums_x86_64=('a202935a754c4b7344cc947db143e12885e4a716ca5f70f607f0318c346bb6c6')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/${_appname} %U/${pkgname} --no-sandbox %U/g
        s/Icon=${_appname}/Icon=${pkgname}/g
    " "${srcdir}/usr/share/applications/${_appname}.desktop"
    sed -i "s/<script src=\".\/appsrc\/window\/frame.js\" defer=\"defer\"><\/script>/<script src=\".\/appsrc\/window\/frame.js\" defer=\"defer\"><\/script><script src=\".\/plugin\/index.js\" defer=\"defer\"><\/script>/g" \
        "${srcdir}/usr/share/${_appname}/resources/window.html"
    cp -Pr --no-preserve=ownership "${srcdir}/plugin" "${srcdir}/usr/share/${_appname}/resources"
    _file_list=(chrome_100_percent.pak chrome_200_percent.pak chrome-sandbox icudtl.dat libEGL.so libffmpeg.so \
        libGLESv2.so libvk_swiftshader.so libvulkan.so.1 resources.pak vk_swiftshader_icd.json)
    for _files in "${_file_list[@]}";do
        ln -sf "/usr/lib/electron${_electronversion}/${_files}" "${srcdir}/usr/share/${_appname}/${_files}"
    done
}
package() {
    install -Dm755 -d "${pkgdir}/"{/usr/lib/"${pkgname}",usr/bin}
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share/${_appname}/"* "${pkgdir}/usr/lib/${pkgname}"
    ln -sf "/usr/lib/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    _icon_sizes=(16x16 32x32 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/${_appname}/resources//assets/icon/icon_${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/usr/share/doc/${_appname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    chmod 777 "${pkgdir}/usr/lib/${pkgname}/resources/plugin"
    chmod 0777 "${pkgdir}/usr/lib/${pkgname}/resources/plugin/global/settings/"{settings.user.toml,custom_plugin.user.toml}
}
