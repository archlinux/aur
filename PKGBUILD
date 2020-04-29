# Maintainer: Waffle Lapkin <waffle.lapkin@gmail.com>
pkgname='anilibria-winmaclinux-git'
pkgver=r92.5bb0d79
pkgrel=1
pkgdesc='AniLibria client for major desktop platforms'
arch=('x86_64')
url='https://github.com/anilibria/anilibria-winmaclinux'
license=('GPL3')
groups=()
depends=('qt5-webview' 'gst-libav')
makedepends=('qt5-base' 'qt5-multimedia' 'qt5-svg' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/anilibria/anilibria-winmaclinux.git#commit=5bb0d79899b31ba15ad84f0187ad3b30e06190d9'
        '0001-Change-instalation-path-to-be-Arch-linux-friendly.patch'
        '0001-disable-version-check.patch')
md5sums=('SKIP'
         '90c273d473ea81ecba60f5c31a2db94f'
         'c8f887de1082f4e8ff46d8e253ec623e')

pkgver() {
	cd "${pkgname%-git}"
	
	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch -p1 -i "$srcdir/0001-Change-instalation-path-to-be-Arch-linux-friendly.patch"
	patch -p1 -i "$srcdir/0001-disable-version-check.patch"
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
