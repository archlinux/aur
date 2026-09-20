# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=qtscrcpy-bin
_pkgname=QtScrcpy
pkgver=4.2.0
pkgrel=1
pkgdesc="Android real-time display control software."
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
    'qt5-base'
    'qt5-multimedia'
    'qt5-svg'
    'qt5-wayland'
    'qt5-x11extras'
    'gstreamer'
    'gst-plugins-base'
    'gst-plugins-good'
    'libpulse'
    'libsndfile'
    'libvorbis'
    'libogg'
    'flac'
    'libpng'
    'libxcomposite'
    'libxcb'
    'xcb-util-keysyms'
    'xcb-util-image'
    'xcb-util-wm'
    'xcb-util-renderutil'
    'libxkbcommon'
    'libxkbcommon-x11'
    'scrcpy'
    'android-sdk-platform-tools'
)
source=(
    "${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-ubuntu-x64-v${pkgver}.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('2f33c586ceef04679398b80df7f8fc29352dee6cfbbea20470c788a8ccc9feb2'
            'e468cebce5ab345d61d109de5426e9263643f915d881599774402c89292f141f')
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
    rm -rf "${srcdir}/squashfs-root/usr/lib/"lib{Qt5*,FLAC*,ogg*,vorbis*,png*,pulse*,sndfile*,glib*,gobject*,gthread*,gst*,gmodule*,ffi*,icu*,pcre*,xcb*,Xau*,Xdmcp*,Xext*,X11*,xkbcommon*,asyncns*,apparmor*,bsd*,dbus*,gcrypt*,gssapi*,k5crypto*,keyutils*,krb5*,lz4*,lzma*,nsl*,orc*,wrap*,systemd*,icudata*,icui18n*,icuuc*}.*
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/usr/share/metainfo/QtScrcpy.appdata.xml" \
        "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.appdata.xml"
    rm -rf "${srcdir}/squashfs-root/usr/share/"{applications,icons,pixmaps,metainfo,doc}
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/squashfs-root/usr/." "${pkgdir}/usr/lib/${pkgname%-bin}"
}