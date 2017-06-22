# Maintainer: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=rcf
pkgver=1.6.3.1401
pkgrel=1
pkgdesc="Red Crucible®: Firestorm - Free to play online FPS"
arch=('i686' 'x86_64')
url="http://www.rocketeergames.com/site/rcf/"
license=('LLC')
# depends=()
makedepends=('unzip')
source=("http://cdn.rocketeergames.com/$pkgver/redcrucible_lin.zip" "rcf.desktop")
md5sums=('35e4dc0e970f48e38af260f0e7757be2' '2323cc5d4d853d932d3b7a84543a3ed4')

package() {
	mkdir -p "${pkgdir}/opt/rcf"
	unzip "$srcdir/redcrucible_lin.zip" -d "${pkgdir}/opt/rcf"

	# Remove unneeded files:
	if [ "$CARCH" = "x86_64" ]; then
		rm -f "${pkgdir}/opt/rcf/Red Crucible.x86"
		rm -rf "${pkgdir}/opt/rcf/Red Crucible_Data/Plugins/x86"
		rm -rf "${pkgdir}/opt/rcf/Red Crucible_Data/Mono/x86"
	else
		rm -f "${pkgdir}/opt/rcf/Red Crucible.x86_64"
		rm -rf "${pkgdir}/opt/rcf/Red Crucible_Data/Plugins/x86_64"
		rm -rf "${pkgdir}/opt/rcf/Red Crucible_Data/Mono/x86_64"
	fi

    # Desktop launcher with icon
    install -D -m644 "${srcdir}/rcf.desktop" "${pkgdir}/usr/share/applications/rcf.desktop"
    install -D -m644 "${pkgdir}/opt/rcf/Red Crucible_Data/Resources/UnityPlayer.png"     "${pkgdir}/usr/share/pixmaps/rcf.png"

	# Make it launchable from CLI ("ln -s" doesn't work in this case):
	mkdir -p "${pkgdir}/usr/bin"
	if [ "$CARCH" = "x86_64" ]; then
		echo "\"/opt/rcf/./Red Crucible.x86_64\"" > "${pkgdir}/usr/bin/rcf"
	else
		echo "\"/opt/rcf/./Red Crucible.x86\"" > "${pkgdir}/usr/bin/rcf"
	fi
	chmod 0755 "${pkgdir}/usr/bin/rcf"
}