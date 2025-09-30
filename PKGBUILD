# Maintainer: Robert Olejnik <robert [/.at./] teonite.com>
pkgname=defguard-client
pkgsrc=defguard-client
pkgver=1.5.1
pkgrel=2
pkgdesc="Defguard VPN Multi-Factor Authentication Desktop Client"
arch=('x86_64')
url="https://github.com/DefGuard/client"
license=('custom')
depends=('desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libayatana-appindicator'  'libsoup'  'pango'  'webkit2gtk-4.1' 'systemd-resolvconf')
source_x86_64=(https://github.com/DefGuard/client/releases/download/v${pkgver}/defguard-client_${pkgver}_amd64.deb)
# Update to actual SHA sum of package
sha256sums_x86_64=('bc7d84e5a25c47644a3db78c2a69854e2e04dac4ba40f149c88b4a2293d669b4')

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

