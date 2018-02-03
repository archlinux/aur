# Maintainer: Frank LENORMAND <lenormf@gmail.com>

_gitname=dvtm
pkgname=dvtm-git
pkgver=0.15.37.gb45828d
pkgver() { ( cd $_gitname && git describe | sed 's/^v//; s/-/./g'; ) }
pkgrel=2
pkgdesc='Dynamic virtual terminal manager.'
arch=('i686' 'x86_64')
url='http://www.brain-dump.org/projects/dvtm/'
license=('MIT')
depends=('sh' 'ncurses')
makedepends=(git)
provides=(dvtm)
conflicts=(dvtm)
source=('git://github.com/martanne/dvtm.git')
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long | sed 's/^v//; s/-/./g'
}

prepare() {
	cd "${srcdir}/${_gitname}"
	[[ -e "$srcdir/config.h" ]] && cp "$srcdir/config.h" .

	sed -i"" 's/CFLAGS =/CFLAGS +=/' config.mk
}

build() {
	cd "${srcdir}/${_gitname}"

	make clean
	make
}

package() {
	cd "${srcdir}/${_gitname}"

	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	rm -rf "${pkgdir}/usr/share/terminfo"
}
