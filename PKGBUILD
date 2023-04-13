# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>

pkgname=zesarux-git
pkgver=10.3.Beta1.r2.g424c903
_ver=10.3
pkgrel=1
pkgdesc="A Zx80/Zx81/Z88, Zx Spectrum 16/48/128/+2/+2A and ZX-Uno emulator with ULAPlus support. Development version."
arch=('i686' 'x86_64')
url="https://github.com/chernandezba/zesarux"
license=('GPL3')
conflicts=('zesarux')
depends=('libxxf86vm' 'aalib' 'libcaca' 'alsa-lib')
optdepends=('libpulse: for support Pulseaudio'
	'openssl: for enable SSL functions'
	'sdl: for support sdl video and audio output')
source=('zesarux-code::git+https://github.com/chernandezba/zesarux.git'
	zesarux.desktop
	zesarux.png)
install="zesarux.install"
sha256sums=('SKIP'
	    'a2b56a0349c52dc3826094cd587cc775033f4e206f4dafa4345b509c548736e1'
            'e11be8695f0f75ac2ad5c32e225a3a7aca35ca97b4d1f04726bda476aa460eb5')

pkgver() {
  	cd "$srcdir/zesarux-code"
        git describe --long --tags | sed 's/^ZEsarUX-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/zesarux-code/src"
	# disable libcaca for now
	./configure --prefix /usr --enable-memptr --enable-visualmem --enable-cpustats --disable-caca --enable-sdl2
	sed -i 's/tar -C/#tar -C/g' Makefile
	make bintargz
}
package(){
	if [  ! -d "${pkgdir}/usr" ]; then
		mkdir -p "${pkgdir}/usr/bin"
		mkdir -p "${pkgdir}/usr/share/zesarux/"
		mkdir -p "${pkgdir}/usr/share/applications"
	fi
	cd ${srcdir}/zesarux-code/src
	cp zesarux "${pkgdir}/usr/bin/"
	cp bintargztemp/ZEsarUX-${_ver}/* -r "${pkgdir}/usr/share/zesarux/"
	cp ${srcdir}/zesarux.desktop "${pkgdir}/usr/share/applications/"
	cp ${srcdir}/zesarux.png "${pkgdir}/usr/share/zesarux/"
	rm "${pkgdir}/usr/share/zesarux/zesarux"
}
