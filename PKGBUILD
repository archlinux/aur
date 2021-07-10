# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor : Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Eric Forgeot < http://esclinux.tk >

pkgname=phlipple-svn
pkgver=0.8.6.r15
pkgrel=2
pkgdesc="A puzzle game which goal is to reduce a 3D shape to a single square. Elimination of squares is done by flipping edges around just like in a cardboard box."
arch=("i686" "x86_64" "aarch64")
url="http://sourceforge.net/projects/phlipple/"
license=('GPL')
depends=('mesa' 'sdl' 'sdl_mixer' 'sdl_image' 'glew')
makedepends=('subversion')
provides=("phlipple")
conflicts=("phlipple")
source=("phlipple::svn://svn.code.sf.net/p/phlipple/code/trunk"
        'engine.h.patch')
sha256sums=('SKIP'
            'a103d6f139bd246c45f2b62e8f5689eceea3af49521071e1a4f1167053a42a52')

pkgver() {
	cd "$srcdir/${pkgname%-*}"
	local ver="$(svnversion)"
	conf_ver=`sed -n 's/)$//g;s/^AC_INIT(phlipple, //p' configure.ac`
	printf "${conf_ver:0:5}.r%s" "${ver//[[:alpha:]]}"
}

prepare() {
	cd "$srcdir/${pkgname%-*}"
	patch -Np1 -i "${srcdir}/engine.h.patch"
}

build() {
	cd "$srcdir/${pkgname%-*}"
	./configure --prefix="/usr"
	make
}

package() {
	cd "$srcdir/${pkgname%-*}"
	make DESTDIR="${pkgdir}" install
}
