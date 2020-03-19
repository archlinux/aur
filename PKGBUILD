# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : Phil Schaf <flying-sheep(at)web.de>


pkgname=pycharm-community-eap

_buildver=201.6487.18
_pkgver=2020.1
_eap=y
pkgver="$_pkgver.$_buildver"
pkgrel=1
epoch=5

pkgdesc='Powerful Python and Django IDE, Early Access Program (EAP) build. Community edition.'
arch=('any')
url=http://www.jetbrains.com/pycharm/
license=('Apache')

provides=('pycharm-community-edition')
conflicts=('pycharm-community-edition')

makedepends=('python-setuptools' 'python2-setuptools')
depends=('libdbusmenu-glib')

options=('!strip')

if [ "$_eap = y" ]; then
    _filever="$_buildver"
else
    _filever="$_pkgver"
fi
source=("https://download.jetbrains.com/python/pycharm-community-$_filever.tar.gz")
# The website doesn't provide the checksum atm, so we hard code it in the PKGBUILD for the time being
sha256sums=($(curl -s "https://download.jetbrains.com/python/pycharm-community-$_filever.tar.gz.sha256" | cut -d' ' -f1))


prepare() {
	if [ -d "pycharm-community-$_pkgver" ]; then
		mv "pycharm-community-$_pkgver" "pycharm-community-$_buildver"
	fi
	cat >"$pkgname.desktop" <<-EOF
		[Desktop Entry]
		Version="$pkgver"
		Type=Application
		Name=PyCharm Community EAP
		Exec="/opt/$pkgname/bin/pycharm.sh" %f
		Icon=pycharm
		Comment="$pkgdesc"
		Categories=Development;IDE;
		Terminal=false
		StartupNotify=true
		StartupWMClass=jetbrains-pycharm-ce
	EOF
}

build() {
	cd "pycharm-community-$_buildver/plugins/python-ce/helpers/pydev/"

	# use absolute paths to the python executables so that users with an activated
	# virtual environment (like e.g. anaconda) can build without issues
	/usr/bin/python2 ./setup_cython.py build_ext --inplace
	/usr/bin/python3 ./setup_cython.py build_ext --inplace
}

package() {
	install -dm755 "$pkgdir"/{opt,usr/{bin,share/pixmaps}}
	cp -R "pycharm-community-$_buildver" "$pkgdir/opt/$pkgname"

	install -Dm755 "$pkgname.desktop" -t"$pkgdir/usr/share/applications/"
	ln -s "/opt/$pkgname/bin/pycharm.sh" "$pkgdir/usr/bin/pycharm-ce"
	ln -s "/opt/$pkgname/bin/pycharm.png" "$pkgdir/usr/share/pixmaps/"

	local _vmoptfile=pycharm64
	if [ "$CARCH" = i686 ]; then
		rm -f "$pkgdir/opt/$pkgname/bin/libyjpagent-linux64.so"
		rm -f "$pkgdir/opt/$pkgname/bin/fsnotifier64"
		_vmoptfile=pycharm
	fi
	echo $'-Dawt.useSystemAAFontSettings=on\n-Dswing.aatext=true' >>"$pkgdir/opt/$pkgname/bin/$_vmoptfile.vmoptions"
}


# vim: ts=4 sw=4 noet ft=PKGBUILD:
