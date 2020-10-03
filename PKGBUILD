# Maintainer: Ahmed W. <oneofone@gmail.com>
# copied a few parts from https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=tastyworks

pkgname=tastyworks-bin
pkgver='1.9.2'
pkgrel='1'
pkgdesc="One of the fastest, most reliable, and most secure trading platforms in the world."
arch=('x86_64')
url='https://tastyworks.com/'
license=('custom:commercial')
depends=('java-runtime')

source=(https://download.tastyworks.com/desktop-1.x.x/${pkgver}/tastyworks-${pkgver}-${pkgrel}_amd64.deb)
sha256sums=('a59d74919ce035c772bd2c0577b495827e20773d21eb0f164b4791cd954adac5')

build() {
	tar xf data.tar.xz

	# Remove additional bundled Java "runtime"
	rm -rf opt/tastyworks/lib/runtime
	sed -i 's|app.runtime=$ROOTDIR/lib/runtime|app.runtime=/usr/lib/jvm/default-runtime|' opt/tastyworks/lib/app/tastyworks.cfg

	DF="opt/tastyworks/lib/tastyworks-tastyworks.desktop"

	# Set correct information for the application .desktop launcher
	sed -i 's|Name=tastyworks|Name=TastyWorks|'                  $DF
	sed -i 's|Comment=tastyworks|Comment=Trading Platform|'      $DF
	sed -i 's|Exec=.*|Exec=/usr/bin/tastyworks-bin|'             $DF
	sed -i 's|Icon=.*|Icon=tastyworks-bin|'                      $DF
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
