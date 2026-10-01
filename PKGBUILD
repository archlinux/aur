# Maintainer: Ahmed W. <oneofone@gmail.com>
# old maintainer:   M.Reynolds <blackboxnetworkproject@gmail.com>

pkgname=tastytrade
pkgver=0.59.0
pkgrel=2
epoch=1
pkgdesc="One of the fastest, most reliable, and most secure trading platforms in the world."
arch=('x86_64')
url='https://tastytrade.com/'
license=('custom:commercial')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'glib2' 'glibc' 'gtk3' 'libcups' 'libgcc'
	'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr'
	'mesa' 'nspr' 'nss' 'pango' 'systemd-libs')
optdepends=('libappindicator-gtk3: tray icon'
	'libnotify: desktop notifications'
	'libsecret: store credentials in the system keyring'
	'xdg-utils: open links in the default browser')
conflicts=('tastytrade-bin')
options=('!strip')
source=("${pkgname}-${pkgver}.deb::https://download.tastytrade.com/desktop-2.0/tastytrade-linux-amd64-${pkgver}.deb")
sha512sums=('8e8cf4e8b96af5dc79adf927d0377b2b4c054738380501bf1ce8bdac7c772b5cf066aaaa8a089c9c9b8dc1041f8842c648fa957249aaaf19f87dee5195ac7fd0')

prepare() {
	bsdtar -xf data.tar.xz

	DF="usr/share/applications/tastytrade.desktop"
	sed -i 's|^Name=tastytrade 2.0|Name=TastyTrade|' "$DF"
	sed -i 's|^Exec="/opt/tastytrade 2.0/tastytrade"|Exec=/usr/bin/tastytrade|' "$DF"
}

package() {
	install -d "${pkgdir}/usr/lib/${pkgname}"
	cp -a "${srcdir}/opt/tastytrade 2.0/." "${pkgdir}/usr/lib/${pkgname}/"

	install -d "${pkgdir}/usr/bin"
	ln -s "/usr/lib/${pkgname}/tastytrade" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm 644 "${srcdir}/usr/share/applications/tastytrade.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm 644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/tastytrade.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"

	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s "/usr/lib/${pkgname}/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/"
	ln -s "/usr/lib/${pkgname}/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
