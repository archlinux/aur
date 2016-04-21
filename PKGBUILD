# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmannt-online.de> 
# Contributor: Army <uli armbruster>

pkgname=mupdf-git
_pkgname=mupdf
pkgver=20160421.0278606
pkgrel=1
pkgdesc='Lightweight PDF, XPS and CBZ viewer'
arch=('i686' 'x86_64' 'armv7h')
url='http://mupdf.com/'
license=('GPL3')
makedepends=('git')
depends=('curl' 'freetype2' 'jbig2dec' 'libjpeg' 'libxext')
source=('git://git.ghostscript.com/mupdf.git'
        'desktop')
sha1sums=('SKIP'
          '31573e5da3fbf0162c0926511fc9858f2052fa6c')

conflicts=("${_pkgname}")
provides=("${_pkgname}")
options=('staticlibs')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	git submodule update --init thirdparty/openjpeg
	git submodule update --init thirdparty/mujs

	# needed for zathura-pdf-mupdf
	CFLAGS+=' -fPIC'
	CXXFLAGS+=' -fPIC'

	# fix memento.h confusion
	sed '/^JBIG2DEC_CFLAGS :=/s|$| -I./include/mupdf|' -i Makethird
}

build() {
	cd "${srcdir}/${_pkgname}"

	make build=release prefix="${pkgdir}"/usr
}

package() {
	cd "${srcdir}/${_pkgname}"

	make build=release prefix="${pkgdir}"/usr install
	mv "${pkgdir}"/usr/bin/mupdf-x11-curl "${pkgdir}"/usr/bin/mupdf
	rm "${pkgdir}"/usr/bin/mupdf-x11

	install -Dm644 ../desktop "${pkgdir}"/usr/share/applications/mupdf.desktop
	find "${pkgdir}"/usr/{include,lib,share} -type f | xargs chmod 644
}
