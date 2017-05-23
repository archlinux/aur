# Maintainer: Sum1 https://github.com/sum01
pkgname=('vcash-electron')
pkgver=0.31.3
pkgrel=1
pkgdesc="Vcash GUI bundled with the Vcash wallet."
arch=('x86_64')
url="https://github.com/whphhg/vcash-electron"
license=('GPL3' 'AGPL3') # AGPL3 is for vcash
depends=('nodejs' 'npm')
provides=('vcash=0.63.0')
conflicts=('vcash')
backup=('~/.Vcash/data/backups/' '~/.Vcash/data/blockchain/peer/' '~/.Vcash/data/config.dat' '~/.Vcash/data/wallet.dat' '~/.Vcash/data/peers.dat')
source=("https://github.com/whphhg/vcash-electron/releases/download/v$pkgver/Vcash-Electron-GUI-$pkgver-linux64.zip"
				"https://vcash.info/images/icon.png")
sha256sums=('d7b90bd349fe6be1e08d34d28b170c2c60a6e468c2c36ecfc44da7d3f6705453'
						'01193e677c3440c53b638d0ff92b6b5d208fe56a1024f2f1e850ea4941ffc1e4')

package() {
	# Changing permissions on necessary files
	cd $srcdir/linux-unpacked
	chmod a+x vcash-electron
	cd $srcdir/linux-unpacked/resources/app.asar.unpacked/bin
	chmod a+x vcashd-x64

	# Making folders
	mkdir -p $pkgdir/usr/{lib/$pkgname,share/applications}/

	# Making launch script and desktop shortcut
	cd $srcdir/
	touch $pkgname.sh
	echo '#!/bin/bash' > $pkgname.sh
	echo "cd /usr/lib/$pkgname/linux-unpacked" >> $pkgname.sh
	echo "./vcash-electron" >> $pkgname.sh
	touch $pkgname.desktop
	echo '[Desktop Entry]' > $pkgname.desktop
	echo 'Name=Vcash-electron' >> $pkgname.desktop
	echo "Comment=Vcash wallet GUI" >> $pkgname.desktop
	echo "Exec=sh /usr/lib/$pkgname/$pkgname.sh" >> $pkgname.desktop
	echo "Icon=/usr/lib/$pkgname/icon.png" >> $pkgname.desktop
	echo 'Terminal=false' >> $pkgname.desktop
	echo 'Type=Application' >> $pkgname.desktop
	echo 'Categories=Internet;Currency;' >> $pkgname.desktop

	# Placing files
	cp -r $srcdir/linux-unpacked $pkgdir/usr/lib/$pkgname
	cp $srcdir/$pkgname.desktop $pkgdir/usr/share/applications
	cp $srcdir/$pkgname.sh $pkgdir/usr/lib/$pkgname
	cp $srcdir/icon.png $pkgdir/usr/lib/$pkgname
}
