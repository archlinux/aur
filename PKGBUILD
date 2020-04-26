# Maintainer Alexander Mcmillan <linuxguy93@gmail.com>

pkgname=ava-plugins
pkgver=3.0.0
pkgrel=4
pkgdesc="Harrison Consoles VST Plugin Suite."
arch=('x86_64')
url="https://www.harrisonconsoles.com/site/ava-plugins.html"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('glibc' 'libcurl-gnutls')

prepare () {
	## Extract AVA Plugins Archive
	_archive=`xdg-user-dir DOWNLOAD`/Harrison-AVA-linux-64bit.tar.gz
	if [ -f ${_archive} ]; then
		ln -srf ${_archive} "$srcdir/`basename ${_archive}`"
		tar -xvzf Harrison-AVA-linux-64bit.tar.gz
	else
		echo "Please download a copy from https://harrisonconsoles.com/site/ava-plugins.html. Then put the `basename ${_archive}` in the `xdg-user-dir DOWNLOAD` directory."
	fi
}

package() {
	## Install Plugins
	for plugin in DS LegacyQ MC ME SC; do
		if [ -f $srcdir/Harrison_AVA/vst/AVA-$plugin.so ]; then
			install -Dm644 "$srcdir/Harrison_AVA/vst/AVA-$plugin.so" "$pkgdir/usr/lib/vst/AVA-$plugin.so"
		fi
	done

	## Install EULA
	install -Dm644 "$srcdir/Harrison_AVA/EULA.txt" "$pkgdir/usr/share/licenses/$pkgname/EULA.txt"

	## Where To Put License Files
	msg2 "Put AVA plugin licenses in ${HOME} to unlock them."
}
