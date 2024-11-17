# Maintainer: envolution
# Contributor: Melvin Vermeeren <mail@mel.vin>
pkgname=drawtiming
pkgver=0.7.1
pkgrel=4
pkgdesc="Tool that converts ASCII to UML Timing Diagrams.  IM7 patches"
arch=('x86_64')
url="http://drawtiming.sourceforge.net/"
license=('GPL-2.0-or-later')
options=(!lto !debug)
depends=('imagemagick' 'noto-fonts' 'ghostscript')
makedepends=('autoconf')
source=("https://downloads.sourceforge.net/project/drawtiming/drawtiming/0.7.1/drawtiming-0.7.1.tar.gz"
        'fenugrec.patch'
        'font.patch' #switches to Noto-Sans-Thin as default font since Helvetica is difficult to enforce
        'fontcall.patch'
)
sha256sums=('ae35a369f71f03b219d23f56329ced73100f79ffda38dd8d31d1e9e510f3cf6e'
            '105b6c82a4aa72d3675c772b70fe794ff79a9d8c5a284f3c9823fe45d2d8cf48'
            '950e5f288b5cef87778809b388040929e80e99deebe07f5a17f76872beeb9acb'
            '30e64c296eb7047450245fb1e4ae27c05f3f80e463dacb858777baedec2fa709')
validpgpkeys=('3ABAC00311517945BAF0491140DDCDFB3BF52988') # Edward Counce

prepare() {
	cd "${pkgname}-${pkgver}"
	rm missing aclocal.m4 config.h.in doc/Makefile.in install-sh depcomp \
	   src/scanner.cc src/parser.h src/parser.cc src/Makefile.in configure.in \
	   Makefile.in samples/Makefile.in configure

	patch -Np1 -i ../'fenugrec.patch' # https://github.com/fenugrec/drawtiming/tree/7104fb270ec984ee297e6f7abe0a0316fa215db9
        patch -Np1 -i ../'font.patch'
        patch -Np1 -i ../'fontcall.patch'
        chmod a+x samples/runlite.sh
}

build() {
	cd "${pkgname}-${pkgver}"
        autoreconf -i
	./configure LDFLAGS="${LDFLAGS} -Wl,--as-needed" --prefix=/usr
	make
}

check() {
	cd "${pkgname}-${pkgver}"
	make -k check
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
