pkgname=multica-desktop-bin
pkgver=0.2.29
pkgrel=1
pkgdesc="The open-source managed agents platform. Turn coding agents into real teammates — assign tasks, track progress, compound skills - Desktop GUI"
arch=(x86_64 aarch64)
url="https://github.com/multica-ai/multica"
license=(MIT)

depends=("fuse2")
options=(!strip !debug)
conflicts=("multica-desktop")
provides=(multica-desktop)

_appimage="multica-desktop-${pkgver}-linux-${arch}.AppImage"
source=("${_appimage}::https://github.com/multica-ai/multica/releases/download/v0.2.29/multica-desktop-0.2.29-linux-x86_64.AppImage")
sha256sums=('1828047a774f4b8875596b2523938b3aa04b2c1e996301972b45600796f6387b')
noextract=("${_appimage}")

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

package() {
    install -Dm755 "${srcdir}/${_appimage}" \
        "${pkgdir}/opt/${pkgname}/${_appimage}"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/multica-desktop"

    # Install extra files from srcdir (e.g., LICENSE alongside AppImage)

    cd "${srcdir}/squashfs-root"
    find . -maxdepth 1 -name '*.desktop' -exec \
        install -Dm644 {} "${pkgdir}/usr/share/applications/multica-desktop.desktop" \;

    sed -i "s|Exec=.*|Exec=multica-desktop %U|" \
        "${pkgdir}/usr/share/applications/multica-desktop.desktop"
    sed -i "s|Icon=.*|Icon=multica-desktop|" \
        "${pkgdir}/usr/share/applications/multica-desktop.desktop"
    if [ -d usr/share/icons ]; then
        cp -r usr/share/icons "${pkgdir}/usr/share/"
        find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 {} +
        find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 {} +
        find "${pkgdir}/usr/share/icons" -name '*.png' -o -name '*.svg' | while read -r icon; do
            dir=$(dirname "$icon")
            base=$(basename "$icon")
            ext="${base##*.}"
            mv "$icon" "${dir}/multica-desktop.${ext}"
        done
    fi

    for ext in png svg; do
        if [ -f *.${ext} ]; then
            install -Dm644 *.${ext} "${pkgdir}/usr/share/pixmaps/multica-desktop.${ext}"
            break
        fi
    done
}