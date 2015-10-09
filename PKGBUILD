# Maintainer: ssf <punx69 at gmx dot net>
pkgname=qt4-style-kvantum-svn
pkgver=r162
pkgrel=1
pkgdesc="An SVG theme engine for Qt4"
arch=('i686' 'x86_64')
groups=('Qt-Style-Kvantum')
url="https://github.com/tsujan/Kvantum"
license=("GPL3")
depends=('qt4' 'libxext')
makedepends=('subversion' 'make' 'gawk' 'grep' 'sed' 'findutils')
optdepends=('qt5-style-kvantum-svn: An SVG theme engine for Qt5' 'kvantum-tools-qt4-svn: Kvantum config tools for Qt4' 'kvantum-tools-qt5-svn: Kvantum config tools for Qt5' 'kvantum-kde4-colorscheme-svn: Kvantum colorscheme for KDE4')
conflicts=('kdestyle-kvantum-kde4' 'kdestyle-kvantum-kde4-git')
provides=("qt4-style-kvantum=${pkgver}")
_svntrunk=https://github.com/tsujan/Kvantum/trunk/Kvantum/style
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
	cd "$srcdir"/"$_svnmod"
	qmake-qt4
	make
}

package() {
	install -Dm0644 $srcdir/$pkgname/libkvantum.so $pkgdir/usr/lib/qt4/plugins/styles/libkvantum.so
}
