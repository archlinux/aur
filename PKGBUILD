# Maintainer: Carlo Capocasa <carlo@capocasa.net>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmannt-online.de> 
# Contributor: Army <uli armbruster>

pkgname=mupdf-bgcolor-git
_pkgname=mupdf
pkgver=20180322.90defd07
pkgrel=1
pkgdesc='Lightweight PDF, XPS, and E-book viewer. Patched to allow custom background color.'
arch=('i686' 'x86_64' 'armv7h')
url='http://acidwords.com/posts/2016-07-26-hacking-mupdf-custom-background-colors.html'
license=('AGPL3')
makedepends=('git')
depends=('xorg-server' 'harfbuzz' 'jbig2dec' 'libjpeg-turbo' 'openjpeg2')
source=('git://git.ghostscript.com/mupdf.git'
        'git://git.ghostscript.com/mujs.git'
        'cmm_ctx_gone.patch'
        'desktop'
        'mupdf-bgcolor.patch')
sha256sums=('SKIP'
            'SKIP'
            'df0d070fe988c5b1f610d21a90d3028f03c73829c026510b2789d7c1f285fbf5'
            'f8e559042c46a0b2b82cfc480281d19fd51d9a6a7e1caac7630c91d642862d15'
            'c402f2bfd3091d4c3f13721a040677159931191129ee5903a585094a8260a458')

conflicts=("${_pkgname}")
provides=("${_pkgname}")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
	cd "${srcdir}/${_pkgname}"

	sed "/mujs.git/c url = $(pwd)/../mujs" -i .gitmodules
	git submodule update --init thirdparty/mujs

	# link against system libopenjp2 dynamically
	sed '/#define OPJ_STATIC/d' -i source/fitz/load-jpx.c

	# embedding CJK fonts into binaries is madness...
	sed '/TOFU_CJK /c #define TOFU_CJK 1/' -i include/mupdf/fitz/config.h

	# fix moronic lcms2 version
	sed 's/lcms2art/lcms2/g' -i source/fitz/color-lcms.c
	patch -p1 -i ../cmm_ctx_gone.patch
	
	# allow background color
	patch -p1 -i ../mupdf-bgcolor.patch
}

build() {
	cd "${srcdir}/${_pkgname}"

	make release HAVE_X11=yes HAVE_GLUT=no XCFLAGS="$CFLAGS -fPIC" XLIBS="$LDFLAGS"
}

package() {
	cd "${srcdir}/${_pkgname}"

	make install DESTDIR="${pkgdir}" prefix=/usr
	mv "${pkgdir}"/usr/bin/mupdf{-x11,}
	rm "${pkgdir}"/usr/bin/mupdf-gl*

	install -Dm644 ../desktop "${pkgdir}"/usr/share/applications/mupdf.desktop
	find "${pkgdir}"/usr/share -type f -exec chmod 0644 {} +

	# prevent the static-linking disease from spreading...
	rm -fr "${pkgdir}"/usr/{include,lib}
}
