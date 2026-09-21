# Maintainer: zxp19821005 <zxp19821005 at 163 dot com> / ihipop <ihipop at gmail dot com>
_pkgname=eudic
pkgname="eusoft-${_pkgname}-bin"
pkgver=26.9.1
pkgrel=1
pkgdesc="Authoritative English dictionary software, an essential tool for English learners.(Prebuilt version)权威的英语词典软件,英语学习者必备的工具."
arch=('x86_64')
url="https://www.eudic.net/v4/en/app/eudic"
license=('LicenseRef-custom')
provides=("${_pkgname}=${pkgver}")
conflicts=("${pkgname%-bin}" "${_pkgname}")
depends=(
    'qt5-base'
    'qt5-multimedia'
    'qt5-webengine'
    'qt5-svg'
    'qt5-serialport'
    'qt5-speech'
    'qt5-websockets'
    'qt5-webchannel'
    'nss'
    'alsa-lib'
    'libdrm'
    'mesa'
    'harfbuzz'
    'libthai'
    'fontconfig'
    'libx11'
    'libxcb'
    'libxext'
    'libxrender'
    'libxfixes'
    'libxcursor'
    'libxi'
    'libxrandr'
    'libxss'
    'libxtst'
    'libxau'
    'libxdmcp'
    'glib2'
    'zlib'
    'bzip2'
    'libpng'
    'libjpeg-turbo'
    'freetype2'
    'libglvnd'
    'libpulse'
    'libdbus'
    'libxkbcommon'
    'curl'
    'icu'
    'libxml2'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}-x86_64.AppImage::https://static.eudic.net/pkg/${_pkgname}.AppImage?v=${pkgver}"
    "LICENSE.html"
    "${pkgname%-bin}.sh"
)
sha256sums=('7839456abede4b8a47cacf2d3fcf24ce25c4296e305f9618920bd83cc21c83a6'
            '89862f4074e530896863738bf9d49c03c8d0cd0f6a543d4ccc1cdc53e8f83a24'
            'f8da4fa48422d34fd5e2f8e1e87c9f52b66a7308a88855c39ae03599209dcbaf')
pkgver() {
    cd "${srcdir}/squashfs-root"
    grep "X-AppImage-Version" default.desktop | sed "s/X-AppImage-Version=//g"
}
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
    # Remove bundled libraries - use system components instead
    _libdir="${srcdir}/squashfs-root/lib"
    find "${_libdir}" -maxdepth 1 -name "libQt5*.so*" -delete
    find "${_libdir}" -maxdepth 1 -regex ".*/lib\(X11\|Xau\|Xdmcp\|Xext\|Xrender\|Xfixes\|Xcursor\|Xi\|Xrandr\|Xss\|Xtst\|xcb\).*\.so.*" -delete
    find "${_libdir}" -maxdepth 1 -regex ".*/lib\(GL\|EGL\|drm\|gbm\|wayland\).*\.so.*" -delete
    find "${_libdir}" -maxdepth 1 -regex ".*/lib\(asound\|pulse\).*\.so.*" -delete
    find "${_libdir}" -maxdepth 1 -regex ".*/lib\(ssl\|crypto\|nss3\|nssutil3\|smime3\|nspr4\|plds4\|plc4\).*\.so.*" -delete
    find "${_libdir}" -maxdepth 1 -regex ".*/lib\(z\|bz2\).*\.so.*" -delete
    find "${_libdir}" -maxdepth 1 -regex ".*/lib\(fontconfig\|freetype\|harfbuzz\|thai\|datrie\|xkbcommon\).*\.so.*" -delete
    find "${_libdir}" -maxdepth 1 -regex ".*/lib\(glib-2.0\|dbus-1\|icu\|xml2\|curl\|stdc\+\+\|gcc_s\).*\.so.*" -delete
    sed -i -e "
        s/\/usr\/share\/${_pkgname}\/AppRun/env QT_AUTO_SCREEN_SCALE_FACTOR=1 QT_IM_MODULE=fcitx QT_QPA_PLATFORM=\"xcb\" ${pkgname%-bin}/g
        s/Icon=com.eusoft.${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/squashfs-root/default.desktop"
    ln -sf "/usr/lib/qt/plugins/platforminputcontexts/libfcitx"*.so "${srcdir}/squashfs-root/plugins/platforminputcontexts/"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/squashfs-root/." "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/default.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/com.eusoft.${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}