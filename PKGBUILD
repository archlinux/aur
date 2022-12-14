# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmannt-online.de> 
# Contributor: Army <uli armbruster>

pkgname=mupdf-git
_pkgname=mupdf
pkgver=20221214.8ef167746
pkgrel=1
pkgdesc='Lightweight PDF, XPS, and E-book viewer'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://mupdf.com/'
license=('AGPL3')
makedepends=('git' 'libxi' 'glu')
depends=('libxrandr' 'harfbuzz' 'jbig2dec' 'libjpeg-turbo' 'openjpeg2' 'gumbo-parser' 'mujs')
source=('git://git.ghostscript.com/mupdf.git'
        'git://git.ghostscript.com/thirdparty-extract.git'
        'git://git.ghostscript.com/thirdparty-freeglut.git'
        'git://git.ghostscript.com/thirdparty-lcms2.git'
        'desktop')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '3240d4ebda002cb2c4f42cd42793c6160f1701d349d0acb797819dfd10d4fedd')

conflicts=("${_pkgname}"{,-gl,-tools})
provides=("${_pkgname}"{,-gl,-tools})

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	for lib in extract freeglut lcms2; do
		rm -fr thirdparty/$lib
		cp -a ../thirdparty-$lib thirdparty/$lib
	done
}

build() {
	cd "${srcdir}/${_pkgname}"
	export USE_SYSTEM_LIBS=yes
	export CFLAGS+=' -D TOFU_CJK -D TOFU_NOTO' # only embed Base14 fonts and Charis SIL
	sed 's/$(HAVE_X11)/no/g' -i Makefile # prevent building useless binaries
	sed 's/$(USE_SYSTEM_MUJS)/yes/g' -i Makethird
	sed 's/$(USE_SYSTEM_GLUT)/no/g' -i Makethird Makefile
	make release
}

package() {
	cd "${srcdir}/${_pkgname}"
	make install DESTDIR="${pkgdir}" prefix=/usr
	mv "${pkgdir}"/usr/bin/mupdf{-gl,}
	rm -fr "${pkgdir}"/usr/{include,lib}
	find "${pkgdir}"/usr/share -type f -exec chmod 0644 {} +
	install -Dm644 ../desktop "${pkgdir}"/usr/share/applications/mupdf.desktop
}
