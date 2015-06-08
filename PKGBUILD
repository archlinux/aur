# Contributor: Patrick Jackson <PatrickSJackson gmail com>
# Contributor: Christoph Vigano <mail@cvigano.de>
# Contributor: Evžen Kirillov <actionless.loveless gmail com>
# Contributor: Scytrin dai Kinthra <scytrin@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=st-transparency-git
appname='st'
conflicts=(${appname})
provides=(${appname})
pkgver=20150603
pkgrel=1
pkgdesc='A simple virtual terminal emulator for X with patches for transparency and separate border width.'
arch=('i686' 'x86_64')
license=('MIT')
depends=('libxext' 'libxft')
optdepends=('utmp-git: update utmp files')
makedepends=('ncurses' 'git')
url="http://st.suckless.org"
source=(
	git://git.suckless.org/st
	enable_transparency_options.diff
	config.diff
	config.diff.lcars
	config.diff.light
	config.diff.monovedek
)
md5sums=('SKIP'
         '602b41ed34e4d5e553ed8daefca50236'
         'SKIP'
         'fe855c9850398d476848c78123cd88c7'
         '0a98972fe4377df541d92677d44bd307'
         '79161db11c5f952b7f758ce44841ad23')

prepare() {
	cd "${srcdir}/${appname}"
	cp config.def.h config.h
	for patch_file in $(ls ${srcdir}/*.diff); do
		echo "==> applying $(basename ${patch_file})"
		patch -i "$patch_file"
	done
	sed \
		-e 's/CPPFLAGS =/CPPFLAGS +=/g' \
		-e 's/CFLAGS =/CFLAGS +=/g' \
		-e 's/LDFLAGS =/LDFLAGS +=/g' \
		-i config.mk
	sed '/char font/s/".*"/"monospace:pixelsize=24:antialias=true:autohint=true"/' -i config.h
}

build() {
	cd $srcdir/$appname
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd $srcdir/$appname
	export TERMINFO="${pkgdir}/usr/share/terminfo"
	install -d "$TERMINFO"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
