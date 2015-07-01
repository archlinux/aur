# Maintainer: Alain Kalker <a.c.kalker@gmail.com>
_pkgbase=chromiumos-ui
pkgname=$_pkgbase-bin
pkgver=LKGR
_pkgver=$(curl -s http://commondatastorage.googleapis.com/chromium-browser-snapshots/Linux_ChromiumOS/LAST_CHANGE)
pkgrel=3
pkgdesc="Chromium OS user interface (prebuilt binary)"
arch=('x86_64')
url="http://www.chromium.org/chromium-os"
license=('BSD')
depends=('chromium' 'libudev.so.0') # for chrome-sandbox
optdepends=('chromiumos-ui-tts: ChromeVox text-to-speech, with accessibility support')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
backup=("etc/$_pkgbase/default")
options=('!strip')
install=$_pkgbase.install
_srcname=chrome-linux
source=($_srcname-$_pkgver.zip::http://commondatastorage.googleapis.com/chromium-browser-snapshots/Linux_ChromiumOS/${_pkgver}/$_srcname.zip
		#https://chromium.googlesource.com/chromium/src/+/lkgr/LICENSE.chromium_os
		$_pkgbase.default
		$_pkgbase.desktop
		$_pkgbase.sh
		$_pkgbase-lastuser.desktop
		$_pkgbase-login.desktop)
noextract=()
md5sums=('SKIP'
#md5sums=('d5cc7c62fb8f8b4944685f220e252bbb'
         #'c1f986c9d625a1d64d2f6f2130ff7b51'
         '001a472621cace5c2e140df95c632af1'
         '0aa55e3947e85e3774bba3da274e09f8'
         '806bd9b2c2f8d80ddf74c49f8a778853'
         'bfd688d7d6e340df8e9296c8c40eb3a5'
         '3c1772e39cdd805fe3052e4938371afe')

pkgver() {
	echo $_pkgver
}

package() {
	cd "$srcdir/$_srcname"

	install -d "$pkgdir/usr/lib/$_pkgbase"
	cp -a * "$pkgdir/usr/lib/$_pkgbase/"

	# Fix permissions
	find "$pkgdir/usr/lib/$_pkgbase" -type d -exec chmod 755 {} ';'
	find "$pkgdir/usr/lib/$_pkgbase" -type f -exec chmod 644 {} ';'
	chmod 755 "$pkgdir/usr/lib/$_pkgbase"/chrome{,-*}
	chmod 755 "$pkgdir/usr/lib/$_pkgbase"/nacl*
	chmod 755 "$pkgdir/usr/lib/$_pkgbase"/xdg-settings
	chmod 755 "$pkgdir/usr/lib/$_pkgbase"/xdg-mime

	# Allow users to override command-line options
	install -Dm644 "$srcdir/$_pkgbase.default" "$pkgdir/etc/$_pkgbase/default"

	install -D "$srcdir/$_pkgbase.sh" \
		"$pkgdir/usr/bin/$_pkgbase"
	install -Dm644 "$srcdir/$_pkgbase.desktop" \
		"$pkgdir/usr/share/applications/$_pkgbase.desktop"
	install -Dm644 "$srcdir/$_pkgbase-login.desktop" \
		"$pkgdir/usr/share/applications/$_pkgbase-login.desktop"
	install -Dm644 "$srcdir/$_pkgbase-lastuser.desktop" \
		"$pkgdir/usr/share/applications/$_pkgbase-lastuser.desktop"

	#install -Dm644 "$srcdir/LICENSE.chromium_os" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.chromium_os"
}
