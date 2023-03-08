# Maintener : Arnaud DURAND <durandarnaud44@free.fr>
pkgname='tchap-desktop'
pkgver=1.0
pkgrel=1
pkgdesc="A native-like OS X, Windows, & Linux desktop app for tchap"
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://tchap.gouv.fr"
license=('custom')
makedepends=('nodejs-nativefier')
source=(https://raw.githubusercontent.com/dinsic-pim/tchap-desktop/main/assets/tchap-logo.png)
sha256sums=('5a644f4a3a70f478c26dd7498fafdfea57e5b71cb1914115555e749bf1b0f08e' )

build() {
	if [ "$CARCH" = "x86_64" ]; then
	    _NFARCH='x64'
	elif [ "$CARCH" = "i686" ] || [ "$CARCH" = "pentium4" ]; then
	    _NFARCH='ia32'
	elif [ "$CARCH" = "aarch64" ]; then
	    _NFARCH='arm64'
	elif [ "$CARCH" = "armv7h" ]; then
	    _NFARCH='armv7l'
	else
	    echo "Unsupported architecture. Aborting"
	    exit 1
	fi
	nativefier --name "Tchap" --platform "linux" --arch "x64" --app-copyright "DINUM/MinArm" --conceal --icon "./tchap-logo.png" --insecure --internal-urls ".*?tchap\.gouv\.fr.*?" --maximize --disable-context-menu --disable-dev-tools --single-instance --tray "https://www.tchap.gouv.fr/"
}

package() {
	_INSTDIR="$srcdir"/Tchap-linux-x64
	mkdir -p "$pkgdir"/opt
	mv ${_INSTDIR} "$pkgdir"/opt/tchap-desktop
	mkdir -p "$pkgdir"/usr/bin
	ln -s /opt/tchap-desktop/Tchap "$pkgdir"/usr/bin/tchap
	install -Dm644 "$pkgdir"/opt/tchap-desktop/LICENSE "$pkgdir"/usr/share/licenses/tchap-desktop/LICENSE
	install -Dm644 tchap-logo.png "$pkgdir"/opt/tchap-desktop/tchap-logo.png
	install -Dm644 tchap-logo.png "$pkgdir"/usr/share/pixmaps/tchap.png
	mkdir -p "$pkgdir"/usr/share/applications
	echo "[Desktop Entry]" > "$pkgdir"/usr/share/applications/tchap-desktop.desktop
	echo "Version=$pkgver" >> "$pkgdir"/usr/share/applications/tchap-desktop.desktop
	echo "Name=Tchap Desktop" >> "$pkgdir"/usr/share/applications/tchap-desktop.desktop
	echo "Keywords=Message;Messaging" >> "$pkgdir"/usr/share/applications/tchap-desktop.desktop
	echo "Comment=Using Tchap client" >> "$pkgdir"/usr/share/applications/tchap-desktop.desktop
	echo "Exec=tchap" >> "$pkgdir"/usr/share/applications/tchap-desktop.desktop
	echo "Icon=tchap" >> "$pkgdir"/usr/share/applications/tchap-desktop.desktop
	echo "Type=Application" >> "$pkgdir"/usr/share/applications/tchap-desktop.desktop
	echo "Terminal=false" >> "$pkgdir"/usr/share/applications/tchap-desktop.desktop
	echo "Categories=Internet;Application;" >> "$pkgdir"/usr/share/applications/tchap-desktop.desktop
	








}
post_install() {
  post_upgrade
}

post_upgrade() {
  update-desktop-database -q
}
