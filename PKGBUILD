# Maintainer: Ahmed W. <oneofone@gmail.com>
# old maintainer:   M.Reynolds <blackboxnetworkproject@gmail.com>

pkgname=tastytrade
pkgver='2.59.0'
pkgrel='1'
pkgdesc="One of the fastest, most reliable, and most secure trading platforms in the world."
arch=('x86_64')
url='https://tastytrade.com/'
license=('custom:commercial')
conflicts=('tastytrade-bin')
source=(https://download.tastytrade.com/desktop-2.0/tastytrade-linux-amd64-latest.deb)
sha256sums=('7efa5502f209a029509c98198c84043fc83dde69f8b9ead266b1fff2eda30b78')

build() {
	tar axf data.tar.zst

	# Remove additional bundled Java "runtime"
	#rm -rf opt/tastytrade/lib/runtime
	#sed -i 's|app.runtime=$ROOTDIR/lib/runtime|app.runtime=/usr/lib/jvm/default-runtime|' opt/tastytrade/lib/app/tastytrade.cfg

	DF="opt/tastytrade/lib/tastytrade-tastytrade.desktop"

	# Set correct information for the application .desktop launcher
	sed -i 's|Name=tastytrade|Name=TastyTrade|' $DF
	sed -i 's|Comment=tastytrade|Comment=Trading Platform|' $DF
	sed -i 's|Exec=.*|Exec=/usr/bin/tastytrade|' $DF
	sed -i 's|Icon=.*|Icon=tastytrade|' $DF
	sed -i 's|Categories=tastytrade|Categories=Network|' $DF

	# Add the correct startup window manager class
	# This *should* fix gnome from creating more than one dock entry for the program
	echo 'StartupWMClass=tasty.javafx.launcher.LauncherFxApp' >>$DF
	sed -i '/^[[:space:]]*$/d' $DF
}

package() {
	install -d "${pkgdir}/usr/bin"
	ln -sf "/usr/lib/${pkgname}/bin/tastytrade" "${pkgdir}/usr/bin/${pkgname}"

	install -d "${pkgdir}/usr/lib/${pkgname}/lib/app"
	cp -r "${srcdir}/opt/tastytrade/lib/app/" "${pkgdir}/usr/lib/${pkgname}/lib/"
	cp -r "${srcdir}/opt/tastytrade/lib/runtime/" "${pkgdir}/usr/lib/${pkgname}/lib/"
	install -Dm 644 "${srcdir}/opt/tastytrade/lib/libapplauncher.so" "${pkgdir}/usr/lib/${pkgname}/lib/libapplauncher.so"

	install -Dm 755 "${srcdir}/opt/tastytrade/bin/tastytrade" "${pkgdir}/usr/lib/${pkgname}/bin/tastytrade"

	install -Dm 644 "${srcdir}/opt/tastytrade/lib/tastytrade-tastytrade.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm 644 "${srcdir}/opt/tastytrade/share/doc/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm 644 "${srcdir}/opt/tastytrade/lib/tastytrade.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

	echo "changelog: https://support.tastytrade.com/support/s/solutions/articles/43000435186"
}
