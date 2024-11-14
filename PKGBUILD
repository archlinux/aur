# Maintainer: Melvin Vermeeren <mail@mel.vin>
pkgname=drawtiming
pkgver=0.7.1
pkgrel=3
pkgdesc="Tool that converts ASCII to UML Timing Diagrams."
arch=('i686' 'x86_64')
url="http://drawtiming.sourceforge.net/"
license=('GPL-2.0-or-later')
options=(!lto)
depends=('libmagick6' 'ghostscript')
source=("https://downloads.sourceforge.net/project/drawtiming/drawtiming/0.7.1/drawtiming-0.7.1.tar.gz"
        manpage-fix.diff
        missing-includes.diff
        switch_LDFLAGS_LDADD.diff
        'repair-build-c++-17.patch'
)
sha256sums=('ae35a369f71f03b219d23f56329ced73100f79ffda38dd8d31d1e9e510f3cf6e'
            '7c13ef56a29a424bc5c212e93417bd41ec33307aefce5ae8b6a96fde30fd385a'
            'e3723c88baaa7d48dc6304067218ad213e70b624d45caf99953a63b6702e321d'
            '03a4d9d41aa5a3e2f386c27e55565174ee09b4c4b37458b3313d65cbbfe9a912'
            '8594af0bc67664fb4c1735a92070b2adc9b58fefc44fd32393f56e8f468b7987')
validpgpkeys=('3ABAC00311517945BAF0491140DDCDFB3BF52988') # Edward Counce

prepare() {
	cd "${pkgname}-${pkgver}"
        #The following four patches are from Debian
        patch -p1 -i ../manpage-fix.diff
        patch -p1 -i ../missing-includes.diff
        patch -p1 -i ../switch_LDFLAGS_LDADD.diff
	patch -p1 -i ../'repair-build-c++-17.patch'
}

build() {
	cd "${pkgname}-${pkgver}"
        export PKG_CONFIG_PATH=/usr/lib/imagemagick6/pkgconfig:$PKG_CONFIG_PATH
	export MAGICK_CFLAGS=$(pkg-config --cflags Magick++ 2>/dev/null)
	export MAGICK_LIBS=$(pkg-config --libs Magick++ 2>/dev/null)
	export CXXFLAGS="$CXXFLAGS $MAGICK_CFLAGS"
	export LDFLAGS="$LDFLAGS $MAGICK_LIBS"

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
