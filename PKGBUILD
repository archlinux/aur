# Maintainer: Manuel Altalef <maltalef101@gmail.com>
pkgname=st-maltalef-git
_pkgname=st
pkgver=0.8.2.r4.87a18b4
pkgrel=1
pkgdesc="maltalef101's build of Suckless' simple terminal (st)."
arch=('x86_64' 'i386')
url="https://github.com/maltalef101/st.git"
license=('MIT')
options=('zipman')
depends=('libxft')
makedepends=('make' 'ncurses' 'libxext')
optdepends=('dmenu: feed urls to dmenu')
source=("git+$url")
md5sums=('SKIP')

provides=("$_pkgname")
conflicts=("$_pkgname")

pkgver() {
	cd "${_pkgname}"
	printf "%s.r%s.%s" "$(awk '/^VERSION =/ {print $3}' config.mk)" \
		"$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $srcdir/${_pkgname}
	# skip terminfo which conflicts with ncurses
	sed -i '/tic /d' Makefile
}

build() {
	cd "${_pkgname}"
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd "${_pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
