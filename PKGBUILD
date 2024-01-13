# Maintainer: Robert Olejnik <robert [/.at./] teonite.com>
pkgname=defguard-client
pkgsrc=defguard-client
pkgver=0.1.1
pkgrel=3
pkgdesc="defguard enterprise SSO & Wireguard VPN desktop client"
arch=('x86_64')
url="https://github.com/DefGuard/client"
license=('custom')
depends=('cairo' 'desktop-file-utils'  'gdk-pixbuf2'  'glib2'  'gtk3'  'hicolor-icon-theme'  'libayatana-appindicator'  'libsoup'  'pango'  'webkit2gtk')
source_x86_64=(https://github.com/DefGuard/client/releases/download/v${pkgver}/defguard-client_${pkgver}_amd64.deb)
sha256sums_x86_64=('b818fb5672967e1786becefa2579b6534df45e03849a80e27d60938645d5adaa')

package() {
    msg2 "Extracting the source debian package data.tar.xz..."
    bsdtar -xf data.tar.xz -C "$pkgdir/"
}

post_install() {
	gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
	systemctl daemon-reload
	systemctl enable defguard-service
	systemctl start defguard-service
	update-desktop-database -q
}

post_upgrade() {
	post_install
}

pre_remove() {
	systemctl stop defguard-service
	systemctl disable defguard-service
}

post_remove() {
	gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
	systemctl daemon-reload
	update-desktop-database -q
}

