# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=danmoshui
pkgname="deepin-wine-${_pkgname}"
pkgver=0.0.6
_zhsname="淡墨水字帖"
_tmppkgname=com.furmark.deepin
_tmppkgver=1.31.0.0
_tmpfilename=Geeks3D
pkgrel=2
pkgdesc="DanMoShui Calligraphy on deepin wine 6.基于Deepin Wine 6的淡墨水字帖PC版。"
arch=("x86_64")
url="https://danmoshui.com"
license=('custom')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
depends=('bash' 'deepin-wine6-stable' 'deepin-wine-helper')
makedepends=('p7zip' 'unzip')
noextract=("${_pkgname}-${pkgver}.zip")
install="${pkgname}.install"
source=("${_tmppkgname}-${_tmppkgver}.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/tools/${_tmppkgname}/${_tmppkgname}_${_tmppkgver}_i386.deb"
    "${_pkgname}-${pkgver}.zip::${url}/static/${_pkgname}ZiTie-win.zip"
    "LICENSE::${url}/privacy_policy"
    "${pkgname}.install"
    "${pkgname}.desktop"
    "${pkgname}.png"
    "run.sh")
sha256sums=('af0b72095d3c87e11c3644ab63b3e7e45bec4d4339b57efaccda649dda93236a'
            '7bd8b3c7e3256cdc6349585e6ec21105d0fdd2d3b5f7977490de08643a34e5e6'
            'e984edcbcf35bb47fb35eb8f618b49a0c8e9dff561df32d65a1efab2af33a756'
            '2da39854e84f2f0c2f2401747ee99c5a46dd6288099d8761b52eb2cfa2e255c2'
            'cf63cb5313fc422f874bbe34045cf48c46fffb23e8bb117f9836b2ac24cefabf'
            '055cf7f62fe412b52626648a861fad75653cd13383aec40278c556c88fe40ba6'
            '2f49c7953511f9c35c8e18b38da81fbef6ca8e2a20a3388d2f7918d0bef54acf')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    mv "${srcdir}/opt/apps/${_tmppkgname}" "${srcdir}/opt/apps/${pkgname}"
    rm -r "${srcdir}/opt/apps/${pkgname}/entries" 
    7z x -aoa "${srcdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp"
    rm -r "${srcdir}/tmp/drive_c/Program Files (x86)/${_tmpfilename}" "${srcdir}/opt/apps/${pkgname}/files/files.7z"
    unzip -O CP936 ${_pkgname}-${pkgver}.zip -d "${srcdir}/tmp/drive_c/Program Files/"
    mv "${srcdir}/tmp/drive_c/Program Files/${_zhsname}_x64" "${srcdir}/tmp/drive_c/Program Files/${_pkgname}"
    mv "${srcdir}/tmp/drive_c/Program Files/${_pkgname}/${_zhsname}.exe" "${srcdir}/tmp/drive_c/Program Files/${_pkgname}/${_pkgname}.exe"
    7z a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
    rm -rf "${srcdir}/opt/apps/${pkgname}/info"
}
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    md5sum "${pkgdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm755 "${srcdir}/run.sh" -t "${pkgdir}/opt/apps/${pkgname}/files"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}