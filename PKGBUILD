# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmannt-online.de> 
# Contributor: Army <uli armbruster>

pkgname=mupdf-git
_pkgname=mupdf
pkgver=20170622.3b4bd73e
pkgrel=1
pkgdesc='Lightweight PDF, XPS and CBZ viewer'
arch=('i686' 'x86_64' 'armv7h')
url='http://mupdf.com/'
license=('AGPL3')
makedepends=('git')
depends=('curl' 'freetype2' 'jbig2dec' 'libjpeg-turbo' 'libxext' 'openjpeg2' 'lcms2')
source=('git://git.ghostscript.com/mupdf.git'
        'git://git.ghostscript.com/mujs.git'
        'cmm_ctx_gone.patch'
        'desktop')
sha256sums=('SKIP'
            'SKIP'
            '0989b34c68da7fe115e57f3050e45c4b3fd1e4ba13c9b9b4cbb80c4d073ffc1b'
            '3240d4ebda002cb2c4f42cd42793c6160f1701d349d0acb797819dfd10d4fedd')

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

	patch -p1 -i ../cmm_ctx_gone.patch
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
