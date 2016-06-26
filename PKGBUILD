# Maintainer: mar77i <mysatyre at gmail dot com>
# Past Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Scytrin dai Kinthra <scytrin@gmail.com>

pkgname=st-test
_pkgname=st
pkgver=20160603.528241a
pkgrel=1
pkgdesc='Simple virtual terminal emulator for X'
url='http://git.suckless.org/st/'
arch=('i686' 'x86_64')
license=('MIT')
depends=('libxft')
makedepends=('ncurses' 'libxext' 'git')
source=('git://git.suckless.org/st'
        'http://st.suckless.org/patches/st-no_bold_colors-git-20160620-528241a.diff'
        'http://st.suckless.org/patches/st-solarized-dark-git-20160620-528241a.diff')
sha1sums=('SKIP'
          'SKIP'
          'SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
	local file
	cd "${srcdir}/${_pkgname}"
    mv ../*.diff .
    sed \
        -e '/char font/s/= .*/= "Inconsolata For Powerline:size=11:style=Medium";/' \
        -e '/char worddelimiters/s/= .*/= " '"'"'`\\\"()[]{}<>|";/' \
        -i config.def.h
	sed \
		-e 's/CPPFLAGS =/CPPFLAGS +=/g' \
		-e 's/CFLAGS =/CFLAGS +=/g' \
		-e 's/LDFLAGS =/LDFLAGS +=/g' \
		-e 's/_BSD_SOURCE/_DEFAULT_SOURCE/' \
		-i config.mk
	sed '/@tic/d' -i Makefile
    patch -p1 < st-no_bold_colors-git-20160620-528241a.diff
    #patch -p1 < st-delkey-git-20160620-528241a.diff
    patch -p1 < st-solarized-dark-git-20160620-528241a.diff
	for file in "${source[0]}"; do
		if [[ "$file" == "config.h" ]]; then
			# add config.h if present in source array
			# Note: this supersedes the above sed to config.def.h
			cp "$srcdir/$file" .
			continue
		elif [[ "$file" == *.diff ]]; then
			# add all patches present in source array
			patch -Np1 <"$srcdir/$file"
		fi
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
}
