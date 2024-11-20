# Maintainer: envolution
# Contributor: Melvin Vermeeren <mail@mel.vin>
pkgname=drawtiming
pkgver=0.7.1
pkgrel=6
pkgdesc="Tool that converts ASCII to UML Timing Diagrams.  IM7 patches"
arch=('x86_64')
url="http://drawtiming.sourceforge.net/"
license=('GPL-2.0-or-later')
options=(!lto !debug)
depends=('imagemagick' 'gsfonts' 'ghostscript')
makedepends=('autoconf')
source=("https://downloads.sourceforge.net/project/drawtiming/drawtiming/0.7.1/drawtiming-0.7.1.tar.gz"
        'fenugrec-v2.patch'
        'defaultfont.patch' #applies NimbusMonoPS-Regular from gsfonts as default
)
sha256sums=('ae35a369f71f03b219d23f56329ced73100f79ffda38dd8d31d1e9e510f3cf6e'
            'dcaf7bd20d9a80e2ffb6af77b15f8d8395d4e41155f9738db3e635a375586c26'
            'bbd8498530d60c551a19d7bf22af81f1dea2fc2a824b8547082535f661a63609')
validpgpkeys=('3ABAC00311517945BAF0491140DDCDFB3BF52988') # Edward Counce

prepare() {
	cd "${pkgname}-${pkgver}"
	rm missing aclocal.m4 config.h.in doc/Makefile.in install-sh depcomp \
	   src/scanner.cc src/parser.h src/parser.cc src/Makefile.in configure.in \
	   Makefile.in samples/Makefile.in configure

        patch -Np1 -i ../'fenugrec-v2.patch' # https://github.com/fenugrec/drawtiming/tree/480f714b4702201c236b9ad97517fee13c4b748d
        patch -Np1 -i ../'defaultfont.patch'
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
