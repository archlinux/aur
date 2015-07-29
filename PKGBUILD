# Maintainer: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>

pkgname=zesarux-git

pkgver=r2603.eefcb12
pkgrel=1
pkgdesc="A Zx80/Zx81/Z88, Zx Spectrum 16/48/128/+2/+2A and ZX-Uno emulator with ULAPlus support. WARNING. This is a Snapshot version and not a stable one. Some features may not work or suffer random crashes or abnormal CPU use"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/zesarux/"
license=('GPL3')
conflicts=('zesarux')
depens=('lesstif')
optdepends=('pulseaudio: for support Pulseaudio'
	'openssl: for enable SSL functions'
	'sdl: for support sdl video and audio output')
	
source=('zesarux-code::git+git://git.code.sf.net/p/zesarux/code')
md5sums=('SKIP')

pkgver() {
  	cd "$srcdir/zesarux-code"
  	( set -o pipefail
    		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  	)
}

build() {
	cd "$srcdir/zesarux-code"
	./configure --prefix /usr --disable-caca --disable-aa
	make
}
package(){
	if [  ! -d "${pkgdir}/usr" ]; then
		mkdir -p "${pkgdir}/usr/bin"
		mkdir -p "${pkgdir}/usr/share/zesarux/"
	fi
	cd ${srcdir}/zesarux-code
	cp zesarux "${pkgdir}/usr/bin/"
	cp *.rom zxuno.flash ${pkgdir}/usr/share/zesarux/
	cp mantransfev3.bin macos_say_filter.sh ${pkgdir}/usr/share/zesarux/
	
	cp -r tapes ${pkgdir}/usr/share/zesarux/
	cp ACKNOWLEDGEMENTS Changelog HISTORY LICENSE README FEATURES INSTALL INSTALLWINDOWS ALTERNATEROMS INCLUDEDTAPES FAQ ${pkgdir}/usr/share/zesarux/
	find ${pkgdir}/usr/share/zesarux/ -type f -print0| xargs -0 chmod 444
	chmod +x ${pkgdir}/usr/share/zesarux/macos_say_filter.sh
}
