# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepin-wine-ximalaya
_officalname=ximalaya
pkgver=3.3.3_99B
_sparkpkgname=com.ximalaya.spark
_sparkver=3.3.0spark6
pkgrel=1
epoch=
pkgdesc="喜马拉雅，是中国领先的音频分享平台。用声音分享人类智慧，用声音服务美好生活，做一家人一辈子的精神食粮，是平台的使命和初心。"
arch=("x86_64")
url="https://www.ximalaya.com/"
license=('custom:freeware')
depends=(
    'deepin-wine6-stable'
    'spark-dwine-helper-git'
    'xdg-utils'
    )
optdepends=(
    'wqy-microhei'
    'wqy-zenhei'
    )
conflicts=()
provides=("ByteDance")
install="deepin-wine-ximalaya.install"
source=(
    "${_sparkpkgname}_${_sparkver}_amd64.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/music/${_sparkpkgname}/${_sparkpkgname}_${_sparkver}_amd64.deb"
    "${_officalname}-${pkgver}.exe::https://0grauqmttgo41hcjz8rzdncts.302.pcdn.xmcdn.com/nativedl.pcdn.xmcdn.com/storages/b2e6-audiofreehighqps/D5/6A/GMCoOR4HrB9rACAAAAHxmIt-.exe"
    "license.html::https://passport.ximalaya.com/page/register_rule"
    deepin-wine-ximalaya.install
    run.sh
    )
sha256sums=('54989d78270b73e473e71eaa5676eb668976232fb06fff0cd4d62336d00da71e'
            'db2c6b4ab68fc81f88ed7bf25d6ba1eadf766269a4952c39d852f9e6ba3a2397'
            '8c0bb6b3018f6c2ea891190ed1bf75488896cefb292428fc760be339e86b6e01'
            '6f2e0e87fe8f1abbd947d311b0fcad50c9c4c22a2531b8277db4e28e0a2d78dd'
            '49a8690ab30ecb9a60b822c590dfc2ea0cc39e740cf86c50ae5708c37ab295b4')
 
prepare() {
    bsdtar -xf data.tar.xz
    mv "${srcdir}/opt/apps/${_sparkpkgname}" "${srcdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    7za x -aoa "${srcdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp"
     
    msg "Copying latest ${_officalname} installer to ${srcdir}/tmp/drive_c/Program Files/${_officalname} ..."
    rm -r "${srcdir}/tmp/drive_c/Program Files (x86)/${_officalname}"
    mkdir -p "${srcdir}/tmp/drive_c/Program Files (x86)/${_officalname}"
    rm -r "${srcdir}/opt/apps/${pkgname}/files/dlls"
    install -m644 "${_officalname}-${pkgver}.exe" "${srcdir}/tmp/drive_c/Program Files (x86)/${_officalname}/${_officalname}-${pkgver}.exe"
     
    msg "Repackaging app archive ..."
    rm -r "${srcdir}/opt/apps/${pkgname}/files/files.7z"
    7za a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
     
    mv "${srcdir}/opt/apps/${pkgname}/entries/applications/${_sparkpkgname}.desktop" "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
    mv "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_sparkpkgname}.png" "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${pkgname}.png"
    sed 's/com.ximalaya.spark/deepin-wine-ximalaya/g' -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
    sed 's/Audio/AudioVideo/g' -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
 
    echo "Icon=deepin-wine-ximalaya.png" >> "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
 
    rm -rf ${srcdir}/opt/apps/${pkgname}/info
}
    
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    md5sum "${pkgdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 ${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -Dm644 ${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${pkgname}.png ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.png
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
    install  "license.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "run.sh" "${pkgdir}/opt/apps/${pkgname}/files/"
}
