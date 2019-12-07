pkgname=pycharm-community-eap
_buildver=193.5662.18
_pkgver=2019.3.1
_eap=y
pkgver=$_pkgver.$_buildver
pkgrel=1
epoch=5
pkgdesc='Powerful Python and Django IDE, Early Access Program (EAP) build. Community edition.'
arch=(any)
options=('!strip')
url='http://www.jetbrains.com/pycharm/'
license=(Apache)
depends=(libdbusmenu-glib)
makedepends=(python-setuptools python2-setuptools)
provides=(pycharm-community-edition)
conflicts=(pycharm-community-edition)
if [[ $_eap = y ]]; then
    _filever=$_buildver
else
    _filever=$_pkgver
fi
source=("https://download.jetbrains.com/python/pycharm-community-$_filever.tar.gz")
sha256sums=($(curl -s "https://download.jetbrains.com/python/pycharm-community-$_filever.tar.gz.sha256" | cut -d' ' -f1))
prepare() {
	if [[ -d $srcdir/pycharm-community-${_pkgver} ]]; then
		mv $srcdir/pycharm-community-${_pkgver} $srcdir/pycharm-community-${_buildver}
	fi
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
	cd "pycharm-community-$_buildver/plugins/python-ce/helpers/pydev/"

	# use absolute paths to the python executables so that users with an activated
	# virtual environment (like e.g. anaconda) can build without issues
	/usr/bin/python2 "./setup_cython.py" build_ext --inplace
	/usr/bin/python3 "./setup_cython.py" build_ext --inplace
}

package() {
	mkdir -p "$pkgdir/opt/$pkgname"
	cp -R "pycharm-community-$_buildver/"* "$pkgdir/opt/$pkgname/"

	local _vmoptfile=pycharm64
	if [[ $CARCH = 'i686' ]]; then
		rm -f "$pkgdir/opt/$pkgname/bin/libyjpagent-linux64.so"
		rm -f "$pkgdir/opt/$pkgname/bin/fsnotifier64"
		_vmoptfile=pycharm
	fi
	echo $'-Dawt.useSystemAAFontSettings=on\n-Dswing.aatext=true' >>"$pkgdir/opt/$pkgname/bin/$_vmoptfile.vmoptions"

	mkdir -p "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/bin/pycharm.sh" "$pkgdir/usr/bin/pycharm-ce"
	mkdir -p "$pkgdir/usr/share/pixmaps"
	ln -s "/opt/$pkgname/bin/pycharm.png" "$pkgdir/usr/share/pixmaps/pycharm.png"
	install -Dm755 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
