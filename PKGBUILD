# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmannt-online.de> 
# Contributor: Army <uli armbruster>

pkgname=mupdf-git
_pkgname=mupdf
pkgver=20191103.2985ec5c0
pkgrel=1
pkgdesc='Lightweight PDF, XPS, and E-book viewer'
arch=('i686' 'x86_64' 'armv7h')
url='https://mupdf.com/'
license=('AGPL3')
makedepends=('git')
depends=('freeglut' 'glu' 'harfbuzz' 'jbig2dec' 'libjpeg-turbo' 'openjpeg2')
source=('git://git.ghostscript.com/mupdf.git'
        'lcms2::git://git.ghostscript.com/thirdparty-lcms2.git'
        'git://git.ghostscript.com/mujs.git'
        'desktop')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '3240d4ebda002cb2c4f42cd42793c6160f1701d349d0acb797819dfd10d4fedd')

conflicts=("${_pkgname}")
provides=("${_pkgname}")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
	cd "${srcdir}/${_pkgname}"

	sed "/lcms2.git/c url = $(pwd)/../lcms2" -i .gitmodules
	sed "/mujs.git/c url = $(pwd)/../mujs" -i .gitmodules
	git submodule update --init thirdparty/lcms2
	git submodule update --init thirdparty/mujs

	# embedding CJK fonts into binaries is madness...
	sed '/TOFU_CJK /c #define TOFU_CJK 1/' -i include/mupdf/fitz/config.h

	# fix memento.h confusion
	echo 'THIRD_CFLAGS += -I./include/mupdf' >> Makethird
}

build() {
	cd "${srcdir}/${_pkgname}"

	export USE_SYSTEM_LIBS=yes
	make release
}

package() {
	cd "${srcdir}/${_pkgname}"

	make install DESTDIR="${pkgdir}" prefix=/usr
	mv "${pkgdir}"/usr/bin/mupdf{-gl,}
	rm "${pkgdir}"/usr/bin/mupdf-x11*

	install -Dm644 ../desktop "${pkgdir}"/usr/share/applications/mupdf.desktop
	find "${pkgdir}"/usr/share -type f -exec chmod 0644 {} +

	# prevent the static-linking disease from spreading...
	rm -fr "${pkgdir}"/usr/{include,lib}
}
