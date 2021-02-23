# Maintainer Alexander Mcmillan <linuxguy93@gmail.com>

pkgname=overtone-wpc
pkgver=201904
pkgrel=3
pkgdesc="OvertoneDSP Workstation Plugin Suite."
arch=('x86_64')
url="https://www.overtonedsp.co.uk/download/download_wpc/"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('glibc' 'libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')

prepare () {
	## plugin AVA Plugins Archive
	_archive=`xdg-user-dir DOWNLOAD`/$pkgname-RD${pkgver}.zip
	_archive_licenses=`xdg-user-dir DOWNLOAD`/wpc-serial.zip
	if [ -f ${_archive} ]; then
		ln -s ${_archive} $srcdir/$pkgname-RD${pkgver}.zip
	else
		echo "Please download a copy from https://www.overtonedsp.co.uk/download/download_wpc/ Then put the `basename ${_archive}` in the `xdg-user-dir DOWNLOAD` directory"
	fi
	if [ -f ${_archive_licenses} ]; then
		ln -s ${_archive_licenses} $srcdir/wpc-serial.zip
	else
		echo "Please buy a copy from https://www.overtonedsp.co.uk/download/download_wpc/ Then put the `basename ${_archive_licenses}` in the `xdg-user-dir DOWNLOAD` directory and rename it to wpc-serial.zip"
	fi
}

package() {
	## Unzip Archive
	cd $srcdir
	unzip $srcdir/$pkgname-RD${pkgver}.zip
	unzip $srcdir/wpc-serial.zip
	
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

	## License Files
	for _license in AF-210 DYN-500 EQ-500 PTC-2A PTM-5A RVB-500; do 
		if [ -f "$srcdir/license_key_${_license}" ]; then
			install -Dm644 "$srcdir/license_key_${_license}" "$pkgdir/usr/local/share/license_key_${_license}"
		else
			echo "Please put license_key_harrison_${_license}.txt in the `xdg-user-dir DOWNLOAD` directory in order to activate OvertoneDSP ${_license^^} plugin."
		fi
	done
}
