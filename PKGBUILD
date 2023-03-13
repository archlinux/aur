# Maintainer: cobalt <jpt@mail.ru>
pkgname=jamin-gtk2
pkgver=0.98.3
pkgrel=1
pkgdesc="A JACK Audio Connection Kit Audio Mastering interface"
arch=('i686' 'x86_64')
url="http://jamin.sourceforge.net/"
license=('GPL')
depends=('jack' 'libxml2' 'gtk2' 'swh-plugins' 'fftw' 'liblo')
makedepends=('perl-xml-parser' 'ladspa' 'cvs' 'intltool')
conflicts=('jamin' 'jamin-cvs')
provides=('jamin')
options=('!libtool')
install=${pkgname}.install
source=('typefix.patch')
md5sums=('a0a18224447f431503471b3dfe1b715c')

prepare(){
	LDFLAGS="-ldl"
	CFLAGS="-Wno-deprecated-declarations -Wno-pointer-sign -Wno-cpp -Wno-unused-but-set-variable -Wno-incompatible-pointer-types -Wno-unused-variable -fcommon"
	cd "$srcdir"
	msg ""
	msg ""
	msg "Connecting to svs server ..."
	msg ""
	msg "Press ENTER when asked for password"
	cvs -d:pserver:anonymous@jamin.cvs.sourceforge.net:/cvsroot/jamin login
	cvs -z3 -d:pserver:anonymous@jamin.cvs.sourceforge.net:/cvsroot/jamin co -P jamin

	cd ${srcdir}/jamin
	patch -p1 -i ../typefix.patch
}

build() {
	cd ${srcdir}/jamin
	LDFLAGS="-ldl"
	CFLAGS="-Wno-deprecated-declarations -Wno-pointer-sign -Wno-cpp -Wno-unused-but-set-variable -Wno-incompatible-pointer-types -Wno-unused-variable -fcommon"
	./autogen.sh --prefix=/usr --libdir=/usr/lib
	make
}

package() {
	cd ${srcdir}/jamin
	make DESTDIR=${pkgdir} install
}
