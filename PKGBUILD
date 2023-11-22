pkgbase=overtone-wpc
pkgname=("${pkgbase}-plugins-bin")
pkgver=201904
pkgrel=5
arch=('x86_64')
url="https://www.overtonedsp.co.uk/"
pkgdesc="A Suite Of Mastering and Mixing VST Plugins for Linux"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('glibc' 'libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')

prepare () {
	## plugin AVA Plugins Archive
	_archive=`xdg-user-dir DOWNLOAD`/$pkgbase-RD${pkgver}.zip
	if [ -f ${_archive} ]; then
		ln -s ${_archive} $srcdir/$pkgbase-RD${pkgver}.zip
		cd $srcdir
		unzip $srcdir/$pkgbase-RD${pkgver}.zip
	else
		echo "Please download a copy from https://www.overtonedsp.co.uk/download/download_wpc/ Then put the `basename ${_archive}` in the `xdg-user-dir DOWNLOAD` directory"
	fi
}


package_overtone-wpc-plugins-bin() {
for plugin in AF210 AF210M DYN500 EQ500 FC70 PTC-2A PTM-5A RVB500
do
	cd $srcdir/OverToneWPC/$plugin/Linux
	tar -xvzf *.tar.gz
	install -Dm644 $plugin/READ* $pkgdir/usr/share/licenses/$pkgbase/EULA-$plugin.txt
	install -Dm644 $plugin/manual.pdf $pkgdir/usr/share/doc/$pkgbase/$plugin.pdf
	cd $plugin/x86-64
	tar -xvzf *.tar.gz
	cd */VST 
	install -Dm755 $plugin.so $pkgdir/usr/lib/vst/$plugin.so
done
}
