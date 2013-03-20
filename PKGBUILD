# Maintainer: meklu <meklu at meklu dot org>
# Contributor: Samsagax <samsagax at gmail dot com>
# Contributor: Swift Geek <swiftgeek+spam@gmail.com>

pkgname=entrance-svn
pkgver=74295
pkgrel=1
pkgdesc="Successor of the e17 display manager - Entrance"
url="http://trac.enlightenment.org/e"
license=("GPL")
arch=("i686" "x86_64")
provides=('entrance')
conflicts=('elsa')
depends=('elementary')
makedepends=('subversion')
source=('entrance-pam'
	'entrance.service')
md5sums=('9a76cae5b3a0fcbb6116fa08c7a587b5'
	 'a10831272be5d65d40d9f7b5b03361b1')

_svntrunk="http://svn.enlightenment.org/svn/e/trunk/PROTO/entrance/"
_svnmod="entrance"

build ()
{
	cd $srcdir

	msg "Connecting to $_svntrunk SVN server...."
	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	rm -rf $_svnmod-build
	cp -r $_svnmod $_svnmod-build
	cd $_svnmod-build
	
    ./autogen.sh \
        --prefix=/usr \
        --sysconfdir=/etc
	
    make

}

package() {
    cd $srcdir/$_svnmod-build

    make DESTDIR=$pkgdir install

    # install license files
    install -Dm644 $srcdir/$_svnmod-build/COPYING \
        $pkgdir/usr/share/licenses/$pkgname/COPYING

    # install pam file
    install -Dm644 $srcdir/entrance-pam \
        $pkgdir/etc/pam.d/entrance

    # install systemd files
    install -Dm644 $srcdir/entrance.service \
        $pkgdir/usr/lib/systemd/system/entrance.service
}
