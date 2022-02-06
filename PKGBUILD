# Maintainer: LeSnake <dev.lesnake@posteo.de>

pkgname=flashpoint-launcher-bin
pkgver=10.1.1
pkgrel=4
pkgdesc="Launcher for BlueMaxima's Flashpoint"
arch=('x86_64')
url="https://github.com/FlashpointProject/launcher"
license=('MIT')
depends=('nss>=3.0'
		'php'
		'gtk3'
		'libxss'
		'wine'
		'qemu'
		'qemu-arch-extra'
		'p7zip'
		'wget')
makedepends=('desktop-file-utils')
optdepends=('flashplayer-standalone: native Flash support')
conflicts=('flashpoint-bin' 'flashpoint-launcher-git')
source=("https://github.com/FlashpointProject/launcher/releases/download/${pkgver}/Flashpoint-${pkgver}_linux-amd64.deb"
		"https://github.com/LeSnake04/aur-lesnake04-sources/raw/main/flashpoint-data-files-installer/flashpoint-install-data-files.sh")
sha512sums=('dccc405a8f059887ef5f49b94a94e00e7bd87bf6f12922ffdac301d8339ffe96f482fab53d822cd47c222e5ad4151e8abbc832615525939770229d155c21dd78'
			'0435c1f89439eaf08b8f72d4465a62cae4599335afe36c365327262bc6e9663215f026f33f0e41b6ce183280cd304484b07fd6d703e21bbc74d2870c629964cf')

package(){
	echo Extracting package data ...
	tar xf data.tar.xz -C ${pkgdir} -v

	echo Symlink to binary ...
	install -d $pkgdir/usr/bin/
	ln -sfv /opt/Flashpoint/flashpoint-launcher $pkgdir/usr/bin/flashpoint-launcher

	echo Fixing desktop file ...
	desktop-file-edit $pkgdir/usr/share/applications/flashpoint-launcher.desktop --set-key Path --set-value "~/.local/share/flashpoint"

	echo Installing License ...
	install -dv $pkgdir/usr/share/licenses/
	cp -rv $pkgdir/opt/Flashpoint/licenses/ $pkgdir/usr/share/licenses/Flashpoint

	echo Making config and preferences writable by all ...
	touch "${pkgdir}/opt/Flashpoint/config.json"
	chmod 666 "${pkgdir}/opt/Flashpoint/config.json"
	touch "${pkgdir}/opt/Flashpoint/preferences.json"
	chmod 666 "${pkgdir}/opt/Flashpoint/preferences.json"
	touch "${pkgdir}/opt/Flashpoint/launcher.log"
	chmod 666 "${pkgdir}/opt/Flashpoint/launcher.log"

	echo Installing data-files-installer ...
	install -Dm755 $srcdir/flashpoint-install-data-files.sh $pkgdir/usr/bin/flashpoint-install-data-files
}
