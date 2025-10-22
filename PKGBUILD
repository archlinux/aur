# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmannt-online.de> 
# Contributor: Army <uli armbruster>

pkgname=mupdf-git
_pkgname=mupdf
pkgver=20251002.1f68e3eac
pkgrel=1
pkgdesc='Lightweight PDF, XPS, and E-book viewer'
arch=(x86_64 armv7h aarch64)
url=https://mupdf.com/
license=(AGPL3)
makedepends=(git glu libxi)
depends=(gumbo-parser harfbuzz jbig2dec libarchive libgl
         libjpeg-turbo libxrandr mujs openjpeg2)
source=(git+https://github.com/ArtifexSoftware/mupdf.git
        git+https://github.com/ArtifexSoftware/extract.git
        git+https://github.com/ArtifexSoftware/thirdparty-freeglut.git
        git+https://github.com/ArtifexSoftware/thirdparty-lcms2.git#branch=lcms2mt
	https://raw.githubusercontent.com/ArtifexSoftware/mujs/refs/heads/master/regexp.h
        desktop)
sha256sums=(SKIP
            SKIP
            SKIP
            SKIP
            d8db1f6daadf0ab92a806d1e5f2ddc2289767f18cd862b8978bae6a19b82ea0a
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
	cp -a ../extract ../thirdparty-* thirdparty
	rename thirdparty- '' thirdparty/*

	# Should be in mujs package.
	mkdir thirdparty/mujs
	cp ../regexp.h thirdparty/mujs
}

build() {
	cd "${srcdir}/${_pkgname}"
	export USE_SYSTEM_LIBS=yes
	export CFLAGS+=' -D TOFU_CJK -D TOFU_NOTO' # only embed Base14 fonts and Charis SIL
	sed 's/$(HAVE_X11)/no/g' -i Makefile # prevent building useless binaries
	sed 's/$(USE_SYSTEM_MUJS)/yes/g' -i Makethird
	sed 's/$(USE_SYSTEM_GLUT)/no/g' -i Makethird Makefile
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
