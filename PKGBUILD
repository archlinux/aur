# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
_pkgname='chatterino2'
pkgname="${_pkgname}-bin"
provides=chatterino
conflicts=chatterino
pkgver=2.5.3
pkgrel=3
scdir=$_pkgname
_pkgver="${pkgver//_/-}"
_gitname="release-${_pkgver}"
pkgdesc="Second installment of the Twitch chat client series "Chatterino""
arch=('x86_64')
url="https://github.com/chatterino/chatterino2"
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
source=("${url}/releases/download/v$pkgver/Chatterino-Ubuntu-24.04.deb")
package() {
	bsdtar -xf data.tar.zst -C "${pkgdir}"
	install -d "${pkgdir}/opt/${_pkgname}" #why?
	install -dm755 "$pkgdir/usr/bin"
	#Replace icu
	_icuorig=$(ldd "$pkgdir"/usr/bin/chatterino|grep libicui18n.so.|awk '{print $1}' |sed s/libicui18n.so.//) #incomplete
	_icumaj=$(grep LIB_VERSION_MAJOR /usr/lib/icu/current/Makefile.inc|awk {'print $3'})
	nm -D "$pkgdir/usr/bin/chatterino"|grep $_icuorig|awk '{print $2 " " $2 | " sed s/'$_icuorig'$/'$_icumaj'/ "}' |tee  map.txt
	patchelf "$pkgdir/usr/bin/chatterino" --rename-dynamic-symbols map.txt --replace-needed libicuuc.so{.$_icuorig,} --replace-needed libicui18n.so{.$_icuorig,}
}
sha256sums=('8a68cf764716a7c68941c6288335a81888d2bd9df44fa4d1d866cc0ca681aba7')
