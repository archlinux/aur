# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmannt-online.de> 
# Contributor: Army <uli armbruster>

pkgname=mupdf-git
_pkgname=mupdf
pkgver=20171025.ec07e537
pkgrel=1
pkgdesc='Lightweight PDF, XPS, and E-book viewer'
arch=('i686' 'x86_64' 'armv7h')
url='http://mupdf.com/'
license=('AGPL3')
makedepends=('git')
depends=('glfw' 'harfbuzz' 'jbig2dec' 'libjpeg-turbo' 'openjpeg2')
source=('git://git.ghostscript.com/mupdf.git'
        'git://git.ghostscript.com/mujs.git'
        'cmm_ctx_gone.patch'
        'desktop')
sha256sums=('SKIP'
            'SKIP'
            'df0d070fe988c5b1f610d21a90d3028f03c73829c026510b2789d7c1f285fbf5'
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

	# fix moronic lcms2 version
	sed 's/lcms2art/lcms2/g' -i source/fitz/color-lcms.c
	patch -p1 -i ../cmm_ctx_gone.patch
}

build() {
	cd "${srcdir}/${_pkgname}"

	export HAVE_GLFW='yes'
	export SYS_GLFW_CFLAGS="$(pkg-config --cflags glfw3)"
	export SYS_GLFW_LIBS="$(pkg-config --libs glfw3) -lGL"

	make release XCFLAGS="$CFLAGS -fPIC" XLIBS="$LDFLAGS"
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
