# Contributor: Sapphira Armageddos <shadowkyogre.public+aur@gmail.com>
pkgname=magicseteditor
pkgver=2.0.0
pkgrel=11
pkgdesc="A program to help create Magic: the Gathering cards and sets. Comes with no game support."
arch=('i686' 'x86_64')
url="http://magicseteditor.sourceforge.net"
license=('GPL')
depends=('hunspell' 'libjpeg' 'wxgtk2.8' 'boost-libs')
makedepends=('boost' 'unzip' 'pkg-config' 'svn')
provides=("magicseteditor=${pkgver}")
conflicts=('magicseteditor-bin' 'magicseteditor-svn' 'mse2' 'magicseteditor-xyz-mod')
source=("mse-${pkgver}::svn+https://magicseteditor.svn.sourceforge.net/svnroot/magicseteditor/tags/releases/mse-${pkgver}#")
install=$pkgname.install
options=(!strip)
md5sums=(SKIP)

build() {
	cd "$srcdir/mse-${pkgver}"
	./configure --prefix=/usr --with-wx-config=/usr/bin/wx-config-2.8
	#sed -e 's|^\(AM_LDFLAGS = .*\),--as-needed|\1,-Bsymbolic-functions|' -i Makefile
	make LIBS="-lboost_system $(pkg-config --libs hunspell) $(wx-config-2.8 --libs)" \
		CPPFLAGS="-I/usr/include/hunspell -fpermissive" || return 1

}

package()
{
	cd "$srcdir/mse-${pkgver}"
	make DESTDIR=$pkgdir install || return 1
	mkdir -p $pkgdir/usr/share/magicseteditor/{resource,data}
	cp -r ./data/*.mse-locale $pkgdir/usr/share/magicseteditor/data
	cp -r ./src/resource/common/* $pkgdir/usr/share/magicseteditor/resource
	cp -r ./src/resource/msw/other/* $pkgdir/usr/share/magicseteditor/resource
	cp -r ./src/resource/msw/{cursor,icon,tool} $pkgdir/usr/share/magicseteditor/resource
	rm -rf $pkgdir/usr/share/magicseteditor/resource/{cursor,icon,tool}/.svn
	rm -rf $pkgdir/usr/share/magicseteditor/data/.svn
	rm -rf $pkgdir/usr/share/magicseteditor/data/*/.svn
}

# vim:set ts=2 sw=2 et:
