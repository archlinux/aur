# Maintainer: Ivy Foster <ivy.foster@gmail.com>

pkgbase='frotz-git'
pkgname=('frotz-ncurses-git' 'frotz-dumb-git')
pkgver=2.44.r33.ga98137e
pkgrel=1
pkgdesc='Z-machine interpreter for interactive fiction games'

conflicts=('frotz')
replaces=('frotz')

arch=('i686' 'x86_64')
url='http://frotz.sourceforge.net/'
license=('GPL')
source=('git+https://github.com/DavidGriffith/frotz')
md5sums=('SKIP')

pkgver() {
	cd frotz
	git describe | sed 's,-\(.*\)-,.r\1.,'
}

prepare() {
	cd frotz
	sed '/^PREFIX/ s:/usr/local:/usr:
		/^CONFIG_DIR = $(PREFIX)/ s/^/#/
		/^CONFIG_DIR/ s:/usr/local::
		/^CURSES/ s/-lcurses/-lncurses/
		/^#CURSES_DEF/ s/^#//' \
		-i Makefile
}

build() {
	cd frotz
	make OPTS="$CFLAGS $LDFLAGS"
	make OPTS="$CFLAGS $LDFLAGS" dumb 
}

package_frotz-ncurses-git() {
	depends=('ncurses')

	cd frotz
	make DESTDIR="$pkgdir" install
}

package_frotz-dumb-git() {
	cd frotz
	make DESTDIR="$pkgdir" install_dumb
}
