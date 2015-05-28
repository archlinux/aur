# Maintainer: Justin Dray <justin@dray.be>
# Contributor: Bill Kolokithas <kolokithas.b@gmail.com>

pkgname=j4-dmenu-desktop
pkgver=2.12
pkgrel=1
pkgdesc="A much faster replacement for i3-dmenu-desktop. It's purpose is to find .desktop files and offer you a menu to start an application using dmenu."
arch=('i686' 'x86_64')
url="https://github.com/enkore/j4-dmenu-desktop"
license=('GPL3')
depends=('dmenu')
makedepends=('git' 'cmake')
conflicts=('j4-dmenu-desktop-git')
source=("https://github.com/enkore/j4-dmenu-desktop/archive/r${pkgver}.zip")
md5sums=('52f023363f530908fe9612b1ada3a861')

prepare() {
	# Patch for issue #20; backported as it was not included for the 2.11 cut
	# Can probably be removed from v2.12 onwards
	sed -i '/include <string>/s/$/\n#include <functional>/' "$srcdir/j4-dmenu-desktop-r$pkgver/src/Formatters.hh"

	# Patch for issue #21; backported as it was not included for the 2.11 cut
	# Can probably be removed from v2.12 onwards
	sed -i '/endif(NOT DEFINED/s/^/\nadd_dependencies(j4-dmenu-tests catch)\n/' "$srcdir/j4-dmenu-desktop-r$pkgver/CMakeLists.txt"
}
build() {
	cd ${pkgname}-r${pkgver}
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd ${pkgname}-r${pkgver}
	make DESTDIR="$pkgdir/" install
}
