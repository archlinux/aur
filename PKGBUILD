# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepin-wine-douyin
_pkgname=com.douyin.spark
_officalname=douyin
pkgver=1.8.0
sparkver=1.7.1spark2
pkgrel=1
epoch=
pkgdesc="douyin,record beautify life"
arch=("x86_64")
url="https://www.douyin.com/"
license=('custom')
depends=(
    'deepin-wine6-stable'
    'spark-dwine-helper-git'
    'xdg-utils'
    )
optdepends=( )
conflicts=()
provides=("douyin")
install="deepin-wine-douyin.install"
source=("https://mirrors.sdu.edu.cn/spark-store-repository/store/video/${_pkgname}/${_pkgname}_${sparkver}_i386.deb"
	"${_officalname}-${pkgver}.exe::https://www.douyin.com/download/pc/obj/${_officalname}-pc-client/7044145585217083655/releases/9818478/${pkgver}/win32-ia32/${_officalname}-v${pkgver}-win32-ia32-douyinDownload1.exe"
	deepin-wine-douyin.install
    run.sh)
sha256sums=('ddb6e863b45e4eddee273119866e73de27b10efa5e57054933153fb442f1ce10'
            '322ea0649362f110cd88e5ea5f5b68b0a599837332ddfa112e385c933bf36521'
            'ccc3f54e20200ec7c03974baa4d67bd8d1af48560c4e87a26da94608f6930862'
            'ac1ca15434abfc4b3349481c0499d796f99e704367baf010d5e972f8e2f6df6e')

prepare() {
    bsdtar -xf data.tar.xz
    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine douyin archive ..."
    7za x -aoa "${srcdir}/opt/apps/${_pkgname}/files/files.7z" -o"${srcdir}/tmp"
    
    msg "Copying latest douyin installer to ${srcdir}/tmp/drive_c/Program Files/ByteDance/douyin ..."
    install -m644 "${_officalname}-${pkgver}.exe" "${srcdir}/tmp/drive_c/Program Files/ByteDance/${_officalname}-${pkgver}.exe"
    
    msg "Repackaging app archive ..."
    7za a -t7z -r "${srcdir}/opt/apps/${_pkgname}/files/files.7z" "${srcdir}/tmp/*"
    
    sed 's/Video/AudioVideo/g' -i "${srcdir}/opt/apps/${_pkgname}/entries/applications/${_pkgname}.desktop"
    rm -rf ${srcdir}/opt/apps/${_pkgname}/info
}
   
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    md5sum "${pkgdir}/opt/apps/${_pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${_pkgname}/files/files.md5sum"
    install -Dm644 ${srcdir}/opt/apps/${_pkgname}/entries/applications/${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
    install -Dm644 ${srcdir}/opt/apps/${_pkgname}/entries/icons/hicolor/scalable/apps/${_pkgname}.png ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png
    install -Dm755 "run.sh" "${pkgdir}/opt/apps/${_pkgname}/files/"
}
