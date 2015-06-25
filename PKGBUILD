# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Scytrin dai Kinthra <scytrin@gmail.com>

pkgname=st-git
_pkgname=st
pkgver=20150603.71fa10f
pkgrel=1
pkgdesc='Simple virtual terminal emulator for X'
url='http://git.suckless.org/st/'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=('libxft')
makedepends=('ncurses' 'libxext' 'git')
source=('git://git.suckless.org/st'
        'scrollback.patch')
sha1sums=('SKIP'
          '2e10ac47eb020d50c7f861f3923bb4152255a027')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	patch -p1 -i ../scrollback.patch # http://st.suckless.org/patches/st-scrollback.diff
	sed \
		-e '/char font/s/= .*/= "Fixed:pixelsize=13:style=SemiCondensed";/' \
		-e '/char worddelimiters/s/= .*/= " '"'"'`\\\"()[]{}<>|";/' \
		-e '/int defaultcs/s/= .*/= 1;/' \
		-i config.def.h
	sed '/@tic/d' -i Makefile
}

build() {
	cd "${srcdir}/${_pkgname}"
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd "${srcdir}/${_pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
	tic -s -o "${pkgdir}/usr/share/terminfo" st.info
}
