# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=weiyunsync
pkgname="deepin-wine-${_pkgname}"
_officalname=WeiyunSync
_sparkpkgname="com.${_pkgname}.spark"
pkgver=3.0.0.671
_sparkver=3.0.0spark1
pkgrel=1
_provides=Tencent
pkgdesc="WeiyunSync on Deepin Wine6.基于深度Wine6的微云同步助手"
arch=("x86_64")
url="https://www.weiyun.com"
license=('LicenseRef-freeware')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=(
    'deepin-wine6-stable'
    'spark-dwine-helper'
    'xdg-utils'
)
makedepends=(
    'p7zip'
)
optdepends=(
    'wqy-microhei'
    'wqy-zenhei'
)
install="${pkgname}.install"
source=(
    "${_pkgname}-${_sparkver}.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/network/${_sparkpkgname}/${_sparkpkgname}_${_sparkver}_i386.deb"
    "${_officalname}-${pkgver}.exe::https://dldir1.qq.com/weiyun/${_officalname}Install_Beta_1_${pkgver}_20240204_154929_r0.exe"
    "LICENSE::${url}/xy.html"
    "${pkgname}.sh"
)
sha256sums=('1c9361a9070ad2bfc85236397c75201c8e63374cc311514b68eae25877cadf84'
            '736cf7d2dca3449f71a93e9e5857a9efd4fd7c9b319cfbea116ca6418155cc58'
            '51cc8268ffb29a4155520a7d5d44cce5d0eebd6d128b7c0fefe0ab16cb897240'
            '10ea79a64179945e5d5489ebf56ecbba08ee2180b251379c5f54cae8e704b5db')
build() {
    sed -e "s|@bottlename@|Deepin-${_officalname}|g" \
        -e "s|@appver@|${pkgver}|g" \
        -e "s|@provider@|${_provides}|g" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@pathname@|${_officalname}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname}.sh"
    bsdtar -xf "${srcdir}/data."*
    mv "${srcdir}/opt/apps/${_sparkpkgname}" "${srcdir}/opt/apps/${pkgname}"
    sed -e "s|Icon=${_sparkpkgname}|Icon=${pkgname}|g" \
        -e "s|/opt/apps/${_sparkpkgname}/files/run.sh|${pkgname}|g" \
        -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_sparkpkgname}.desktop"
    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    7z x -aoa "${srcdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp"
    msg "Extracting latest ${_officalname} installer to ${srcdir}/tmp/drive_c/Program Files/${_provides}/${_officalname} ..."
    7z x -aoa "${srcdir}/${_officalname}-${pkgver}.exe" -o"${srcdir}/tmp/drive_c/Program Files/${_provides}/"
    rm -r "${srcdir}/tmp/drive_c/Program Files/${_provides}/\$PLUGINSDIR"
    msg "Repackaging app archive ..."
    rm -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/opt/apps/${pkgname}/info"
    7z a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
}
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    md5sum "${pkgdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${_sparkpkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_sparkpkgname}.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}