pkgname=overtone-wpc
pkgver=201904
pkgrel=2
pkgdesc="OvertoneDSP Workstation Plugin Suite"
arch=('x86_64')
url="https://www.overtonedsp.co.uk/download/download_wpc/"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('glibc' 'libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')

prepare () {
	## plugin AVA Plugins Archive
	_archive=`xdg-user-dir DOWNLOAD`/$pkgname-RD${pkgver}.zip
	_archive_licenses=`xdg-user-dir DOWNLOAD`/$pkgname-serial.zip
	if [ -f ${_archive} ]; then
		ln -s ${_archive} $srcdir/$pkgname-RD${pkgver}.zip
	else
		echo "Please download a copy from https://www.overtonedsp.co.uk/download/download_wpc/ Then put the `basename ${_archive}` in the `xdg-user-dir DOWNLOAD` directory"
	fi
}

package() {
	## Unzip Archive
	cd $srcdir
	unzip $srcdir/$pkgname-RD${pkgver}.zip
	
	## Install Plugins
	for plugin in AF210 AF210M DYN500 EQ500 FC70 PTC-2A PTM-5A RVB500; do
		cd $srcdir/OverToneWPC/$plugin/Linux
		tar -xvzf *.tar.gz
		install -Dm644 $plugin/READ* $pkgdir/usr/share/licenses/$pkgname/EULA-$plugin.txt
		install -Dm644 $plugin/manual.pdf $pkgdir/usr/share/doc/$pkgname/$plugin.pdf
		cd $plugin/x86-64
		tar -xvzf *.tar.gz
		cd */VST 
		install -Dm755 $plugin.so $pkgdir/usr/lib/vst/$plugin.so
	done
}
