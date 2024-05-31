# Maintainer: Stuart Reilly <stu@reilly-family.co.uk>
pkgname=dsda-launcher-git
pkgver=v1.3.1.hotfix.r54.73f94ed
pkgrel=2
pkgdesc="Launcher GUI for the dsda-doom source port"
arch=('x86_64')
url="https://github.com/Pedro-Beirao/dsda-launcher"
license=('GPL-3.0-only')
groups=()
depends=('dsda-doom' 'qt6-base' 'glibc' 'gcc-libs')
makedepends=('git' 'qt6-base')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/Pedro-Beirao/dsda-launcher')
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	sed -i 's#/opt/$${TARGET}/bin#/usr/bin#g' src/${pkgname%-git}.pro
}

build() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p build
	cd build
	qmake6 QMAKE_CFLAGS="${CFLAGS}" QMAKE_CXXFLAGS="${CXXFLAGS}" QMAKE_LFLAGS="${LDFLAGS}" ../src
	make
}

check() {
	cd "$srcdir/${pkgname%-git}/build"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
	make INSTALL_ROOT="$pkgdir" install
}
