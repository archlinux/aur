# Maintainer: deridray <deriday@gmail.com>
pkgname=riff-player-bin
pkgver=43.0.0
pkgrel=1
pkgdesc="A free, open-source desktop music player for YouTube Music, SoundCloud, and local files."
arch=('x86_64')
url="https://github.com/rootscripts/riff"
license=('MIT') 
provides=('riff')
conflicts=('riff' 'riff-bin')
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
options=(!strip)

_appimage="riff-${pkgver}-linux-x86_64.AppImage"
source_x86_64=("${url}/releases/download/v${pkgver}/${_appimage}")
sha256sums_x86_64=('b35ec26f4d630e67a75ed6e3869441458d94e5727e4abf2c557915531b234bb5')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract "*.desktop" || true
    ./"${_appimage}" --appimage-extract "usr/share/icons/*" || true
    ./"${_appimage}" --appimage-extract "*.png" || true
}

package() {
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/riff/riff.AppImage"

    install -dm755 "${pkgdir}/usr/bin"
    ln -sf "/opt/riff/riff.AppImage" "${pkgdir}/usr/bin/riff"

    if [[ -d "${srcdir}/squashfs-root" ]]; then
        cd "${srcdir}/squashfs-root"
        find . -maxdepth 1 -name "*.desktop" -exec sed -i -E 's|Exec=[^ ]+|Exec=/usr/bin/riff|' {} +
        find . -maxdepth 1 -name "*.desktop" -exec install -Dm644 {} "${pkgdir}/usr/share/applications/riff.desktop" \;
        if [[ -d "usr/share/icons" ]]; then
            cp -r usr/share/icons "${pkgdir}/usr/share/"
        else
            find . -maxdepth 1 -name "*.png" -exec install -Dm644 {} "${pkgdir}/usr/share/pixmaps/riff.png" \;
        fi
    fi
}
