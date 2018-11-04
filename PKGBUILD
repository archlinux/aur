# $Id$
# Maintainer: Ian Schoonover <schoonover.ian AT gmail.com>
# Contributor: Yauhen Kirylau <yawghen AT gmail.com>

pkgname=wickr-bin
pkgver=4.62.2
pkgrel=1
pkgdesc="A secure chat and media transfer client"
arch=('x86_64')
url="https://wickr.com"
license=('custom:wickr')
options=(!strip)
depends=(
	'libx11' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxext' 'libxfixes' 
	'libxi' 'libxrender' 'libxtst' 'freetype2' 'harfbuzz' 'libpng12' 'fontconfig' 
	'libwebp' 'libjpeg-turbo' 'libxss' 're2' 'snappy' 'alsa-lib' 'ffmpeg' 'libvpx' 
	'opus' 'libdbus' 'minizip' 'libxml2' 'libxslt' 'lcms2' 'double-conversion' 
	'libxau' 'libxdmcp' 'graphite' 'opencore-amr' 'aom' 'gsm' 'lame' 'openjpeg2' 
	'speex' 'libtheora' 'libvorbis' 'libx264' 'x265' 'xvidcore' 'libva' 'libmodplug' 
	'libbluray' 'libssh' 'libvdpau' 'libdrm' 'libglvnd' 'libsoxr' 'libogg' 'libffi' 
	'gst-plugins-bad' 'icu55' 'libprotobuf2' 'libhunspell1.3'
)
makedepends=('chrpath')
install="wickr-bin.install"
sha256sums=(
	"4bd36b6abfe7374fd736d9d618f4d4e0dc268196a2f8db6bc45d4ee295e0ecae"
	"39bfcaca8a844dbfaf5c296017cee2a8049d2d42183a83b009960d9283c71935"
	"88aec8f59f2f59b598b9f51c44a6801d1fb3bd8881e5c7715d6c5b9538d913f6"
)
source=(
	"https://s3.amazonaws.com/static.wickr.com/downloads/ubuntu/me/WickrMe-${pkgver}.zip"
	"LICENSE"
	"desktop.patch"
)

prepare() {
	ar xf WickrMe*.deb
	tar xfJ data.tar.xz
	ar xf wickr-qt_5.9.4_amd64.deb 
	tar xfJ data.tar.xz

	# remove element from rpath for developers' build env
	chrpath -r /usr/local/wickr/Qt-5.9:/usr/local/wickr/Qt-5.9/lib:/usr/lib/WickrMe/lib/ usr/bin/WickrMe

	# patch desktop file to be more consistent and accurate
	patch usr/share/applications/WickrMe.desktop desktop.patch
}

package() {
	chmod -R g-w usr
	mv usr "${pkgdir}"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
