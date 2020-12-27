# Maintainer: Matthias Jaros <jaros@mailbox.org>
# Contributor: Alberto Salvia Novella <es20490446e@gmail.com>
pkgname=qsyncthingtray-git
pkgver=0.5.8.r17.g11936bc
pkgrel=4
pkgdesc="Tray icon for syncthing (master branch)"
arch=('i686' 'x86_64')
url="https://github.com/sieren/QSyncthingTray"
license=('LGPL3.0')
groups=()
depends=('qt5-location' 'qt5-webengine' 'syncthing')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("qsyncthingtray")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://github.com/sieren/QSyncthingTray.git"
 "${pkgname%-git}.desktop")
noextract=()
md5sums=('SKIP'
         '730d2ae862656d39f7b1980f20d8d8bf')
_pkgname=QSyncthingTray

pkgver() {
	cd "$srcdir/${pkgname%-git}"
    git describe --long --tag 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	[ -d build ] || mkdir build 
}

build() {
	cd "$srcdir/${pkgname%-git}/build"
	QTDIR=/usr/lib/qt cmake ..
	make
}

check() {
	cd "$srcdir/${pkgname%-git}/build"
	[ -f "$_pkgname" ] || exit 1
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 "build/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	
	# install .desktop file
	install -Dm755 "$srcdir/${pkgname%-git}.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
	install -Dm755 "resources/images/Icon1024.png" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
}