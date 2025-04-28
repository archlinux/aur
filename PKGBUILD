# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=reor-bin
_pkgname=Reor
pkgver=0.2.32
_wrver=0.2.31
_electronversion=35
pkgrel=1
pkgdesc="AI note-taking app that runs models locally.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://reorproject.org/"
_ghurl="https://github.com/reorproject/reor"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'nodejs'
    'ollama'
)
makedepends=(
    'fuse2'
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v-${pkgver}/ubuntu-latest-app.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('7da00295a19db3f958445f5044cd9f87820bae054176798fdf3db57b1006274a'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${_wrver}/${_pkgname}_${_wrver}.AppImage" ];then
        chmod +x "${srcdir}/${_wrver}/${_pkgname}_${_wrver}.AppImage"
    fi
    "${srcdir}/${_wrver}/${_pkgname}_${_wrver}.AppImage" --appimage-extract > /dev/null
    sed -i -e "
        s/AppRun --no-sandbox/${pkgname%-bin}/g
        s/Icon=${pkgname%-bin}-project/Icon=${pkgname%-bin}/g
    " "${srcdir}/squashfs-root/${pkgname%-bin}-project.desktop"
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}" -type d \( -name "darwin" -o -name "win32" -o -name "arm64" \) -print0 | xargs -0 rm -rf
    find "${srcdir}/app.asar.unpacked" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    find "${srcdir}/squashfs-root/resources" -type d -perm 700 -exec chmod 755 {} +
    ln -sf "/usr/bin/ollama" "${srcdir}/squashfs-root/app.asar.unpack/binaries/ollama"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/resources/"{app.asar.unpacked,binaries} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}-project.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}-project.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}