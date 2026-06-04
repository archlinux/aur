# Maintainer: DOGSOHA <2221577113@qq.com>
# Contributor: baby2016

pkgname=fairy-kekkai-workshop
pkgver=2.0.0
pkgrel=1
pkgdesc="幻想结界工坊 - 视频字幕处理和管理工具 (Video subtitle processing & management tool)"
arch=('x86_64')
url="https://github.com/Fairy-Oracle-Sanctuary/Fairy-Kekkai-Workshop"
license=('MIT')
depends=(
    'ffmpeg'
    'yt-dlp'
    'python'
    'python-pip'
    'python-numpy'
    'python-pillow'
    'python-requests'
    'python-av'
    'python-imageio'
    'python-opencv'
    'python-srt'
)
install="${pkgname}.install"
source=("${pkgname}::git+https://github.com/Fairy-Oracle-Sanctuary/Fairy-Kekkai-Workshop.git#commit=6fc100f8dfd3b8db9130a2020e1d914ad792fcf1")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags --always 2>/dev/null | sed 's/^v//; s/-/./g' || echo "${pkgver}"
}

package() {
    cd "${srcdir}/${pkgname}"

    local instdir="${pkgdir}/opt/${pkgname}"

    # Copy application files
    mkdir -p "${instdir}"
    cp -r app Fairy-Kekkai-Workshop.py deploy.py requirements.txt "${instdir}/"

    # Clean __pycache__
    find "${instdir}" -type d -name '__pycache__' -exec rm -rf {} + 2>/dev/null || true

    # Create launcher script
    mkdir -p "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" << 'LAUNCHER'
#!/bin/bash
exec python3 /opt/fairy-kekkai-workshop/Fairy-Kekkai-Workshop.py "$@"
LAUNCHER
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    # Create desktop entry
    mkdir -p "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" << DESKTOP
[Desktop Entry]
Type=Application
Name=Fairy Kekkai Workshop
Name[zh_CN]=幻想结界工坊
Comment=Video subtitle processing and management tool
Comment[zh_CN]=视频字幕处理和管理工具
Exec=/usr/bin/fairy-kekkai-workshop
Icon=fairy-kekkai-workshop
Categories=AudioVideo;Video;Graphics;
Terminal=false
StartupNotify=true
MimeType=video/mp4;video/webm;video/x-matroska;
DESKTOP

    # Install icon
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    cp app/resource/images/logo.png \
       "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
}
