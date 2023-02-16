# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lutris-formatfactory-spark
_pkgname=com.sugarcane.formatfactory
_officalname=FormatFactory
pkgver=5.13.0
_sparkver=5.7.5.1
pkgrel=1
epoch=
pkgdesc="the world's advanced video and image format conversion client"
arch=("x86_64")
url="http://www.pcgeshi.com/index.html"
license=('custom')
depends=(
    'p7zip'
    'zenity'
    'unixodbc'
    'libwbclient'
    )
optdepends=( )
conflicts=(deepin-wine-formatfactory)
provides=("PCGESHI")
install=
source=(
    "${_pkgname}_${pkgver}_amd64.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/tools/${_pkgname}/${_pkgname}_${_sparkver}_amd64.deb"
    "${_officalname}-${pkgver}.zip::https://wt.downg.com:486/software1/FormatFactorynoad-v5.13.0.0.zip"
    #"${_officalname}-${pkgver}.rar::https://dx.downg.com:485/software1/FormatFactorynoad-v5.13.0.0.zip"
    )
sha256sums=('9e7c1c55b374ece7432398c3dd02491937dfd60e500ac79d414c9555180d70da'
            '2df99307e2a9762e767f7f8dce74e486719aad6ab5c68d7914abdd678b7a8584')

prepare() {
    bsdtar -xf data.tar.xz
    mv "${srcdir}/opt/apps/${_pkgname}" "${srcdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp"
    msg "Extracting the ${_officalname} ${pkgver} archive ..."
    7z x -aoa "${_officalname}-${pkgver}.zip" -o"${srcdir}/tmp/"
    rm -r "${srcdir}/tmp/下载说明.html"
    7z x -aoa "${srcdir}/tmp/${_officalname}.7z" -o"${srcdir}/tmp/drive_c/"
    rm -r "${srcdir}/tmp/drive_c/${_officalname}/下载说明.html"
    rm -r "${srcdir}/tmp/${_officalname}.7z"
    rm -r "${srcdir}/usr"
    rm -r "${srcdir}/tmp/drive_c/${_officalname}/Music"

    msg "Repackaging app archive ..."
    rm -r "${srcdir}/opt/apps/${pkgname}/files/files.7z"
    7z a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
      
    mv "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop" "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
    sed 's/com.sugarcane.formatfactory/lutris-formatfactory-spark/g' -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
    sed '10,$d' -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
    echo "Categories=AudioVideo;" >> "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
    sed 's/com.sugarcane.formatfactory/lutris-formatfactory-spark/g' -i "${srcdir}/opt/apps/${pkgname}/files/run.sh"
    for i in 16x16 32x32 48x48 64x64 128x128; do
        mv "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/${i}/apps/${_pkgname}.png" \
            "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/${i}/apps/${pkgname}.png"
    done
}
  
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    md5sum "${pkgdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 ${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    for i in 16x16 32x32 48x48 64x64 128x128; do
        install -Dm644 ${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/${i}/apps/${pkgname}.png \
                        ${pkgdir}/usr/share/icons/hicolor/${i}/apps/${pkgname}.png
    done
}
