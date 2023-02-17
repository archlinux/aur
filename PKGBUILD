# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepin-wine-ttplayer
_pkgname=com.qianqian.ttplayer.spark
_officalname=ttplayer
_pkgpdt=TTPlayer
pkgver=5.7.9
sparkver=5.7.9spark1
_tmppkgname=com.deepin.bandizip
_tmppkgver=7.23
_tmpfilename=Bandizip
pkgrel=1
epoch=
pkgdesc="千千静听是一款完全免费的音乐播放软件,集播放、音效、转换、歌词等众多功能于一身。利用DeepinWine6重新进行封装。"
arch=("x86_64")
url="https://www.baidu.com/"
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
provides=("Baidu")
install="deepin-wine-ttplayer.install"
source=(
    "${_pkgname}_${sparkver}_i386.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/music/${_pkgname}/${_pkgname}_${sparkver}_i386.deb"
    "${_tmppkgname}-${_tmppkgver}.tmp::https://mirrors.sdu.edu.cn/spark-store-repository/store/tools/${_tmppkgname}/${_tmppkgname}_${_tmppkgver}_amd64.deb"
    deepin-wine-ttplayer.install
    run.sh
    )
sha256sums=('e900ae9ce8375eacd9c9b004e0757dddb0f28d5614987e444bffb919529bee67'
            'e8f04a4870dbd7e4398b8d3a92a19f451b8756df58f30cdd8cbc0b2bdf629b7a'
            'f28af6815df326acfa937fdc1fa5c7583bfdb7d66aadb1b9615a3f474bbf7939'
            '8fb90bf0a094f6e508a23b2b243d036c022544c6b7c45b995353401764ddafb3')
 
prepare() {
    #解压ttplayer原有的包，得到ttplayer的运行程序
    ar -xv ${_pkgname}_${sparkver}_i386.deb
    bsdtar -xf data.tar.xz
    7z x -aoa "${srcdir}/opt/apps/${_pkgname}/files/files.7z" -o"${srcdir}/tmp1"
    mkdir -p "${srcdir}/tmp2/drive_c/Program Files/"
    cp -r "${srcdir}/tmp1/drive_c/Program Files/${_pkgpdt}" "${srcdir}/tmp2/drive_c/Program Files/"
    #将原有的ttplayer的桌面和图标复制出来
    mkdir -p "${srcdir}/tmp/entries"
    cp -r "${srcdir}/opt/apps/${_pkgname}/entries/applications/" "${srcdir}/opt/apps/${_pkgname}/entries/icons/" "${srcdir}/tmp/entries"
    rm -r "${srcdir}/opt" *.tar.xz
    
    #解压缩第三方软件的deb包
    ar -xv ${_tmppkgname}-${_tmppkgver}.tmp
    bsdtar -xf data.tar.xz
    mv "${srcdir}/opt/apps/${_tmppkgname}" "${srcdir}/opt/apps/${pkgname}"
    #桌面和图标文件替换
    rm -r "${srcdir}/opt/apps/${pkgname}/entries"
    cp -r "${srcdir}/tmp/entries" "${srcdir}/opt/apps/${pkgname}/"

    #解压第三方软件的files.7z包，将文件进行替换删除
    7z x -aoa "${srcdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp2"
    rm -r "${srcdir}/tmp2/drive_c/Program Files/${_tmpfilename}" "${srcdir}/tmp2/"*.conf "${srcdir}/tmp2/desktopdata" "${srcdir}/tmp2/windata" \
        "${srcdir}/tmp2/drive_c/users/crossover/Desktop/${_tmpfilename}.lnk" "${srcdir}/opt/apps/${pkgname}/files/files.7z"
    7z a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp2/*"

    #规范命名
    mv "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop" "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
    sed 's/com.qianqian.ttplayer.spark/deepin-wine-ttplayer/g' -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
    for i in 16x16 24x24 32x32 48x48 64x64 scalable; do
        mv "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/${i}/apps/${_pkgname}.svg" \
            "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/${i}/apps/${pkgname}.svg"
    done
    sed 's/Categories=Music/Categories=AudioVideo/g' -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
    rm -rf ${srcdir}/opt/apps/${_pkgname}/info
}
    
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    md5sum "${pkgdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 ${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    for i in 16x16 24x24 32x32 48x48 64x64 scalable; do
        install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/${i}/apps/${pkgname}.svg" \
            "${pkgdir}/usr/share/icons/hicolor/${i}/apps/${pkgname}.svg"
    done
    install -Dm755 "run.sh" "${pkgdir}/opt/apps/${pkgname}/files/"
}
