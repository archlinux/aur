# Maintainer: Ahmed W. <oneofone@gmail.com>
# old maintainer:   M.Reynolds <blackboxnetworkproject@gmail.com>

pkgname=tastyworks
pkgver='1.12.2'
pkgrel='1'
pkgdesc="One of the fastest, most reliable, and most secure trading platforms in the world."
arch=('x86_64')
url='https://tastyworks.com/'
license=('custom:commercial')
depends=('java-runtime')
conflicts=('tastyworks-bin')

source=(https://download.tastyworks.com/desktop-1.x.x/${pkgver}/tastyworks-${pkgver}-${pkgrel}_amd64.deb)
sha256sums=('30db45ae2828786a575ec2d08a0d7443d6cf1c5fa8e17f1d79a1a57f491b69b9')

build() {
	tar xf data.tar.xz

	# Remove additional bundled Java "runtime"
	rm -rf opt/tastyworks/lib/runtime
	sed -i 's|app.runtime=$ROOTDIR/lib/runtime|app.runtime=/usr/lib/jvm/default-runtime|' opt/tastyworks/lib/app/tastyworks.cfg

	DF="opt/tastyworks/lib/tastyworks-tastyworks.desktop"

	# Set correct information for the application .desktop launcher
	sed -i 's|Name=tastyworks|Name=TastyWorks|'                  $DF
	sed -i 's|Comment=tastyworks|Comment=Trading Platform|'      $DF
	sed -i 's|Exec=.*|Exec=/usr/bin/tastyworks|'             $DF
	sed -i 's|Icon=.*|Icon=tastyworks|'                      $DF
	sed -i 's|Categories=tastyworks|Categories=Network|'         $DF

	# Add the correct startup window manager class
	# This *should* fix gnome from creating more than one dock entry for the program
	echo 'StartupWMClass=tasty.javafx.launcher.LauncherFxApp' >> $DF
	sed -i '/^[[:space:]]*$/d'                                   $DF
}

package() {
	install -d "${pkgdir}/usr/bin"
	ln -sf "/usr/lib/${pkgname}/bin/tastyworks" "${pkgdir}/usr/bin/${pkgname}"

	install -d "${pkgdir}/usr/lib/${pkgname}/lib/app"
	cp -r           "${srcdir}/opt/tastyworks/lib/app/"                          "${pkgdir}/usr/lib/${pkgname}/lib/"
	install -Dm 644 "${srcdir}/opt/tastyworks/lib/libapplauncher.so"             "${pkgdir}/usr/lib/${pkgname}/lib/libapplauncher.so"

	install -Dm 755 "${srcdir}/opt/tastyworks/bin/tastyworks"                    "${pkgdir}/usr/lib/${pkgname}/bin/tastyworks"

	install -Dm 644 "${srcdir}/opt/tastyworks/lib/tastyworks-tastyworks.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm 644 "${srcdir}/opt/tastyworks/share/doc/copyright"               "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm 644 "${srcdir}/opt/tastyworks/lib/tastyworks.png"                "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
