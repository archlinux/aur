# Maintainer: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=rcr
pkgver=1.4.0.1181
pkgrel=1
pkgdesc="Red Crucible®: Reloaded - Free to play online FPS"
arch=('i686' 'x86_64')
url="http://www.rocketeergames.com/site/rcr/"
license=('LLC')
# depends=()
makedepends=('unzip')
source=("http://cdn.rocketeergames.com/rcreloaded/redcrucible_lin.zip" "rcr.desktop")
md5sums=('2765858f674070973887ece5b6bfda5a' 'b03e6aadb89d013092b10666bfbb9460')

package() {
	mkdir -p "${pkgdir}/opt/rcr"
	unzip "$srcdir/redcrucible_lin.zip" -d "${pkgdir}/opt/rcr"

	# Remove unneeded files:
	if [ "$CARCH" = "x86_64" ]; then
		rm -f "${pkgdir}/opt/rcr/Red Crucible Reloaded.x86"
		rm -rf "${pkgdir}/opt/rcr/Red Crucible Reloaded_Data/Plugins/x86"
		rm -rf "${pkgdir}/opt/rcr/Red Crucible Reloaded_Data/Mono/x86"
	else
		rm -f "${pkgdir}/opt/rcr/Red Crucible Reloaded.x86_64"
		rm -rf "${pkgdir}/opt/rcr/Red Crucible Reloaded_Data/Plugins/x86_64"
		rm -rf "${pkgdir}/opt/rcr/Red Crucible Reloaded_Data/Mono/x86_64"
	fi

	# Desktop launcher with icon:
	install -D -m644 "${srcdir}/rcr.desktop" "${pkgdir}/usr/share/applications/rcr.desktop"
	install -D -m644 "${pkgdir}/opt/rcr/Red Crucible Reloaded_Data/Resources/UnityPlayer.png" "${pkgdir}/usr/share/pixmaps/rcr.png"

	# Make it launchable from CLI ("ln -s" doesn't work in this case):
	mkdir -p "${pkgdir}/usr/bin"
	if [ "$CARCH" = "x86_64" ]; then
		echo "\"/opt/rcr/./Red Crucible Reloaded.x86_64\"" > "${pkgdir}/usr/bin/rcr"
	else
		echo "\"/opt/rcr/./Red Crucible Reloaded.x86\"" > "${pkgdir}/usr/bin/rcr"
	fi
	chmod 0755 "${pkgdir}/usr/bin/rcr"
}