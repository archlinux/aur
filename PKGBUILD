# Maintainer: Evgeny Shvits <tony.darko@gmail.com>
#
# NOTE: If you plan on using the usbblaster make sure you are member of the users group.

_basename=quartus
pkgname="${_basename}-130"
pkgver=13.0.1.232
pkgrel=1
pkgdesc="Quartus II 13.0 SP1 Subscription Edition (with old MAX CPLDs and Cyclone FPGAs)"
arch=('i686' 'x86_64')
url="http://dl.altera.com/13.0sp1/?edition=subscription"
license=('custom')
provides=("quartus" "quartus-free")
conflicts=("quartus" "quartus-free")

_alteradir="/opt/altera130"

if [[ $CARCH = i686 ]]
then
	depends=('glibc' 'libxext' 'libx11' 'libxau' 'libxdmcp' 'freetype2' 'fontconfig' 'expat' 'libpng12')
	optdepends=('gtk: For eclipse-nios2 support'
				'libxtst: For eclipse-nios2 support')
fi

if [[ $CARCH = x86_64 ]]
then
	depends=('lib32-glibc' 'lib32-libxext' 'lib32-libx11' 'lib32-libxau' 'lib32-libxdmcp' 'lib32-freetype2'
			 'lib32-fontconfig' 'lib32-expat' 'lib32-libpng12')
	optdepends=('lib32-gtk: For eclipse-nios2 support'
				'lib32-libxtst: For eclipse-nios2 support')
fi

source=("http://download.altera.com/akdlm/software/acdsinst/13.0sp1/232/ib_installers/QuartusSetup-13.0.1.232.run"
		"http://download.altera.com/akdlm/software/acdsinst/13.0sp1/232/ib_installers/max-13.0.1.232.qdz"
		"http://download.altera.com/akdlm/software/acdsinst/13.0sp1/232/ib_installers/cyclone-13.0.1.232.qdz"
		"quartus.sh"
		"quartus.desktop"
		"51-usbblaster.rules")
md5sums=('ae91ab69beab18da33e9c6d1c780a8f2'
         'a9702931640d4f4c314bec491651d0eb'
         '767c28be73344ff92f8105c25b674d22'
         'c34dfaf31247ccbd505578e2e5b040ac'
         'cc21cecc2d2fc9b450c7a6349a42cca6'
         '3d448098eda1515e503ed9dcac7b64a5')
noextract=("max-${pkgver}.qdz"
		   "cyclone-${pkgver}.qdz")

options=('!strip')

PKGEXT=".pkg.tar"

package() {
	cd "${srcdir}"

	chmod a+x QuartusSetup-13.0.1.232.run

	./QuartusSetup-13.0.1.232.run --mode unattended --unattendedmodeui none --installdir "${pkgdir}${_alteradir}"

	rm -r "${pkgdir}${_alteradir}/uninstall"
	rm -r "${pkgdir}${_alteradir}/logs"

	sed -i.bak "s,_alteradir,$_alteradir,g" quartus.sh
	sed -i.bak "s,_alteradir,$_alteradir,g" quartus.desktop

	install -D -m644 "${pkgdir}${_alteradir}/quartus/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -D -m755 quartus.sh "${pkgdir}/etc/profile.d/quartus.sh"
	install -D -m644 51-usbblaster.rules "${pkgdir}/etc/udev/rules.d/51-usbblaster.rules"
	install -D -m644 quartus.desktop "${pkgdir}/usr/share/applications/quartus.desktop"

}
