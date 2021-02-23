# Maintainer Alexander Mcmillan <linuxguy93@gmail.com>

pkgname=ava-plugins
pkgver=$(date +%Y%m%d)
pkgrel=1
pkgdesc="Harrison Consoles VST Plugin Suite."
arch=('x86_64')
url="https://www.harrisonconsoles.com/site/ava-plugins.html"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('glibc' 'libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')

prepare () {
	## Extract AVA Plugins Archive
	_archive=`xdg-user-dir DOWNLOAD`/Harrison-AVA-linux-64bit.tar.gz
	ln -srf ${_archive} "$srcdir/`basename ${_archive}`"
	tar -xvzf "$srcdir/`basename ${_archive}`"
}

package() {
	## Install Plugins
	for plugin in BF DS LegacyQ MC ME SC VF; do
		if [ -f $srcdir/Harrison_AVA/vst/AVA-$plugin.so ]; then
			install -Dm755 "$srcdir/Harrison_AVA/vst/AVA-$plugin.so" "$pkgdir/usr/lib/vst/AVA-$plugin.so"
		fi
	done

	## Install EULA
	install -Dm644 "$srcdir/Harrison_AVA/EULA.txt" "$pkgdir/usr/share/licenses/$pkgname/EULA.txt"

	## Where To Put License Files
	for license in bf ds legacyq mc me sc vf; do
		if [ -f `xdg-user-dir DOWNLOAD`/license_key_harrison_ava_$license.txt ]; then
			install -Dm644 "`xdg-user-dir DOWNLOAD`/license_key_harrison_ava_$license.txt" "$pkgdir/usr/local/share/license_key_harrison_ava_$license.txt"
		else
			echo "Please put license_key_harrison_ava_$license.txt in the `xdg-user-dir DOWNLOAD` directory in order to activate AVA ${license^^} plugin."
		fi
	done
}
