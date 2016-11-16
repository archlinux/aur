# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmannt-online.de> 
# Contributor: Army <uli armbruster>

pkgname=mupdf-git
_pkgname=mupdf
pkgver=20161115.5ed7e6c
pkgrel=1
pkgdesc='Lightweight PDF, XPS and CBZ viewer'
arch=('i686' 'x86_64' 'armv7h')
url='http://mupdf.com/'
license=('AGPL3')
makedepends=('git')
depends=('curl' 'freetype2' 'jbig2dec' 'libjpeg-turbo' 'libxext' 'openjpeg2')
source=('git://git.ghostscript.com/mupdf.git'
        'desktop')
sha1sums=('SKIP'
          '31573e5da3fbf0162c0926511fc9858f2052fa6c')

conflicts=("${_pkgname}")
provides=("${_pkgname}")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
	cd "${srcdir}/${_pkgname}"

	git submodule update --init thirdparty/mujs

	# link against system libopenjp2 dynamically
	sed '/#define OPJ_STATIC/d' -i source/fitz/load-jpx.c

	# embedding CJK fonts into binaries is madness...
	sed '/TOFU_CJK /c #define TOFU_CJK 1/' -i include/mupdf/fitz/config.h
}

build() {
	cd "${srcdir}/${_pkgname}"

	make release XCFLAGS="$CFLAGS -fPIC" XLIBS="$LDFLAGS"
}

package() {
	cd "${srcdir}/${_pkgname}"

	make install DESTDIR="${pkgdir}" prefix=/usr
	mv "${pkgdir}"/usr/bin/mupdf-x11-curl "${pkgdir}"/usr/bin/mupdf
	rm "${pkgdir}"/usr/bin/mupdf-x11

	install -Dm644 ../desktop "${pkgdir}"/usr/share/applications/mupdf.desktop
	find "${pkgdir}"/usr/share -type f -exec chmod 0644 {} +

	# prevent the static-linking disease from spreading...
	rm -fr "${pkgdir}"/usr/{include,lib}
}
