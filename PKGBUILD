# Maintainer: evdinowork <etaash.mathamsetty@gmail.com>


pkgname=flashpoint-launcher-bin
pkgver=10.1.7
pkgrel=2
_dataver=1012
pkgdesc="Launcher for BlueMaxima's Flashpoint"
arch=('x86_64')
url="https://github.com/FlashpointProject/launcher"
license=('MIT')
depends=('nss>=3.0'
				 'tar'
				 'php'
				 'gtk3'
				 'libxss'
				 'wine'
				 'qemu-system-x86'
				 'wget')
makedepends=('desktop-file-utils'
				     'git'
    				 'libarchive')
optdepends=('flashplayer-standalone: native Flash support')
conflicts=('flashpoint-bin' 'flashpoint-launcher-git')
source=("flashpoint-data.7z::https://bluepload.unstable.life/selif/flashpoint-${_dataver}-linux-x64.7z"
    "flashpoint.deb::https://github.com/FlashpointProject/launcher/releases/download/${pkgver}/Flashpoint-${pkgver}_linux-amd64.deb")
noextract=("flashpoint-data.7z")
backup=('opt/Flashpoint/config.json'
		'opt/Flashpoint/preferences.json')
sha512sums=('0b521337d40169ab502f433a107d9b7b7ca73512fb99b27ca547240a251f75e931ca8a6b4450b0dec610b14cb1d1ae1fc9599bb82e757d6cfa79cd76bf5fabe8'
    '4e18eec49ff88fcf63177074afc638639cd26b980d6ac54d1b466c31150557a483398a4f9049496d84b3b9e5d511feb6204550f91ce11319b66f67959c53766a')

package(){
	echo "Extracting Data files ..."
	mkdir -vp "${pkgdir}/opt/Flashpoint/"
	echo "Extracting Flashpoint data... (This will take some time)"
	bsdtar -xf flashpoint-data.7z -C "${pkgdir}/opt/Flashpoint/" Data/* FPSoftware/* Server/* Plugins/* Legacy/*
#	rm ${srcdir}/flashpoint.7z
#	cp -rp ${srcdir} ${pkgdir}/opt/Flashpoint/

	echo "Extracting package data ..."
	tar xf data.tar.xz -C "${pkgdir}"

	echo "Creating Launcher..."
	mkdir -vp "${pkgdir}/usr/bin"
	printf \
	"#!/usr/bin/env bash\n\n
	cd /opt/Flashpoint/\n
	/opt/Flashpoint/flashpoint-launcher \$@" > "${pkgdir}/usr/bin/flashpoint-launcher"
	chmod -v 777 "${pkgdir}/usr/bin/flashpoint-launcher"
#	echo Linking launcher
#	mkdir -vp ${pkgdir}/usr/bin
#	ln -sv ${pkgdir}/opt/Flashpoint/flashpoint-launcher ${pkgdir}/usr/bin/

	echo "Fixing desktop file ..."
	desktop-file-edit "${pkgdir}/usr/share/applications/flashpoint-launcher.desktop" --set-key Categories --set-value "Game;"
	desktop-file-edit "${pkgdir}/usr/share/applications/flashpoint-launcher.desktop" --set-key Exec --set-value "/usr/bin/flashpoint-launcher"

#	install -dv ${pkgdir}/usr/share/licenses/
	echo "Installing Licenses..."
	mkdir -vp "${pkgdir}/usr/share/licenses/"
	cp -r "${pkgdir}/opt/Flashpoint/licenses/" "${pkgdir}/usr/share/licenses/Flashpoint"

#	echo Making config and preferences writable by all ...
#	touch "${pkgdir}/opt/Flashpoint/extConfig.json"
#	chmod 666 "${pkgdir}/opt/Flashpoint/extConfig.json"
#	touch "${pkgdir}/opt/Flashpoint/preferences.json"
#	chmod 666 "${pkgdir}/opt/Flashpoint/preferences.json"
#	touch "${pkgdir}/opt/Flashpoint/launcher.log"
#	chmod 666 "${pkgdir}/opt/Flashpoint/launcher.log"
	chmod -R 777 "${pkgdir}/opt/Flashpoint"
	#chmod -vR 777 "${pkgdir}/opt/Flashpoint/Data"

#	echo Installing data-files-installer ...
#	install -Dm755 ${srcdir}/flashpoint-install-data-files.sh ${pkgdir}/usr/bin/flashpoint-install-data-files
}
