# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Librewish <librewish@gmail.com?
# Contributer: Dan Johansen <strit@manjaro.org>

pkgbase=greetd-qtgreet-git
pkgname=('greetd-qtgreet-qt5-git' 'greetd-qtgreet-qt6-git')
_pkg="${pkgbase%-git}"
pkgver=1.0.0.r50.gb2c7e7c
pkgrel=1
pkgdesc='Qt based greeter for greetd'
arch=('aarch64' 'x86_64')
url="https://gitlab.com/marcusbritanicus/QtGreet"
license=('GPL3')
makedepends=(
	'dfl-applications'
	'dfl-applications-qt6'
	'dfl-ipc'
	'dfl-ipc-qt6'
	'dfl-login1-git'
	'dfl-login1-qt6-git'
	'dfl-utils'
	'dfl-utils-qt6'
	'dfl-wayqt'
	'dfl-wayqt-qt6'
	'git'
	'meson'
	'qt5-base'
	'qt5-wayland'
	'qt6-base'
	'qt6-wayland'
	'wlroots')
source=("$_pkg::git+$url"
        'qtgreet.tmpfiles')
sha256sums=('SKIP'
            '5a921d96c68cf981e7ea6e24e6acf05418010f880607178aee910368c1067c01')

pkgver() {
	git -C "$_pkg" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	cp -a "$_pkg" "$_pkg-qt6"
}

build() {
	arch-meson -Duse_qt_version=qt5 -Dnodynpath=true "$_pkg" build
	arch-meson -Duse_qt_version=qt6 -Dnodynpath=true "$_pkg-qt6" _build
	echo ':: Building QT5 version'
	meson compile -C build
	echo ':: Building QT6 version'
	meson compile -C _build
}

package_greetd-qtgreet-qt5-git() {
	depends=(
		'dfl-applications'
		'dfl-ipc'
		'dfl-login1'
		'dfl-utils'
		'dfl-wayqt'
		'greetd'
		'qt5-base'
		'qt5-wayland')
	provides=("${pkgbase%-git}")
	conflicts=("${pkgbase%-git}")
	meson install -C build --destdir="$pkgdir"
	install -Dvm644 qtgreet.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/qtgreet.conf"
}

package_greetd-qtgreet-qt6-git() {
	depends=(
		'dfl-applications-qt6'
		'dfl-ipc-qt6'
		'dfl-login1-qt6'
		'dfl-utils-qt6'
		'dfl-wayqt-qt6'
		'greetd'
		'qt6-base'
		'qt6-wayland')
	provides=("${pkgbase%-git}")
	conflicts=("${pkgbase%-git}")
	meson install -C _build --destdir="$pkgdir"
	install -Dvm644 qtgreet.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/qtgreet.conf"
}
