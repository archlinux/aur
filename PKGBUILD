# Most of the pkgbuild was taken from the joplin-appimage pkgbuild, so credit to thynkon more than anything. 
# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=joplin-appimage
# Maintainer: iettuce <necoarc@tutanota.com>

pkgname="firealpaca-appimage"
pkgver="2.11.15"
pkgrel="1"
pkgdesc="Simple and easy digital painting software - AppImage"
arch=("x86_64")
depends=('fuse2')
license=('custom')
conflicts=("firealpaca")
url=https://firealpaca.com/download/linux
options=(!strip)
_filename="FireAlpaca-${pkgver}-${arch}.AppImage"
_install_path="/opt/appimages/${_filename}"
_squashfs_desktop_file="FireAlpaca.desktop"
_desktop_file="/usr/share/applications/FireAlpaca.desktop"
source=(
	"${_filename}::${url}"
)
sha256sums=(
	bfef535332754d196da0b688979fdf7846728ed91d214f501118ed26578097c9
)



package() {
	    chmod +x "${_filename}"
	    mkdir -p squashfs-root/usr/share/icons/hicolor/{128x128,48x48,96x96}/apps
	    ./${_filename} --appimage-extract "usr/share/icons/hicolor/*/apps/fa.png" > /dev/null 2>&1
	    ./${_filename} --appimage-extract FireAlpaca.desktop > /dev/null 2>&1
    	    sed -i -E "s|Exec=AppRun|Exec=${_install_path}|" "squashfs-root/${_squashfs_desktop_file}"
	    sed -i -E "s|Icon=fa|Icon=fa|" "squashfs-root/${_squashfs_desktop_file}"

    	    install -dm755 "${pkgdir}/usr/share/icons" 
            cp -dpr --no-preserve=ownership "squashfs-root/usr/share/icons" "${pkgdir}/usr/share"
            chmod -R 755 "${pkgdir}/usr/share/icons"
            find "${pkgdir}/usr/share/icons" -type f -name "fa.png" -exec chmod 644 {} \;

    # install .desktop file and image file
    # disable appimage desktop integration: https://github.com/AppImage/AppImageSpec/blob/master/draft.md#desktop-integration
    # disable AppimageLauncher integration prompt
    # https://github.com/TheAssassin/AppImageLauncher/issues/78#issuecomment-466390939
            sed -i -E "s|Exec=${_install_path}|Exec=env DESKTOPINTEGRATION=0 APPIMAGELAUNCHER_DISABLE=1 /usr/bin/FireAlpaca|" "squashfs-root/${_squashfs_desktop_file}"
            install -Dm644 "squashfs-root/${_squashfs_desktop_file}" "${pkgdir}/${_desktop_file}"
            install -Dm755 "${_filename}" "${pkgdir}/${_install_path}"
            mkdir "${pkgdir}/usr/bin/" && chmod 755 "${pkgdir}/usr/bin/"
            ln -s "${_install_path}" "${pkgdir}/usr/bin/FireAlpaca"

    # disable AppImage integration prompt
    # https://github.com/electron-userland/electron-builder/issues/1962
            install -dm755 "${pkgdir}/usr/share/appimagekit"
}
