# Maintainer: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>

pkgname=zesarux
pkgver=10.2
pkgrel=1
pkgdesc="A Zx80/Zx81/Z88, Zx Spectrum 16/48/128/+2/+2A and ZX-Uno emulator with ULAPlus support"
arch=('i686' 'x86_64')
url="https://github.com/chernandezba/zesarux"
license=('GPL3')
conflicts=('zesarux-git')
depends=('libcaca' 'aalib' 'alsa-lib' 'libxxf86vm')
optdepends=('libpulse: for support Pulseaudio'
	'openssl: for enable SSL functions'
	'sdl: for support sdl video and audio output')
source=("https://github.com/chernandezba/zesarux/releases/download/ZEsarUX-${pkgver}/ZEsarUX_src-${pkgver}.tar.gz"
	zesarux.desktop
	zesarux.png)
install="zesarux.install"
sha256sums=('25f27ff2f4c948bd1a6cf494fcad74a6dc684bd4f6e7f6b73a99669186b9486a'
            'a2b56a0349c52dc3826094cd587cc775033f4e206f4dafa4345b509c548736e1'
            'e11be8695f0f75ac2ad5c32e225a3a7aca35ca97b4d1f04726bda476aa460eb5')

build() {
	cd "${srcdir}/ZEsarUX-${pkgver}"
        # Working around a bug of libcaca
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
	cd ${srcdir}/ZEsarUX-${pkgver}
	cp zesarux "${pkgdir}/usr/bin/"
	cp bintargztemp/ZEsarUX-${pkgver}/* -r "${pkgdir}/usr/share/zesarux/"
	cp ${srcdir}/zesarux.desktop "${pkgdir}/usr/share/applications/"
	cp ${srcdir}/zesarux.png "${pkgdir}/usr/share/zesarux/"
	rm "${pkgdir}/usr/share/zesarux/zesarux"
}

