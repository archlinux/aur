# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=voicestudio-bin
_pkgname=VoiceStudio
_debname=omnivoice-studio
pkgver=0.5.2
pkgrel=1
pkgdesc="Open-source, fully-local ElevenLabs alternative — voice cloning, voice design, video dubbing, dictation, transcription & audiobook creation in 646 languages."
arch=('x86_64')
url="https://voicestudio.sh/"
_ghurl="https://github.com/debpalash/VoiceStudio"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'python'
    'python-yaml'
    'python-pydantic'
    'python-cryptography'
    'python-pillow'
    'python-httpx'
    'python-psutil'
    'webkit2gtk-4.1'
    'python-numpy'
    'yt-dlp'
    'ffmpeg'
    'uv'
    'libayatana-appindicator'
    'libappindicator'
)
source=(
    "${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('9481a253b3a426884ff3e7ea44cb6fe9ef367221f6594784d3be947fdc3e3a86'
            'c8da18372d51521dd3a75339f699c3432726b78eec814f15730dca05a2d05536')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_debname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed -i -e "
        s/Exec=${_debname}/Exec=${pkgname%-bin}/g
        s/Icon=${_debname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/squashfs-root/usr/share/applications/${_pkgname}.desktop"
    ln -sf "/usr/bin/ffmpeg" "${srcdir}/squashfs-root/usr/bin/ffmpeg"
    ln -sf "/usr/bin/ffprobe" "${srcdir}/squashfs-root/usr/bin/ffprobe"
    ln -sf "/usr/bin/uv" "${srcdir}/squashfs-root/usr/bin/uv"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/squashfs-root/usr/bin" "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    # 只保留系统没有的库（ayatana-appindicator 系列、hyphen、manette、xdo 等）
    for _lib in \
        libayatana-appindicator3.so.1 \
        libayatana-ido3-0.4.so.0 \
        libayatana-indicator3.so.7 \
        libdbusmenu-glib.so.4 \
        libdbusmenu-gtk3.so.4 \
        libhyphen.so.0 \
        libmanette-0.2.so.0 \
        libxdo.so.3 \
        libevdev.so.2 \
        libgudev-1.0.so.0 \
        libharfbuzz-icu.so.0 \
        libsharpyuv.so.0 \
        libsecret-1.so.0 \
        libicudata.so.74 \
        libicui18n.so.74 \
        libicuuc.so.74 \
        ; do
        for _f in "${srcdir}/squashfs-root/usr/lib/${_lib}" "${srcdir}/squashfs-root/usr/lib/x86_64-linux-gnu/${_lib}"; do
            if [ -e "$_f" ]; then
                cp -a "$_f" "${pkgdir}/usr/lib/${pkgname%-bin}/lib/"
            fi
        done
    done
    # 保留 gdk-pixbuf、gio、gtk-3.0 模块（GTK 主题/输入法等需要）
    cp -a "${srcdir}/squashfs-root/usr/lib/x86_64-linux-gnu/gdk-pixbuf-2.0" "${pkgdir}/usr/lib/${pkgname%-bin}/lib/"
    cp -a "${srcdir}/squashfs-root/usr/lib/x86_64-linux-gnu/gio" "${pkgdir}/usr/lib/${pkgname%-bin}/lib/"
    cp -a "${srcdir}/squashfs-root/usr/lib/x86_64-linux-gnu/gtk-3.0" "${pkgdir}/usr/lib/${pkgname%-bin}/lib/"
    # 保留 glib-2.0 schemas
    cp -a "${srcdir}/squashfs-root/usr/share/glib-2.0" "${pkgdir}/usr/lib/${pkgname%-bin}/"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
