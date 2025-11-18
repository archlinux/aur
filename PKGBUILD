# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=qtscrcpy-bin
_pkgname=QtScrcpy
pkgver=3.3.3
pkgrel=3
pkgdesc="Android real-time display control software.(Prebuilt version)"
arch=('x86_64')
url="https://blog.csdn.net/rankun1/article/details/87970523"
_ghurl="https://github.com/barry-ran/QtScrcpy"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=(
    '!strip'
    'staticlibs'
)
depends=(
    'libxcomposite'
    'qt5-wayland'
    'scrcpy'
    'android-sdk-platform-tools'
)
source=(
    "${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-ubuntu-20.04-gcc_64.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('67e5d1ed99abef8595ceba83608cc551834e6914a1f187ad15a0e09d13bea611'
            'b3e9c2ea2115387e381b4f66d286e59c0ad4a16b94eed5313b03ce05fadc8863')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed -i -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/squashfs-root/usr/share/applications/${_pkgname}.desktop"
    ln -sf "/opt/android-sdk/platform-tools/adb" "${srcdir}/squashfs-root/usr/bin/adb"
    ln -sf "/opt/android-sdk/platform-tools/adb" "${srcdir}/squashfs-root/usr/lib/${pkgname%-bin}/adb"
    ln -sf "/usr/share/scrcpy/scrcpy-server" "${srcdir}/squashfs-root/usr/lib/${pkgname%-bin}/scrcpy-server"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    rm -rf "${srcdir}/squashfs-root/usr/share/"{applications,icons,pixmaps}
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/usr/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
}
