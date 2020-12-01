# Maintainer: Michael Kuc <michaelkuc6 at gmail dot com>
_pkgname=libyui-qt
pkgname=${_pkgname}-git
pkgver=2.52.0.r64.gf383e2d
pkgrel=1
pkgdesc="Libyui is a widget abstraction library providing Qt, GTK and ncurses frontends. Originally it was developed for YaST but it can be used in any independent project. This part contains the Qt graphical frontend."
arch=('x86_64')
url="https://github.com/libyui/libyui-qt"
license=('LGPLv3')
depends=('libyui')
provides=("${_pkgname}")
conflicts=()
epoch=1
source=(
	"${_pkgname}::git+https://github.com/libyui/libyui-qt.git"
	'Makefile.cvs.patch'
)

sha256sums=(
	'SKIP'
	'1749ecd572d45f822bef6efec2a80cc169e86edc914f05435a357395bf858d72'
)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	patch -p0 < ../Makefile.cvs.patch
}

build() {
	cd "${srcdir}/${_pkgname}"
	make EXTRA_PARAMS=-DLIB_DIR=/usr/lib -f Makefile.cvs
}

package() {
	cd "${srcdir}/${_pkgname}"
	make EXTRA_PARAMS=-DLIB_DIR=/usr/lib PREFIX=/usr DESTDIR="${pkgdir}/" -f Makefile.cvs install
	install -m644 -D "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README"
}
