# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=baidu-translate
pkgname="deepin-wine-${_pkgname}"
pkgver=1.6.1
_tmppkgname=com.deepin.bandizip
_tmppkgver=7.23
_tmpfilename=Bandizip
pkgrel=2
epoch=
pkgdesc="Baidu Translate Client on Deepin Wine 6.百度翻译桌面端,轻·快的多语种翻译工具"
arch=("x86_64")
url="https://fanyi.baidu.com"
license=('custom')
depends=('deepin-wine6-stable>=6.0.0.19' 'deepin-wine-helper>=5.1.1' 'hicolor-icon-theme' 'sh')
optdepends=()
conflicts=("${_pkgname}")
provides=("Baidu")
install="${pkgname}.install"
source=("${_tmppkgname}-${_tmppkgver}.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/tools/${_tmppkgname}/${_tmppkgname}_${_tmppkgver}_amd64.deb"
    "${_pkgname}-${pkgver}.exe::https://fanyi.baidu.com/client/download/redirect?device=win&from=pcproduct"
    "${pkgname}.install"
    "${pkgname}.desktop"
    "${_pkgname}.png"
    "run.sh"
    "LICENSE.html::${url}/static/webpage/agreement.html")
sha256sums=('e8f04a4870dbd7e4398b8d3a92a19f451b8756df58f30cdd8cbc0b2bdf629b7a'
            '2bf35d3d99750379bba1d7637c98e0e58b17d8ce0d89ec0deef10bd276b18cc1'
            '481c94a7d26b201ff8c87dafd9744a457b8e6a6ef212807e9e44fa8c376b2cbc'
            '28bcbb2bd8306ea897dfe8e28f247b8c1c5a3771ac8f98079e491bcb04a81bca'
            '3b77fadec0287cff726676e2e3887e1a44ce9afff86740e127f6c08e34fe05aa'
            'fa6449c4c96410af1de5790af3ab6c06f3fe0dc0a6a884b580cb2443b00273cc'
            'ffa785eb66c6abf12217bc9dbf447c56bb15e2a1ff038da7c8c1b8e5f57ce2fb')
   
prepare() {
    bsdtar -xf data.tar.xz
    mv "${srcdir}/opt/apps/${_tmppkgname}" "${srcdir}/opt/apps/${pkgname}"
    rm -r "${srcdir}/opt/apps/${pkgname}/entries"
    7z x -aoa "${srcdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp"
    rm -r "${srcdir}/tmp/drive_c/Program Files/${_tmpfilename}" "${srcdir}/tmp/"*.conf "${srcdir}/tmp/desktopdata" "${srcdir}/tmp/windata" \
        "${srcdir}/tmp/drive_c/users/crossover/Desktop/${_tmpfilename}.lnk" "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/drive_c/Program Files (x86)"
    
    mkdir -p "${srcdir}/tmp/drive_c/Program Files/baidu-translate-client" "${srcdir}/extracted_exe"
    7z e -aoa "${_pkgname}-${pkgver}.exe" -o"${srcdir}/extracted_exe"
    bsdtar -xf "${srcdir}/extracted_exe/app-64.7z" -C "${srcdir}/tmp/drive_c/Program Files/baidu-translate-client"
    7z a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
    rm -r "${srcdir}/opt/apps/${pkgname}/info"
}
      
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    md5sum "${pkgdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
    install -Dm755 "${srcdir}/run.sh" "${pkgdir}/opt/apps/${pkgname}/files/"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}