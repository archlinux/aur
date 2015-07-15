# Maintainer: Simone Tobia <simone.tobia at gmail dot com>
# Contributer: giacomogiorgianni@gmail.com 

pkgname=appset-qt-svn
_name=appset
pkgver=198
pkgrel=1
pkgdesc="An advanced and feature rich Package Manager Frontend"
arch=('i686' 'x86_64')
url="http://appset.svn.sourceforge.net/viewvc/appset/"
license=('GPL2')
depends=('qt4')
optdepends=('packer: for AUR support')
makedepends=('subversion')
conflicts=(appset-qt)
install=${pkgname}.install
changelog=$pkgname.changelog
#source=(http://sourceforge.net/projects/appset/files/appset-qt/0.7/0.7.2/appset-qt-0.7.2-sources.tar.gz)
#md5sums=()

_svntrunk=svn://svn.code.sf.net/p/appset/code/
_svnmod=appset-code

build() {
  #cd $srcdir/$pkgname-$pkgver-sources
  cd "$srcdir"

	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_svnmod-build"
	cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
	cd "$srcdir/$_svnmod"

	#
	# BUILD
	#
  qmake-qt4 PREFIX=/usr -Wnone

  #localization
  lrelease-qt4 Qt/AppSet-Qt/*.ts
  lrelease-qt4 Qt/AppSetTray-Qt/*.ts
  lrelease-qt4 Qt/AppSetRepoEditor-Qt/*.ts

  make || return 1
}

package() {
    cd $srcdir/$_svnmod

    make INSTALL_ROOT="$pkgdir/" install

    #helper daemon
    install -m 755 -d "$pkgdir/etc/rc.d" || return 1
    install -m 755 "$srcdir/$_name-code/AppSetHelper/appset-helper.sh" "$pkgdir/etc/rc.d/appset-helper"
}
