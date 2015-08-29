# $Id$
# Maintainer: Yamashita Ren
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=yakuake-l10n-fr-frameworks-svn
pkgver=latest
pkgrel=1
pkgdesc="French language pack for yakuake-frameworks"
arch=('any')
url='http://www.kde.org/'
license=('GPL')
makedepends=('extra-cmake-modules' 'imake')
conflicts=('yakuake-l10n-frameworks')
source=('yakuakefr.patch')
md5sums=('e160619ce319455fe90500c7351362f3')

prepare() {
	svn co -N svn://anonsvn.kde.org/home/kde/trunk/l10n-kf5 $srcdir/l10n
	cd $srcdir/l10n
	svn up scripts
	svn up fr
	./scripts/autogen.sh fr
	cd fr
	sed -i 's/^add_subdirectory/#add_subdirectory/g' CMakeLists.txt &&  sed -i 's/^#add_subdirectory(messages)/add_subdirectory(messages)/' CMakeLists.txt
	cd messages
	sed -i 's/^add_subdirectory/#add_subdirectory/g' CMakeLists.txt &&  sed -i 's/^#add_subdirectory(extragear-utils)/add_subdirectory(extragear-utils)/' CMakeLists.txt
	cd extragear-utils
	patch -i ../../../../yakuakefr.patch yakuake.po
}

build() {
	cd $srcdir/l10n
	mkdir build
	cd build
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ../fr
	make
}

package() {
	cd $srcdir/l10n
	cd build
	make DESTDIR="$pkgdir" install
}
