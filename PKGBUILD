# Maintainer: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=rcf
pkgver=1.6.4.1443
pkgrel=1
pkgdesc="Red Crucible®: Firestorm - Free to play online FPS"
arch=('i686' 'x86_64')
url="http://www.rocketeergames.com/site/rcf/"
license=('LLC')
source=("http://cdn.rocketeergames.com/rc3/redcrucible_lin.zip" "rcf.desktop")
md5sums=('2b18243a8c1a3680596bf3c099927038' '2323cc5d4d853d932d3b7a84543a3ed4')

package() {

	msg2 "Removing different architectures files..."
	if [ "$CARCH" = "x86_64" ]; then
		rm -f  "${srcdir}/Red Crucible.x86"
		rm -rf "${srcdir}/Red Crucible_Data/Plugins/x86"
		rm -rf "${srcdir}/Red Crucible_Data/Mono/x86"
	else
		rm -f  "${srcdir}/Red Crucible.x86_64"
		rm -rf "${srcdir}/Red Crucible_Data/Plugins/x86_64"
		rm -rf "${srcdir}/Red Crucible_Data/Mono/x86_64"
	fi

	# Define my architecture (32bit named as "x86" and not "i686"):
	if [ "$CARCH" = "x86_64" ] ; then MYARCH="x86_64" ; else MYARCH="x86" ; fi

    msg2 "Installing files..."

    # System files:
    install -D -m644 "${srcdir}/rcf.desktop" "${pkgdir}/usr/share/applications/rcf.desktop"
    install -D -m644 "${srcdir}/Red Crucible_Data/Resources/UnityPlayer.png" "${pkgdir}/usr/share/pixmaps/rcf.png"

    # Application files:
	install -D "${srcdir}/Red Crucible.${MYARCH}" "${pkgdir}/opt/rcf/Red Crucible.${MYARCH}"
	cp -r "${srcdir}/Red Crucible_Data" "${pkgdir}/opt/rcf/"
	chmod -R 755 "${pkgdir}/opt/rcf"

	# Make it launchable from CLI ("ln -s" doesn't work in our case):
	echo "\"/opt/rcf/./Red Crucible.${MYARCH}\"" > "${srcdir}/rcf_launcher"
    install -D -m755 "${srcdir}/rcf_launcher" "${pkgdir}/usr/bin/rcf"
}