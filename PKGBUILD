# Maintainer: Robert Olejnik <robert [/.at./] teonite.com>
pkgname=defguard-client
pkgsrc=defguard-client
pkgver=0.1.1
pkgrel=1
pkgdesc="defguard enterprise SSO & Wireguard VPN desktop client"
arch=('x86_64')
url="https://github.com/DefGuard/client"
license=('custom')
depends=('cairo' 'desktop-file-utils'  'gdk-pixbuf2'  'glib2'  'gtk3'  'hicolor-icon-theme'  'libayatana-appindicator'  'libsoup'  'pango'  'webkit2gtk')
source_x86_64=(https://github.com/DefGuard/client/releases/download/v${pkgver}/defguard-client_${pkgver}_amd64.deb)
sha256sums_x86_64=('b818fb5672967e1786becefa2579b6534df45e03849a80e27d60938645d5adaa')

build() {
    bsdtar -xf "${srcdir}/data.tar.gz"
}

package() {
    install -Dm755 "${srcdir}/usr/bin/defguard-client" -t "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/usr/sbin/defguard-service" -t "${pkgdir}/usr/sbin"
    install -Dm644 "${srcdir}/usr/lib/systemd/system/defguard-service.service" -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256@2/apps/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/${pkgname}.png"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/32x32/apps/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${pkgname}.png"
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

