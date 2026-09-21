# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=eshelper
pkgname="eusoft-${_pkgname}-bin"
pkgver=26.9.0
pkgrel=1
pkgdesc="Authoritative Spanish dictionary software, an essential tool for Spanish language learners.西班牙语助手,权威的西班牙语词典软件,西班牙语学习者必备的工具."
arch=('x86_64')
url="https://www.esdict.cn/"
license=('LicenseRef-custom')
conflicts=(
    "${pkgname%-bin}"
    "${_pkgname}"
)
depends=(
    'qt5-base'
    'qt5-multimedia'
    'qt5-webengine'
    'qt5-svg'
    'qt5-serialport'
    'qt5-speech'
    'qt5-webchannel'
    'qt5-location'
    'gtk3'
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
    'wayland'
    'libpulse'
    'libdbus'
    'libxkbcommon'
    'curl'
    'icu'
    'libxml2'
    'gstreamer'
    'gst-plugins-base-libs'
    'gst-plugins-bad-libs'
    'gst-plugins-good'
    'gst-libav'
    'libgudev'
    'libogg'
    'libvorbis'
    'speex'
    'lame'
    'libtheora'
    'opus'
    'wavpack'
    'twolame'
    'mpg123'
    'libshout'
    'libcaca'
    'aalib'
    'libdv'
    'v4l-utils'
    'libiec61883'
    'libavc1394'
    'libraw1394'
    'graphene'
    'libsoup'
    'taglib'
    'sqlite'
    'libxv'
    'pipewire-jack'
    'libgpg-error'
    'cdparanoia'
    'orc'
    'libp11-kit'
    'gmp'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://static.frdic.com/pkg/${_pkgname}.deb?v=${pkgver}"
    "LICENSE.html::https://dict.eudic.net/home/privacy"
    "${pkgname%-bin}.sh"
)
sha256sums=('59af3b48c1cda58220e303c479d8244257fb2d7c7be7d229b83f3e8dc23ee358'
            'fd8210f1112414482b29af5f0660fa05e384e81480dd478fb24928224c1982ad'
            '99459e293a8aa12658616ee9bdb4cbfb186265b8bfd3e0f4d57ccb5fac5b2d41')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@appasar@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    # Remove bundled libraries - use system components instead
    _libdir="${srcdir}/usr/share/${pkgname%-bin}/lib"
    find "${_libdir}" -maxdepth 1 -name "libQt5*.so*" -delete
    find "${_libdir}" -maxdepth 1 -regex ".*/lib\(X11\|Xau\|Xdmcp\|Xext\|Xrender\|Xfixes\|Xcursor\|Xi\|Xrandr\|Xss\|Xtst\|xcb\).*\.so.*" -delete
    find "${_libdir}" -maxdepth 1 -regex ".*/lib\(GL\|EGL\|drm\|gbm\|wayland\).*\.so.*" -delete
    find "${_libdir}" -maxdepth 1 -regex ".*/lib\(asound\|pulse\).*\.so.*" -delete
    find "${_libdir}" -maxdepth 1 -regex ".*/lib\(ssl\|crypto\|nss3\|nssutil3\|smime3\|nspr4\|plds4\|plc4\).*\.so.*" -delete
    find "${_libdir}" -maxdepth 1 -regex ".*/lib\(z\|bz2\|lz4\|lzma\).*\.so.*" -delete
    find "${_libdir}" -maxdepth 1 -regex ".*/lib\(fontconfig\|freetype\|harfbuzz\|thai\|datrie\|xkbcommon\).*\.so.*" -delete
    find "${_libdir}" -maxdepth 1 -regex ".*/lib\(glib-2.0\|dbus-1\|icu\|xml2\|curl\|stdc\+\+\|gcc_s\|gmodule\|gobject\|gio\|gthread\).*\.so.*" -delete
    find "${_libdir}" -maxdepth 1 -regex ".*/lib\(gtk-3\|gdk-3\|cairo\|pango\|pangocairo\|pangoft2\|atk\|atspi\|gdk-pixbuf\|epoxy\|pixman\).*\.so.*" -delete
    find "${_libdir}" -maxdepth 1 -regex ".*/lib\(gstreamer\|gst.*\).*\.so.*" -delete
    find "${_libdir}" -maxdepth 1 -regex ".*/lib\(png\|jpeg\|tiff\|webp\|flac\|ogg\|vorbis\|opus\|speex\|theora\|mpg123\|lame\|twolame\|wavpack\|tag\|sqlite\|systemd\|udev\|gudev\|blkid\|mount\|selinux\|pcre\|ffi\|keyutils\|krb5\).*\.so.*" -delete
    sed -i -e "
        s/\/usr\/share\/${pkgname%-bin}\/AppRun/${pkgname%-bin}/g
        s/com.eusoft.${_pkgname}/${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -a "${srcdir}/usr/share/${pkgname%-bin}" "${pkgdir}/usr/lib"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/com.eusoft.${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
