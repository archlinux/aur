# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=weiyunsync
pkgname="deepin-wine-${_pkgname}"
_officalname=WeiyunSync
_sparkpkgname="com.${_pkgname}.spark"
pkgver=3.0.0.650
_sparkver=3.0.0spark1
pkgrel=1
_provides=Tencent
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
    "${_pkgname}-${_sparkver}.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/network/${_sparkpkgname}/${_sparkpkgname}_${_sparkver}_i386.deb"
    "${_officalname}-${pkgver}.exe::https://dldir1.qq.com/weiyun/${_officalname}Install_Beta_1_${pkgver}_20231204_192557_r0.exe"
    "LICENSE::${url}/xy.html"
    "${pkgname}.install"
    "${pkgname}.sh"
)
sha256sums=('1c9361a9070ad2bfc85236397c75201c8e63374cc311514b68eae25877cadf84'
            'ac4071de6406af4cb607cf8e64f5b5d540e1f999e9afe4c198d8fcb3ecd1c634'
            '1c87c1ef9c44f0380de1af9284be772fed9c04cd26ed2ba4cf1f4ef718dba8a8'
            '9fc08b3f39ab99a3335449f6ea69aff4bb67d8b4dd2b243009738369af544201'
            '890506aa097e43c3fe74218e16aa82bddf8fb90c034c034181cbf004961af996')
build() {
    sed "s|@bottlename@|Deepin-${_officalname}|g" -i "${srcdir}/${pkgname}.install"
    sed -e "s|@bottlename@|Deepin-${_officalname}|g" \
        -e "s|@appver@|${pkgver}|g" \
        -e "s|@provider@|${_provides}|g" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@pathname@|${_officalname}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname}.sh"
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