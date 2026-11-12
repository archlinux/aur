# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmannt-online.de> 
# Contributor: Army <uli armbruster>

pkgname=mupdf-git
_pkgname=mupdf
pkgver=20261111.1037e2069
pkgrel=1
pkgdesc='Lightweight PDF, XPS, and E-book viewer'
arch=(x86_64 armv7h aarch64)
url=https://mupdf.com/
license=(AGPL3)
makedepends=(ctags git glu libxi nodejs pandoc)
depends=(gumbo-parser harfbuzz libarchive libgl
         libjpeg-turbo libxrandr mujs openjpeg2)
source=(git+https://github.com/ArtifexSoftware/mupdf.git
        git+https://github.com/ArtifexSoftware/extract.git
        git+https://github.com/ArtifexSoftware/jbig2dec.git
        git+https://github.com/ArtifexSoftware/thirdparty-cmark-gfm.git
        git+https://github.com/ArtifexSoftware/thirdparty-freeglut.git
        git+https://github.com/ArtifexSoftware/thirdparty-lcms2.git#branch=lcms2mt
        https://raw.githubusercontent.com/ArtifexSoftware/mujs/refs/heads/master/regexp.h
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
	ln -s mupdf-gl.1.gz "${pkgdir}"/usr/share/man/man1/mupdf.1.gz
	ln -s mupdf-gl "${pkgdir}"/usr/bin/mupdf
	rm -fr "${pkgdir}"/usr/{include,lib}
	find "${pkgdir}"/usr/share -type f -exec chmod 0644 {} +
	install -Dm644 ../desktop "${pkgdir}"/usr/share/applications/mupdf.desktop
}
