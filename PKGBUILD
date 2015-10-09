# Maintainer: ssf <punx69 at gmx dot net>

pkgname=kvantum-tools-qt5-svn
pkgver=r162
pkgrel=1
pkgdesc="Kvantum config tools build against Qt5"
arch=('i686' 'x86_64')
groups=('Qt-Style-Kvantum')
url="https://github.com/tsujan/Kvantum"
license=("GPL3")
depends=('qt5-base' 'libxext')
makedepends=('subversion' 'make' 'gawk' 'grep' 'sed' 'findutils')
optdepends=('qt5-style-kvantum-svn: An SVG theme engine for Qt5' 'qt4-style-kvantum-svn: An SVG theme engine for Qt4' 'kvantum-kde4-colorscheme-svn: Kvantum colorscheme for KDE4')
conflicts=('kdestyle-kvantum-kde4' 'kdestyle-kvantum-kde4-git' 'kvantum-tools-qt4-svn')
provides=("kvantum-tools-qt5=${pkgver}")
_svntrunk=https://github.com/tsujan/Kvantum/trunk/Kvantum
_svnmod="$pkgname"

pkgver() {
	svn log $_svntrunk --config-dir "$srcdir"|awk 'NR==2 {print $1}'
}

build() {
	cd "$srcdir"
	msg "Connecting to SVN server...."
	if [ -d "$_svnmod/.svn" ]; then
		(
		cd "$_svnmod"
		svn status --config-dir "$srcdir" --no-ignore|grep -E '(^\?)|(^\I)|(^\M)'|sed -e 's/^. *//'|sed -e 's/\(.*\)/"\1"/'|xargs rm -drf
		svn up . --config-dir "$srcdir"
		)
	else
		svn co "$_svntrunk" --config-dir "$srcdir" "$_svnmod"
	fi
	msg "SVN checkout done or server timeout"
	cd "$_svnmod"/kvantumpreview
	qmake-qt5
	make
	cd ../kvantummanager
	qmake-qt5
	make
}

package() {
	install -Dm0755 $srcdir/$pkgname/kvantumpreview/kvantumpreview $pkgdir/usr/bin/kvantumpreview
	install -Dm0755 $srcdir/$pkgname/kvantummanager/kvantummanager $pkgdir/usr/bin/kvantummanager
	install -Dm0644 $srcdir/$pkgname/kvantummanager/data/kvantummanager.desktop $pkgdir/usr/share/applications/kvantummanager.desktop
	install -Dm0644 $srcdir/$pkgname/kvantumpreview/kvantum.svg $pkgdir/usr/share/pixmaps/kvantum.svg
}
