# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : Phil Schaf <flying-sheep(at)web.de>
# Contributor : Axel Navarro <navarroaxel at gmail>

pkgname=pycharm-community-eap
pkgver=233.11799.20
_pkgver=2023.3
_eap=y
pkgrel=2

epoch=14
pkgdesc='Powerful Python and Django IDE, Early Access Program (EAP) build, Community Edition'
arch=('i686' 'x86_64')
url=http://www.jetbrains.com/pycharm
license=('Apache')

makedepends=('cython' 'python-setuptools')
depends=('python' 'glib2' 'dbus' 'libdbusmenu-glib')
optdepends=('python2: Support for Python 2 language'
			'ipython: Alternative Python shell')

options=('!strip')

_filever="$([ $_eap = y ] && echo -n $pkgver || echo -n $_pkgver)"
source=("https://download.jetbrains.com/python/pycharm-community-$_filever.tar.gz"
        "pycharm-community-eap.desktop")
sha256sums=('279799ae9cd6194afc212349a327de52658e0ca5b53937115d14a638aef80fe1'
            '9f6dcb9b8647dbfa1c3d60f3e2b595bec62644bb75039621d185e7e5a18b7bd2')


prepare() {
	if [ -d "pycharm-community-$_pkgver" ]; then
		mv pycharm-community-{"$_pkgver","$pkgver"}
	fi

	cd "pycharm-community-$pkgver/bin"
	local _vmoptfile
	for _vmoptfile in pycharm{,64}.vmoptfile; do
		echo $'-Dawt.useSystemAAFontSettings=on\n-Dswing.aatext=true' >>"$_vmoptfile"
	done
	if [ "$CARCH" = i686 ]; then
		rm fsnotifier64 libdbm64.so
	fi
}

package() {
	install -dm755 "$pkgdir"/{opt,usr/{bin,share/pixmaps}}
	cp -R "pycharm-community-$pkgver" "$pkgdir/opt/$pkgname"

	local _vmoptfile=pycharm64
	if [[ "$CARCH" = i686 ]]; then
		rm -f "$pkgdir/opt/$pkgname/bin/libyjpagent-linux64.so"
		rm -f "$pkgdir/opt/$pkgname/bin/fsnotifier64"
		_vmoptfile=pycharm
	fi
	echo $'-Dawt.useSystemAAFontSettings=on\n-Dswing.aatext=true' >>"$pkgdir/opt/$pkgname/bin/$_vmoptfile.vmoptions"

	mkdir -p "${pkgdir}/usr/share/applications/"
	install -Dm644 "${startdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"

	ln -sf "/opt/$pkgname/bin/pycharm.png" "$pkgdir/usr/share/pixmaps/pycharm-community-eap.png"
	ln -s "/opt/${pkgname}/bin/pycharm.sh" "${pkgdir}/usr/bin/pycharm-community-eap"
}

# vim: ts=4 sw=4 noet ft=PKGBUILD:
