# Maintainer: Robert Olejnik <robert [/.at./] teonite.com>
pkgname=defguard-client
pkgsrc=defguard-client
pkgver=1.2.3
pkgrel=1
pkgdesc="WireGuard Desktop Client with Zero-Trust Multi-Factor Authentication"
arch=('x86_64')
url="https://github.com/DefGuard/client"
license=('custom')
depends=('cairo' 'desktop-file-utils'  'gdk-pixbuf2'  'glib2'  'gtk3'  'hicolor-icon-theme'  'libayatana-appindicator'  'libsoup'  'pango'  'webkit2gtk' 'systemd-resolvconf')
source_x86_64=(https://github.com/DefGuard/client/releases/download/v${pkgver}/defguard-client_${pkgver}_amd64.deb)
# Update to actual SHA sum of package
sha256sums_x86_64=('e2a0a1ba3f0f099c61f85140dce978ca0db59c84590f393ca76b24e676f5402b')

package() {
    msg2 "Extracting the source debian package data.tar.xz..."
    bsdtar -xf data.tar.gz -C "$pkgdir/"
    mv $pkgdir/usr/sbin/defguard-service $pkgdir/usr/bin/
    rmdir $pkgdir/usr/sbin
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

