pkgname=pycharm-community-eap
_buildver=191.5701.26
_pkgver=2019.1
_eap=y
pkgver=$_pkgver.$_buildver
pkgrel=1
epoch=2
pkgdesc='Powerful Python and Django IDE, Early Access Program (EAP) build. Community edition.'
arch=(any)
options=('!strip')
url='http://www.jetbrains.com/pycharm/'
license=(Apache)
depends=(java-environment libdbusmenu-glib)
makedepends=(python-setuptools python2-setuptools)
provides=(pycharm-community-edition)
conflicts=(pycharm-community-edition)
if [[ $_eap = y ]]; then
    _filever=$_buildver
else
    _filever=$_filever
fi
source=("https://download.jetbrains.com/python/pycharm-community-$_filever.tar.gz"{,.sha256})
sha256sums=($(cut -f1 -d' ' "pycharm-community-$_filever.tar.gz.sha256") SKIP)

prepare() {
	cat >"$srcdir/$pkgname.desktop" <<-EOF
		[Desktop Entry]
		Version=$pkgver
		Type=Application
		Name=PyCharm Community EAP
		Exec="/opt/$pkgname/bin/pycharm.sh" %f
		Icon=pycharm
		Comment=$pkgdesc
		Categories=Development;IDE;
		Terminal=false
		StartupNotify=true
		StartupWMClass=jetbrains-pycharm-ce
	EOF
}

build() {
	python2 "$srcdir/pycharm-community-$_filever/helpers/pydev/setup_cython.py" build_ext --inplace
	python3 "$srcdir/pycharm-community-$_filever/helpers/pydev/setup_cython.py" build_ext --inplace
}

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir/opt/$pkgname"
	cp -R "pycharm-community-$_filever/"* "$pkgdir/opt/$pkgname/"

	local _vmoptfile=pycharm64
	if [[ $CARCH = 'i686' ]]; then
		rm -f "$pkgdir/opt/$pkgname/bin/libyjpagent-linux64.so"
		rm -f "$pkgdir/opt/$pkgname/bin/fsnotifier64"
		_vmoptfile=pycharm
	fi
	echo $'-Dawt.useSystemAAFontSettings=on\n-Dswing.aatext=true' >>"$pkgdir/opt/$pkgname/bin/$_vmoptfile.vmoptions"

	mkdir -p "$pkgdir/usr/bin/"
	ln -s "/opt/$pkgname/bin/pycharm.sh" "$pkgdir/usr/bin/pycharm-eap"
	mkdir -p "$pkgdir/usr/share/pixmaps"
	ln -s "/opt/$pkgname/bin/pycharm.png" "$pkgdir/usr/share/pixmaps/pycharm.png"
	install -Dm755 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
