# Maintainer: Kamil Śliwak <cameel2/at/gmail/com>

pkgname=mdbtools-git
_gitname=mdbtools
pkgver=0.7.r184.g22b5b62
pkgrel=1
pkgdesc="A set of libraries and utilities for reading Microsoft Access database (MDB) files."
arch=('i686' 'x86_64')
url="https://github.com/brianb/mdbtools"
depends=('gnome-doc-utils')
makedepends=('git' 'txt2man')
provides=('mdbtools')
conflicts=('mdbtools')
license=('GPL')
source=(
	'git://github.com/brianb/mdbtools.git'
	'gnome-doc-utils-fix.diff'
)
md5sums=(
	'SKIP'
	'b441e5f2de56b9a339593d83c9516cf6'
)

pkgver() {
	cd $srcdir/$_gitname

	echo $(git describe --always | sed -r 's|([^-]*-g)|r\1|;s|-|.|g')
}

prepare() {
	cd $srcdir/$_gitname

	# A workaround for 'ENABLE_SK not defined' error. Does not seem to be fixed
	# in master yet. See https://github.com/brianb/mdbtools/issues/37
	patch $srcdir/$_gitname/configure.ac $startdir/gnome-doc-utils-fix.diff

	autoreconf --install --force
	./configure --prefix=/usr
}

build() {
	cd $srcdir/$_gitname

	make
}

package(){
	cd $srcdir/$_gitname

	make DESTDIR="$pkgdir" install
	install -Dm644 src/gmdb2/gmdb.desktop "$pkgdir"/usr/share/applications/gmdb.desktop
}
