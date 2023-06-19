# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepin-wine-bandizip
_pkgname=com.deepin.bandizip
_officalname=Bandizip
_sparkver=7.23
pkgver=7.30
pkgrel=3
pkgdesc="Bandizip is a powerful archiver which provides an ultrafast processing speed and convenient features."
arch=("x86_64")
url="http://www.bandisoft.com/bandizip"
license=('custom:freeware')
depends=('deepin-wine6-stable' 'xdg-utils')
conflicts=("bandizip")
install="${pkgname}.install"
noextract=("${_officalname}-${pkgver}.zip")
source=("${_pkgname}_${_sparkver}_amd64.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/tools/${_pkgname}/${_pkgname}_${_sparkver}_amd64.deb"
    "${_officalname}-${pkgver}.zip::http://dl.bandisoft.com/bandizip.std/BANDIZIP-PORTABLE.ZIP"
    "${pkgname}.install"
    "run.sh"
    "LICENSE.html::${url}/help/license-policy/")
sha256sums=('e8f04a4870dbd7e4398b8d3a92a19f451b8756df58f30cdd8cbc0b2bdf629b7a'
            '783a2568e3734e5f3ebc442e7a90d8bc8f09ef02ef67c99da1d1a26eb5bd6c2e'
            'd559c4b8700435463a52c8a441f553a2a0711c5bdc3d9d9bdc46d91b0f48e15f'
            'b583f494f3fb8becff3c4716e117f17a0f80a38f30920f9584a35d24d7235b9c'
            '546ef2b8c6bae17b39d3fadf7c8769c80adac57cafde42ae7f28cdbfcd362f84')

prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    mv "${srcdir}/opt/apps/${_pkgname}" "${srcdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    7z x -aoa "${srcdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp"
    rm -rf "${srcdir}/tmp/drive_c/Program Files/${_officalname}/"
    msg "Extracting ${_officalname} portable files ..."
    7z x -aoa "${_officalname}-${pkgver}.zip" -o"${srcdir}/tmp/drive_c/Program Files/${_officalname}/"
    msg "Repackaging app archive ..."
    rm -rf "${srcdir}/opt/apps/${pkgname}/files/files.7z"
    7z a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
    mv "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop" "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
    mv "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/160x160/apps/${_pkgname}.png" "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/160x160/apps/${pkgname}.png"
    sed "s|${_pkgname}|${pkgname}|g;s|Icon|#Icon|g" -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
    echo "Icon=deepin-wine-bandizip" >> "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
    rm -rf "${srcdir}/opt/apps/${pkgname}/info"
}

package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    md5sum "${pkgdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/160x160/apps/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm755 "run.sh" -t "${pkgdir}/opt/apps/${pkgname}/files/"
    install -Dm644 "LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}