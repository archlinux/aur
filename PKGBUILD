# Contributor: Andreas Boehler <andy dot boehler at gmx dot at>
# Maintainer: Olivier Mehani <shtrom-aur@ssji.net>
# Contributor: Frederik "Freso" S. Olesen <freso.dk@gmail.com>

_gitname=mbm-gps-control
pkgname="${_gitname}-git"
pkgver=r16.1d2fee0
pkgrel=1
pkgdesc="Graphical interface to mbm-gpsd"
arch=('i686' 'x86_64')
url="http://mbm.sourceforge.net/"
license=('GPL')
depends=('networkmanager' 'network-manager-applet' 'intltool')
makedepends=('git')
provides=("${_gitname}")
source=(
"${_gitname}::git://mbm.git.sourceforge.net/gitroot/mbm/${_gitname}/"
0001-Remove-call-to-g_type_init.patch
)
md5sums=('SKIP'
         '0b32f46bcd6616c7288a392f183f011a')

pkgver() {
	cd "$srcdir/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_gitname"
	git am "$srcdir/0001-Remove-call-to-g_type_init.patch"
}

build() {
	cd "$srcdir/$_gitname"
	unset CFLAGS
	unset CXXFLAGS
	./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var
	make
}

package() {
	cd "$srcdir/$_gitname"
	make DESTDIR="$pkgdir" install
}
