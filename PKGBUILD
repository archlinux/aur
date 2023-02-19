# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepin-wine-danmoshui
_pkgname=danmoshui
pkgver=0.0.6
_tmppkgname=com.deepin.bandizip
_tmppkgver=7.23
_tmpfilename=Bandizip
pkgrel=1
epoch=
pkgdesc="DanMoShui Calligraphy on deepin wine 6.基于Deepin Wine 6的淡墨水字帖PC版。"
arch=("x86_64")
url="https://danmoshui.com"
license=('custom')
depends=(
    'deepin-wine6-stable'
    'xdg-utils'
    )
optdepends=(
    'wqy-microhei'
    'wqy-zenhei'
    )
conflicts=()
provides=("danmoshui")
install="${pkgname}.install"
source=(
    "${_tmppkgname}-${_tmppkgver}.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/tools/${_tmppkgname}/${_tmppkgname}_${_tmppkgver}_amd64.deb"
    "${_pkgname}-${pkgver}.zip::${url}/static/${_pkgname}ZiTie-win.zip"
    "LICENSE::https://danmoshui.com/privacy_policy"
    "${pkgname}.install"
    "${pkgname}.desktop"
    "${pkgname}.png"
    "run.sh"
    )
sha256sums=('e8f04a4870dbd7e4398b8d3a92a19f451b8756df58f30cdd8cbc0b2bdf629b7a'
            '7bd8b3c7e3256cdc6349585e6ec21105d0fdd2d3b5f7977490de08643a34e5e6'
            'e984edcbcf35bb47fb35eb8f618b49a0c8e9dff561df32d65a1efab2af33a756'
            '2da39854e84f2f0c2f2401747ee99c5a46dd6288099d8761b52eb2cfa2e255c2'
            'cf63cb5313fc422f874bbe34045cf48c46fffb23e8bb117f9836b2ac24cefabf'
            '055cf7f62fe412b52626648a861fad75653cd13383aec40278c556c88fe40ba6'
            'fe34f327816b306fb08975683e1e61f85c066c29fbcaee332a3e76caf2e08d47')
  
prepare() {
    bsdtar -xf data.tar.xz
    mv "${srcdir}/opt/apps/${_tmppkgname}" "${srcdir}/opt/apps/${pkgname}"
    rm -r "${srcdir}/opt/apps/${pkgname}/entries" 
    7z x -aoa "${srcdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp"
    rm -r "${srcdir}/tmp/drive_c/Program Files/${_tmpfilename}" "${srcdir}/tmp/"*.conf "${srcdir}/tmp/desktopdata" "${srcdir}/tmp/windata" \
        "${srcdir}/tmp/drive_c/users/crossover/Desktop/${_tmpfilename}.lnk" "${srcdir}/opt/apps/${pkgname}/files/files.7z"
    unzip -O CP936 ${_pkgname}-${pkgver}.zip -d "${srcdir}/tmp/drive_c/Program Files/"
    mv "${srcdir}/tmp/drive_c/Program Files/淡墨水字帖_x64" "${srcdir}/tmp/drive_c/Program Files/${_pkgname}"
    mv "${srcdir}/tmp/drive_c/Program Files/${_pkgname}/淡墨水字帖.exe" "${srcdir}/tmp/drive_c/Program Files/${_pkgname}/${_pkgname}.exe"
    7z a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
    rm -rf ${srcdir}/opt/apps/${_pkgname}/info
}
     
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    md5sum "${pkgdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.png"
    install -Dm755 "${srcdir}/run.sh" "${pkgdir}/opt/apps/${pkgname}/files/"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
