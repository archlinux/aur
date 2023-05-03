# Maintainer: Fredrick R. Brennan <copypaste@kittens.ph>
pkgbase=gpac-full
pkgname=(gpac-full mp4box libgpac)
_pkgbase=gpac
pkgver=2.2.1
pkgrel=2
pkgdesc="A multimedia framework based on the MPEG-4 Systems standard"
arch=("x86_64")
url="https://gpac.wp.imt.fr/"
license=('GPL')
depends=('alsa-lib' 'freetype2' 'git' 'jack' 'libjpeg-turbo' 'libpng' 'libogg'
         'libpulse' 'libtheora' 'libvorbis' 'mesa' 'sdl2' 'xvidcore' 'zlib'
	 'libnghttp2' 'openjpeg2'
	 'neptune' 'platinum-upnp')
optdepends=('alsa-oss')
provides=('gpac')
conflicts=('gpac')
source=("https://github.com/$_pkgbase/$_pkgbase/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('44b47459da0f203d0e4c0eed5836a59f44fb508db4e601b46e9ffdb53d89bb49e22ccdfe7951b17581130f186c47ae8efc0d9002685d5cf9a3547159356d2d9e')

prepare() {
	cd "$srcdir/$_pkgbase-$pkgver"
	rm -rf extra_lib/include/platinum
}

build() {
	cd "$srcdir/$_pkgbase-$pkgver"
	pacman -Qi ffmpeg && warning "$(cat<<-$'EOF'
			ffmpeg support is broken upstream due to \
			changes in ffmpeg API.
		EOF
		)" || true
	./configure --prefix=/usr --enable-depth --enable-dvbx --use-ffmpeg=no
	make
}

package_libgpac() {
	provides=()
	pkgdesc="$pkgdesc (library)"
	cd "$srcdir/$_pkgbase-$pkgver"
	make DESTDIR="$pkgdir/" install
	find "$pkgdir" -not -path "*usr/include*" -and \
		-not -path '*usr/share/pkgconfig*' -and \
		\( -not -name '*.so' -and -not -name '*.a' -type f \) -and \
		\( -not -name '*.so.*' -and -not -name '*.a.*' -type f \) | xargs -I^ rm -v ^
	find "$pkgdir" -iname "MP4Box*" | xargs -I^ rm -v ^
	find "$pkgdir" -type d -empty -delete
}

package_gpac-full() {
	provides=()
	depends+=(libgpac)
	optdepends=(mp4box)
	cd "$srcdir/$_pkgbase-$pkgver"
	make DESTDIR="$pkgdir/" install
	find "$pkgdir" -iname "MP4Box*" | xargs -I^ rm -v ^
	rm -r "$pkgdir/usr/lib"
	find "$pkgdir" -path '*usr/include*' -type f | xargs -I^ rm -v ^
	find "$pkgdir" -path '*usr/share/pkgconfig*' -type f | xargs -I^ rm -v ^
	find "$pkgdir" -type d -empty -delete
}

package_mp4box() {
	provides=(mp4box)
	pkgdesc="GPAC command-line media packager"
	depends+=(libgpac)
	cd "$srcdir/$_pkgbase-$pkgver"
	make DESTDIR="$pkgdir/" install
	find "$pkgdir" -not -iname "MP4Box*" \( -type f -or -type l \) | xargs -I^ rm -v ^
	ln -s "$pkgdir/usr/bin/MP4Box" "$pkgdir/usr/bin/mp4box"
	find "$pkgdir" -type d -empty -delete
}

# vim: syntax=bash
