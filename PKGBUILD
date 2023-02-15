# Maintainer: Connor Reeder <connor dot reeder at ymail dot com>

pkgname='teamwork-timer'
pkgver=2.1.1
pkgrel=1
pkgdesc='Timer app - the perfect complement to Teamwork.'
arch=('x86_64')
url='https://www.teamwork.com/'
license=('unknown')
depends=('fuse2' 'zlib' 'hicolor-icon-theme')
options=(!strip)
_shortname='teamworktimer'
_appimage="Teamwork+Timer-${pkgver}.AppImage"
source=(
		"https://s3.amazonaws.com/tw-open/timer/${_appimage}"
)
sha256sums=(
		'ae9a04a2394117ad9daa212b83efe17b5189b8c4e15346467296ffcb8aba0f59'
)

prepare() {
    chmod +x ${_appimage}
    ./${_appimage} --appimage-extract
}

package() {
    cd "$srcdir"

    # Create Directories
    install -d "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share/icons/hicolor"

    # Install AppImage
    install -Dm755 "${_appimage}" -t "${pkgdir}/opt/${_shortname}"

    # Install Icons, Desktop Shortcut
    find squashfs-root -type d -exec chmod 0755 {} \;
    cp -r squashfs-root/usr/share/icons/hicolor "${pkgdir}/usr/share/icons/"
    sed -i -E "s|Exec=AppRun %U|Exec=/usr/bin/${_shortname}|" "squashfs-root/${_shortname}.desktop"
    install -Dm644 "squashfs-root/${_shortname}.desktop" -t "${pkgdir}/usr/share/applications/"

    # Symlink AppImage
    ln -s "/opt/${_shortname}/${_appimage}" "${pkgdir}/usr/bin/${_shortname}"
}

