pkgname=pycharm-community-eap
_buildver=183.4886.18
_pkgver=2018.3.2
pkgver=$_pkgver.$_buildver
pkgrel=1
epoch=2
pkgdesc='Powerful Python and Django IDE, Early Access Program (EAP) build. Community edition.'
arch=(any)
options=('!strip')
url='http://www.jetbrains.com/pycharm/'
license=(Apache)
depends=(java-environment libdbusmenu-glib)
provides=(pycharm-community-edition)
conflicts=(pycharm-community-edition)
source=("https://download.jetbrains.com/python/pycharm-community-$_buildver.tar.gz"{,.sha256})
sha256sums=($(cut -f1 -d' ' "pycharm-community-$_buildver.tar.gz.sha256") SKIP)
PKGEXT=${PKGEXT:-'.pkg.tar'}

build() {
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

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir/opt/$pkgname"
	cp -R "$srcdir/pycharm-community-$_pkgver/"* "$pkgdir/opt/$pkgname"

	local vmoptfile=pycharm64
	if [[ $CARCH = 'i686' ]]; then
		rm -f "$pkgdir/opt/$pkgname/bin/libyjpagent-linux64.so"
		rm -f "$pkgdir/opt/$pkgname/bin/fsnotifier64"
		vmoptfile=pycharm
	fi
	echo $'-Dawt.useSystemAAFontSettings=on\n-Dswing.aatext=true' >>"$pkgdir/opt/$pkgname/bin/$vmoptfile.vmoptions"

	mkdir -p "$pkgdir/usr/bin/"
	ln -s "/opt/$pkgname/bin/pycharm.sh" "$pkgdir/usr/bin/pycharm-eap"
	mkdir -p "$pkgdir/usr/share/pixmaps"
	ln -s "/opt/$pkgname/bin/pycharm.png" "$pkgdir/usr/share/pixmaps/pycharm.png"
	install -Dm755 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
