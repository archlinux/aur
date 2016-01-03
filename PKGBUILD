# Maintainer: SanskritFritz (gmail)

pkgname=erebus-git
_gitname="erebusrpg-code"
pkgver=v0.15.r70.g7fd7d1f
_stablever=0.15
pkgrel=1
epoch=2
pkgdesc="2D real-time role-playing game."
arch=('i686' 'x86_64')
url="http://erebusrpg.sourceforge.net/"
license=("GPLv3")
depends=('sfml')
makedepends=('qt4' 'git')
provides=('erebus')
conflicts=('erebus')
# Source zip is still needed, see erebus_source.txt
source=("$_gitname::git://git.code.sf.net/p/erebusrpg/code"
        "erebus-$_stablever::http://launchpad.net/erebus/trunk/$_stablever/+download/erebussrc.zip"
        "erebus.sh")

pkgver() {
	cd "$_gitname"
#	git log -1 --format="%cd" --date=short | sed 's|-|.|g'
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_gitname"
	rm -fr sound; mv -f "$srcdir/erebussrc/sound" .
	rm -fr music; mv -f "$srcdir/erebussrc/music" .
	
	qmake-qt4 erebus.pro
	make

}

package() {
	cd "$srcdir/$_gitname"
	make INSTALL_ROOT="$pkgdir" install
	mkdir --parents $pkgdir/usr/bin
	install -Dm755 "$srcdir/erebus.sh" "$pkgdir/usr/bin/erebus"
}

md5sums=('SKIP'
         '2beca3a679f904d57d24a65ae445a3d5'
         '408c07f7ccb7c8cb95e3c59a319c17e9')
