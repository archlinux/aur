# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Scytrin dai Kinthra <scytrin@gmail.com>

pkgname=st-white-git
_pkgname=st
pkgver=0.6.r13.gd032b61
pkgrel=1
pkgdesc='A simple virtual terminal emulator for X.'
arch=('i686' 'x86_64')
url="http://st.suckless.org"
license=('MIT')
conflicts=($_pkgname)
provides=($_pkgname)
depends=('libxft')
makedepends=('ncurses' 'libxext' 'git')
source=("git://git.suckless.org/st"
	'config.h')
md5sums=('SKIP'
         '63512eae3f0018abdaa5b39bb01c0900')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --tags --long|sed -r 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

prepare() {
	local file
	cd "${srcdir}/${_pkgname}"
	sed \
		-e '/char font/s/= .*/= "Fixed:pixelsize=13:style=SemiCondensed";/' \
		-e '/char worddelimiters/s/= .*/= " '"'"'`\\\"()[]{}<>|";/' \
		-e '/int defaultcs/s/= .*/= 1;/' \
		-i config.def.h
	sed \
		-e 's/CPPFLAGS =/CPPFLAGS +=/g' \
		-e 's/CFLAGS =/CFLAGS +=/g' \
		-e 's/LDFLAGS =/LDFLAGS +=/g' \
		-e 's/_BSD_SOURCE/_DEFAULT_SOURCE/' \
		-i config.mk
	sed '/@tic/d' -i Makefile
	for file in "${source[@]}"; do
		if [[ "$file" != *.diff ]]; then
			# add config.h if present in source array
			# Note: this supersedes the above sed to config.def.h
			[[ "$file" == "config.h" ]] && cp "$SRCDEST/$file" .
			continue
		fi
		# add all patches present in source array
		patch -Np1 <"$SRCDEST/$file"
	done
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
