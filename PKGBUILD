# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmannt-online.de> 
# Contributor: Army <uli armbruster>

pkgname=mupdf-git
_pkgname=mupdf
pkgver=20260822.2db2083b6
pkgrel=1
pkgdesc='Lightweight PDF, XPS, and E-book viewer'
arch=(x86_64 armv7h aarch64)
url=https://mupdf.com/
license=(AGPL3)
makedepends=(git glu libxi)
depends=(gumbo-parser harfbuzz libarchive libgl
         libjpeg-turbo libxrandr mujs openjpeg2)
source=(git://git.ghostscript.com/mupdf.git
        git://git.ghostscript.com/extract.git
        git://git.ghostscript.com/jbig2dec.git
        git://git.ghostscript.com/thirdparty-cmark-gfm.git
        git://git.ghostscript.com/thirdparty-freeglut.git
        git://git.ghostscript.com/thirdparty-lcms2.git#branch=lcms2mt
        https://cgit.ghostscript.com/cgi-bin/cgit.cgi/mujs.git/plain/regexp.h
        desktop)
sha256sums=(SKIP
            SKIP
            SKIP
            SKIP
            SKIP
            SKIP
            f3a0bf8821a77587d63590ba24162daee8429d9bbcd475dcede62c4fcd3d8066
            ccff66979249bd4ab4ba8918660f194eb90eb0ae231b16e36a6cecdcf471883f)

conflicts=(${_pkgname}{,-gl,-tools})
provides=(${_pkgname}{,-gl,-tools})

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	rm -fr thirdparty/*
	cp -a ../extract ../jbig2dec ../thirdparty-* thirdparty
	rename thirdparty- '' thirdparty/*

	# Should be in mujs package
	mkdir thirdparty/mujs
	cp ../regexp.h thirdparty/mujs

	# No idea what that is for
	sed -e '/autoheaderid/d' -i source/html/md.c Makelists

	# Not yet available in Arch package
	sed -e '/GUMBO_NODE_PROCESSING_INSTRUCTION/d' -i source/fitz/xml.c
}

build() {
	cd "${srcdir}/${_pkgname}"
	export USE_SYSTEM_LIBS=yes
	export CFLAGS+=' -D TOFU_CJK -D TOFU_NOTO' # only embed Base14 fonts and Charis SIL
	sed 's/$(HAVE_X11)/no/g' -i Makefile # prevent building useless binaries
	sed 's/$(USE_SYSTEM_GLUT)/no/g' -i Makethird Makefile
	sed 's/$(USE_SYSTEM_JBIG2DEC)/no/g' -i Makethird
	sed 's/$(USE_SYSTEM_MUJS)/yes/g' -i Makethird
	sed 's/$(SYS_BROTLI_LIBS)/-lbrotlienc -lbrotlidec/g' -i Makethird
	make archive=yes build=release
}

package() {
	cd "${srcdir}/${_pkgname}"
	make archive=yes install DESTDIR="${pkgdir}" prefix=/usr
	mv "${pkgdir}"/usr/bin/mupdf{-gl,}
	rm -fr "${pkgdir}"/usr/{include,lib}
	find "${pkgdir}"/usr/share -type f -exec chmod 0644 {} +
	install -Dm644 ../desktop "${pkgdir}"/usr/share/applications/mupdf.desktop
}
