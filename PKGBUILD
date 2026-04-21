pkgname=superset-bin
pkgver=1.5.6
pkgrel=1
pkgdesc="Code Editor for the AI Agents Era - Run an army of Claude Code, Codex, etc. on your machine"
arch=(x86_64)
url="https://superset.sh"
license=(custom)

depends=(fuse2 hicolor-icon-theme)
makedepends=()


options=(!strip !debug)



conflicts=(superset-desktop-bin)


_appimage="superset-${pkgver}-${arch}.AppImage"
source=("${_appimage}::https://github.com/superset-sh/superset/releases/download/desktop-v1.5.6/superset-1.5.6-x86_64.AppImage")
sha256sums=('207c95cea70cc46380e538f328acaf0a481608951dede40ae4523fb3801b9b2e')
noextract=("${_appimage}")

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

package() {
    install -Dm755 "${srcdir}/${_appimage}" \
        "${pkgdir}/opt/${pkgname}/${_appimage}"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/superset-desktop"

    cd "${srcdir}/squashfs-root"

    
    find . -maxdepth 1 -name '*.desktop' -exec \
        install -Dm644 {} "${pkgdir}/usr/share/applications/superset-desktop.desktop" \;

    sed -i "s|Exec=.*|Exec=superset-desktop %U|" \
        "${pkgdir}/usr/share/applications/superset-desktop.desktop"
    sed -i "s|Icon=.*|Icon=superset-desktop|" \
        "${pkgdir}/usr/share/applications/superset-desktop.desktop"
    

    
    if [ -d usr/share/icons ]; then
        cp -r usr/share/icons "${pkgdir}/usr/share/"
        find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 {} +
        find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 {} +
        find "${pkgdir}/usr/share/icons" -name '*.png' -o -name '*.svg' | while read -r icon; do
            dir=$(dirname "$icon")
            base=$(basename "$icon")
            ext="${base##*.}"
            mv "$icon" "${dir}/superset-desktop.${ext}"
        done
    fi

    for ext in png svg; do
        if [ -f *.${ext} ]; then
            install -Dm644 *.${ext} "${pkgdir}/usr/share/pixmaps/superset-desktop.${ext}"
            break
        fi
    done
    
}