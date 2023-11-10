# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=weiyunsync
pkgname="deepin-wine-${_pkgname}"
_officalname=WeiyunSync
pkgver=3.0.0.649
_sparkpkgname="com.${_pkgname}.spark"
_sparkver=3.0.0spark1
pkgrel=2
_provides="Tencent"
pkgdesc="WeiyunSync on Deepin Wine6.基于深度Wine6的微云同步助手"
arch=("x86_64")
url="https://www.weiyun.com"
license=('custom:freeware')
depends=(
    'deepin-wine6-stable'
    'spark-dwine-helper'
    'xdg-utils'
    'hicolor-icon-theme'
    'lib32-glibc'
    'lib32-libx11'
    'lib32-libxext'
    'sh'
)
makedepends=(
    'p7zip'
)
optdepends=(
    'wqy-microhei'
    'wqy-zenhei'
)
provides=("${_pkgname}")
install="${pkgname}.install"
source=(
    "${_sparkpkgname}_${_sparkver}_i386.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/network/${_sparkpkgname}/${_sparkpkgname}_${_sparkver}_i386.deb"
    "${_officalname}-${pkgver}.exe::https://dldir1.qq.com/weiyun/${_officalname}Install_Beta_1_${pkgver}_20230901_155100_r0.exe"
    "LICENSE::${url}/xy.html"
    "${pkgname}.sh"
)
sha256sums=('1c9361a9070ad2bfc85236397c75201c8e63374cc311514b68eae25877cadf84'
            'f75dc5923d7ededbf4bab5619fb535db6b2baa1d7972b744ad1b67c2a8f4f651'
            '1630f7f29acaec54d7332b265c37f16953534cb02f28d8eb80306e3784d8d28a'
            '9dc8db06229f7bd43e883c8a2dbe5e8d8ad1d920087635fb6310186271923b22')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
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