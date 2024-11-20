# Maintainer: envolution
# Contributor: Melvin Vermeeren <mail@mel.vin>
pkgname=drawtiming
pkgver=0.7.1
pkgrel=5
pkgdesc="Tool that converts ASCII to UML Timing Diagrams.  IM7 patches"
arch=('x86_64')
url="http://drawtiming.sourceforge.net/"
license=('GPL-2.0-or-later')
options=(!lto !debug)
depends=('imagemagick' 'gsfonts' 'ghostscript')
makedepends=('autoconf')
source=("https://downloads.sourceforge.net/project/drawtiming/drawtiming/0.7.1/drawtiming-0.7.1.tar.gz"
        'fenugrec.patch'
        'defaultfont.patch' #applies NimbusMonoPS-Regular from gsfonts as default
        'applyfont.patch'
)
sha256sums=('ae35a369f71f03b219d23f56329ced73100f79ffda38dd8d31d1e9e510f3cf6e'
            '105b6c82a4aa72d3675c772b70fe794ff79a9d8c5a284f3c9823fe45d2d8cf48'
            'bbd8498530d60c551a19d7bf22af81f1dea2fc2a824b8547082535f661a63609'
            '450ed90457ded502eff46c1db305cf61799ca2f5754155858f69ea52ce2a5c4f')
validpgpkeys=('3ABAC00311517945BAF0491140DDCDFB3BF52988') # Edward Counce

prepare() {
	cd "${pkgname}-${pkgver}"
	rm missing aclocal.m4 config.h.in doc/Makefile.in install-sh depcomp \
	   src/scanner.cc src/parser.h src/parser.cc src/Makefile.in configure.in \
	   Makefile.in samples/Makefile.in configure

	patch -Np1 -i ../'fenugrec.patch' # https://github.com/fenugrec/drawtiming/tree/7104fb270ec984ee297e6f7abe0a0316fa215db9
        patch -Np1 -i ../'defaultfont.patch'
        patch -Np1 -i ../'applyfont.patch'
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
