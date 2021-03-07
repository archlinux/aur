# Maintainer Alexander Mcmillan <linuxguy93@gmail.com>

pkgname=harrison-xt
pkgver=6.2.407
pkgrel=1
pkgdesc="Harrison Consoles LV2 XT Plugin Suite."
arch=('x86_64')
url="https://harrisonconsoles.com/mixbus-plugins/"
license=('EULA')
groups=('pro-audio' 'lv2-plugins')
depends=('glibc' 'libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')

## Variables
_archive=`xdg-user-dir DOWNLOAD`/Mixbus-${pkgver}-Linux-64bit-gcc5
_installer="Mixbus-${pkgver}-x86_64-gcc5"
_app="Mixbus_x86_64-$pkgver"

prepare () {
	## Extract Harrison Plugins Archive
	ln -srf ${_archive}.tar "$srcdir/`basename ${_archive}`.tar"
	tar -xvf "$srcdir/`basename ${_archive}`.tar"
	sh "$srcdir/`basename ${_installer}`.run" --tar xvf
	tar -xvf "$srcdir/`basename ${_app}`.tar"
}

package() {
	## Install LV2 Plugins
	mkdir -p $pkgdir/usr/lib/lv2/
	cp -r "$srcdir/`basename ${_app}`/lib/LV2/Harrison.lv2" $pkgdir/usr/lib/lv2/

	## Where To Put License Files
	for _license in xt_3d xt_bc xt_dc xt_dm xt_ds xt_eg xt_eq xt_gv xt_lc xt_mc xt_me xt_mg xt_sc xt_sp xt_tg xt_tp xt_vc; do
		if [ -f `xdg-user-dir DOWNLOAD`/license_key_harrison_${_license}.txt ]; then
			install -Dm644 "`xdg-user-dir DOWNLOAD`/license_key_harrison_${_license}.txt" "$pkgdir/usr/local/share/license_key_harrison_${_license}.txt"
		else
			echo "Please put license_key_harrison_${_license}.txt in the `xdg-user-dir DOWNLOAD` directory in order to activate XT ${_license^^} plugin."
		fi
	done
}
