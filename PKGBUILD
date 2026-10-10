# Maintainer: Alexis Rossfelder <rossfelderalexis@gmail.com>
pkgname=hermes-webui-desktop-appimage
pkgver=0.7.0
pkgrel=1
pkgdesc="Cross-platform desktop shell for Hermes WebUI, the web interface for Hermes Agent (AppImage)"
arch=('x86_64')
url="https://github.com/hermes-webui/hermes-desktop-rust"
license=('MIT')
depends=('fuse2' 'webkit2gtk-4.1' 'gtk3')
provides=('hermes-webui-desktop')
conflicts=('hermes-webui-desktop')
options=('!strip' '!debug')
_appimage="hermes-webui-desktop-${pkgver}.AppImage"
source=("${_appimage}::https://github.com/hermes-webui/hermes-desktop-rust/releases/download/v${pkgver}/Hermes.WebUI.Desktop_${pkgver}_lin_x86_64.AppImage")
sha256sums=('b1b0c3b3cd56f8861ce701bb6f5f792ee271ed32648ff9b54545cc862c110c41')
noextract=("${_appimage}")

prepare() {
	chmod +x "$srcdir/${_appimage}"
	"$srcdir/${_appimage}" --appimage-extract 'usr/share/icons/*' >/dev/null
}

package() {
	install -Dm755 "$srcdir/${_appimage}" "$pkgdir/opt/hermes-webui-desktop/hermes-webui-desktop.AppImage"

	install -d "$pkgdir/usr/bin"
	ln -s /opt/hermes-webui-desktop/hermes-webui-desktop.AppImage "$pkgdir/usr/bin/hermes-webui-desktop"

	install -d "$pkgdir/usr/share"
	cp -r "$srcdir/squashfs-root/usr/share/icons" "$pkgdir/usr/share/icons"
	find "$pkgdir/usr/share/icons" -type d -empty -delete
	find "$pkgdir/usr/share/icons" -type d -exec chmod 755 {} \;
	find "$pkgdir/usr/share/icons" -type f -exec chmod 644 {} \;

	install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/hermes-webui-desktop.desktop" <<DESKTOP
[Desktop Entry]
Categories=Office;
Comment=Hermes WebUI Desktop — cross-platform shell for hermes-webui
Exec=hermes-webui-desktop
StartupWMClass=hermes-webui-desktop
Icon=hermes-webui-desktop
Name=Hermes WebUI Desktop
Terminal=false
Type=Application
DESKTOP
}
