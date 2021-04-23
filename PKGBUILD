# Maintainer: Waffle Lapkin <waffle.lapkin@gmail.com>
pkgname='anilibria-winmaclinux-git'
pkgver=r258.c2c280c
pkgrel=1
pkgdesc='AniLibria client for major desktop platforms'
arch=('x86_64')
url='https://github.com/anilibria/anilibria-winmaclinux'
license=('GPL3')
groups=()
depends=('qt5-webview' 'gst-libav' 'qt5-quickcontrols2' 'qt5-graphicaleffects' 'qt5-websockets' 'qt5-quickcontrols')
makedepends=('qt5-base' 'qt5-multimedia' 'qt5-svg' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/anilibria/anilibria-winmaclinux.git'
        '0001-Change-instalation-path-to-be-Arch-linux-friendly.patch'
        '0001-disable-version-check.patch'
        '0001-change-Exec-value-in-.desktop-file-to-match-archlinu.patch')
md5sums=('SKIP'
         '59290afaa86d49b8a1e8894032663c0d'
         'c8f887de1082f4e8ff46d8e253ec623e'
         '84b73c82d8240235096b278907443848')

pkgver() {
	cd "${pkgname%-git}"
	
	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch -p1 -i "$srcdir/0001-Change-instalation-path-to-be-Arch-linux-friendly.patch"
	patch -p1 -i "$srcdir/0001-disable-version-check.patch"
	patch -p1 -i "$srcdir/0001-change-Exec-value-in-.desktop-file-to-match-archlinu.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}/src"
	#./autogen.sh
	#./configure --prefix=/usr
	qmake PREFIX=/usr
	make
}

check() {
	cd "$srcdir/${pkgname%-git}/src"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}/src"
	INSTALL_ROOT="$pkgdir/" make DESTDIR="$pkgdir/" install
}
