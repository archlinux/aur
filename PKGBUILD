pkgname=terax-ai-bin
pkgver=0.6.5
pkgrel=1
pkgdesc="Modern AI terminal powered by Tauri"
arch=(x86_64)
url="https://github.com/crynta/terax-ai"
license=(Apache-2.0)

depends=("fuse2")
options=(!strip !debug)
conflicts=("terax" "terax-bin")
provides=(terax)

_appimage="Terax_${pkgver}_amd64.AppImage"
source=("${_appimage}::https://github.com/crynta/terax-ai/releases/download/v0.6.5/Terax_0.6.5_amd64.AppImage")
sha256sums=('df724a48d1cbc588452d34c5114196871b32f717c9923343d4137b0408bdb0c9')
noextract=("${_appimage}")

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

package() {
    install -Dm755 "${srcdir}/${_appimage}" \
        "${pkgdir}/opt/${pkgname}/${_appimage}"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/terax"

    # Install extra files from srcdir (e.g., LICENSE alongside AppImage)

    cd "${srcdir}/squashfs-root"
    find . -maxdepth 1 -name '*.desktop' -exec \
        install -Dm644 {} "${pkgdir}/usr/share/applications/terax.desktop" \;

    sed -i "s|Exec=.*|Exec=terax %U|" \
        "${pkgdir}/usr/share/applications/terax.desktop"
    sed -i "s|Icon=.*|Icon=terax|" \
        "${pkgdir}/usr/share/applications/terax.desktop"
    if [ -d usr/share/icons ]; then
        cp -r usr/share/icons "${pkgdir}/usr/share/"
        find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 {} +
        find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 {} +
        find "${pkgdir}/usr/share/icons" -name '*.png' -o -name '*.svg' | while read -r icon; do
            dir=$(dirname "$icon")
            base=$(basename "$icon")
            ext="${base##*.}"
            mv "$icon" "${dir}/terax.${ext}"
        done
    fi

    for ext in png svg; do
        if [ -f *.${ext} ]; then
            install -Dm644 *.${ext} "${pkgdir}/usr/share/pixmaps/terax.${ext}"
            break
        fi
    done
}