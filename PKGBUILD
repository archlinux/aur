# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
_pkgname='chatterino2-7tv-nightly'
pkgname="${_pkgname}-bin"
provides=chatterino
conflicts=chatterino
pkgver=2025.04.20
pkgrel=1
pkgdesc="Second installment of the Twitch chat client series "Chatterino""
arch=('x86_64')
url="https://github.com/SevenTV/chatterino7"
license=('MIT')
depends=(
	brotli
	fontconfig
	freetype2
	glib2
	harfbuzz
	icu
	libx11
	libglvnd
	libjpeg-turbo
	libnotify
	libxkbcommon{,-x11}
	openssl
	xcb-util-{image,wm,cursor,keysyms,renderutil}
	)
makedepends=('binutils' 'grep' 'patchelf')
optdepends=('streamlink: For piping streams to video players'
            'pulseaudio: For audio output'
            'gst-plugins-good: For audio output')
provides=(chatterino)
conflicts=(chatterino)
source=("${url}/releases/download/nightly-build/Chatterino-Ubuntu-24.04-x86_64.deb")
sha256sums=('SKIP')
package() {
	bsdtar -xf data.tar.zst -C "${pkgdir}"
	#Replace icu
	_icuorig=$(ldd "$pkgdir"/usr/bin/chatterino|grep libicui18n.so.|awk '{print $1}' |sed s/libicui18n.so.//) #incomplete
	_icumaj=$(grep LIB_VERSION_MAJOR /usr/lib/icu/current/Makefile.inc|awk {'print $3'})
	nm -D "$pkgdir/usr/bin/chatterino"|grep $_icuorig|awk '{print $2 " " $2 | " sed s/'$_icuorig'$/'$_icumaj'/ "}' |tee  map.txt
	patchelf "$pkgdir/usr/bin/chatterino" --rename-dynamic-symbols map.txt --replace-needed libicuuc.so{.$_icuorig,} --replace-needed libicui18n.so{.$_icuorig,}
}
