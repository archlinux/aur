# Maintainer: Joel <aullidolunar at(@@) gmai1 (.dot.) c0m>

_pkgname=xchm
pkgname=${_pkgname}-wx3
pkgver=1.23
pkgrel=1
pkgdesc="A cross-platform GUI front-end to chmlib (wxWidgets 3.0 version)"
arch=('i686' 'x86_64')
url="http://xchm.sourceforge.net/index.html"
license=('GPL3')
depends=('wxgtk' 'chmlib')
makedepends=('git')
conflicts=('xchm')
provides=('xchm')
install=${_pkgname}.install
source=('xchm.desktop' 'xchm.xml')
md5sums=('e0dc147b88ea9736c3c3ab6797585c4a' '4102b0a393f5c60236143cc034664dd0')

prepare () {
	msg "Connecting to GIT server..."
	if [ -d $srcdir/xchm-code ]; then
		cd $srcdir/xchm-code && git pull origin
		msg "The local files are updated."
	else
		git clone git://git.code.sf.net/p/xchm/code xchm-code
	fi
	msg "GIT checkout done or server timeout"
}

build() {
	cd "$srcdir/xchm-code"
	# we need this, for reasons...
	autoreconf -fvi
	# until g++ is fixed, we need -Wno-deprecated-declarations to avoid the warnings
	export CXXFLAGS="${CXXFLAGS} -fno-strict-aliasing -Wno-deprecated-declarations"
	./configure --prefix=/usr --with-wx-config=wx-config
	make
}

package() {
	cd "$srcdir/xchm-code"
	make DESTDIR="${pkgdir}/" install
	# want to add your locale string for the desktop? Contact me.
	install -D -m644 ${srcdir}/xchm.desktop "${pkgdir}/usr/share/applications/xchm.desktop"
	install -D -m644 ${srcdir}/xchm.xml "${pkgdir}/usr/share/mime/packages/xchm.xml"
}
