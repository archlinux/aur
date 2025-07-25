# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
_pkgname='chatterino2-7tv'
pkgname="${_pkgname}-bin"
pkgver=7.5.3
pkgrel=3
pkgdesc="A fork of Chatterino2 with built-in support for 7tv emotes"
arch=('x86_64')
url="https://github.com/SevenTV/chatterino7"
license=('MIT')
depends=(brotli fontconfig freetype2 glib2 harfbuzz icu
	libx11 libglvnd libjpeg-turbo libnotify openssl
	libxkbcommon{,-x11} xcb-util-{image,wm,cursor,keysyms,renderutil})
makedepends=('binutils' 'grep' 'patchelf')
optdepends=('streamlink: For piping streams to video players'
            'pulseaudio: For audio output'
            'gst-plugins-good: For audio output')
provides=(chatterino)
conflicts=(chatterino)
source=("${url}/releases/download/v$pkgver/Chatterino-Ubuntu-24.04-Qt6.deb")
sha256sums=('c69fe359236ac01baa2da2a28ee8c44ec030fe0d2616869be5407615abd900a8')
package() {
	bsdtar -xf data.tar.zst -C "${pkgdir}"
	#Replace icu
	_icuorig=$(ldd "$pkgdir"/usr/bin/chatterino|grep libicui18n.so.|awk '{print $1}' |sed s/libicui18n.so.//) #incomplete
	_icumaj=$(grep LIB_VERSION_MAJOR /usr/lib/icu/current/Makefile.inc|awk {'print $3'})
	nm -D "$pkgdir/usr/bin/chatterino"|grep $_icuorig|awk '{print $2 " " $2 | " sed s/'$_icuorig'$/'$_icumaj'/ "}' |tee  map.txt
	patchelf "$pkgdir/usr/bin/chatterino" --rename-dynamic-symbols map.txt --replace-needed libicuuc.so{.$_icuorig,} --replace-needed libicui18n.so{.$_icuorig,}
}
