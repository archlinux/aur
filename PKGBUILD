# Maintainer: Frantisek Fladung <ametisf@gmail.com>

pkgname=st-ametisf-git
_pkgname=st
pkgver=970.83e6089
pkgrel=1
pkgdesc='Port of simple terminal to wayland - ametisf fork'
url='http://github.com/ametisf/st'
arch=('i686' 'x86_64')
license=('MIT')
options=('zipman')
depends=('libxft')
makedepends=('ncurses' 'libxext' 'git')
epoch=1
# include config.h and any patches you want to have applied here
source=('git+https://github.com/ametisf/st.git')
sha1sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${_pkgname}"
    echo $(git rev-list --count wayland).$(git rev-parse --short wayland)
}

prepare() {
    cd $srcdir/$_pkgname
    # to use a custom config.h, place it in the package directory$
    if [[ -f ${SRCDEST}/config.h ]]; then
        cp "${SRCDEST}/config.h" .
    fi
}

build() {
	cd "${_pkgname}"
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd "${_pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
	install -Dm644 FAQ "${pkgdir}/usr/share/doc/${pkgname}/FAQ"
}
