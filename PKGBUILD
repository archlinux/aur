# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
_pkgname='chatterino2-nightly'
pkgname="${_pkgname}-bin"
provides=(${_pkgname})
conflicts=(${_pkgname})
pkgver=2.5.3
pkgrel=3
scdir=$_pkgname
_pkgver="${pkgver//_/-}"
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
provides=chatterino
conflicts=chatterino
#source=(${_pkgname}.desktop)
source=("${url}/releases/download/nightly-build/Chatterino-Ubuntu-24.04-x86_64.deb")
sha256sums=('32f569b5b89309d6a581305e1f273a908f5ac0d29475f2c52c479d51fee6e066')
package() {
	bsdtar -xf data.tar.zst -C "${pkgdir}"
	install -d "${pkgdir}/opt/${_pkgname}" #why?
	install -d "$pkgdir/usr/bin"
	#Replace icu
	_icuorig=$(ldd "$pkgdir"/usr/bin/chatterino|grep libicui18n.so.|awk '{print $1}' |sed s/libicui18n.so.//) #incomplete
	_icumaj=$(grep LIB_VERSION_MAJOR /usr/lib/icu/current/Makefile.inc|awk {'print $3'})
	nm -D "$pkgdir/usr/bin/chatterino"|grep $_icuorig|awk '{print $2 " " $2 | " sed s/'$_icuorig'$/'$_icumaj'/ "}' |tee  map.txt
	patchelf "$pkgdir/usr/bin/chatterino" --rename-dynamic-symbols map.txt --replace-needed libicuuc.so{.$_icuorig,} --replace-needed libicui18n.so{.$_icuorig,}
}
