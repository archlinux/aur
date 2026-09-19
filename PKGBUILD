# Maintainer: Satyam Jha <satyam_jha at zohomail dot in>

pkgname=oinkoin-bin
pkgver=1.14.0
pkgrel=1
pkgdesc="An offline Privacy focused expense tracker"
arch=('x86_64')
url="https://github.com/emavgl/oinkoin"
license=('GPL-3.0-or-later')
depends=('sqlite' 'gtk3' 'glib2')
options=('!strip')
provides=('oinkoin')
conflicts=('oinkoin')
_appimage="piggybank-1.14.0+7150-linux.AppImage"
source=("${_appimage}::${url}/releases/download/${pkgver}/${_appimage}")
sha256sums=('d587b0d518e0b2643285dc006db9c7cd4a57f55950c7b2a109ff944a70043530')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract > /dev/null
}

build() {
    sed -i \
        -e "s|^Exec=.*|Exec=/usr/bin/oinkoin|" \
        -e "s|^TryExec=.*|TryExec=oinkoin|" \
        -e "s|^Icon=.*|Icon=oinkoin|" \
        squashfs-root/piggybank.desktop
}

package() {
    install -Dm755 "${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 squashfs-root/piggybank.desktop "${pkgdir}/usr/share/applications/org.emavgl.oinkoin.desktop"
    install -Dm644 squashfs-root/piggybank.png "${pkgdir}/usr/share/pixmaps/oinkoin.png"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/oinkoin"
}
