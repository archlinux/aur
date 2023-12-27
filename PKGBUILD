# Maintainer: Nicola Revelant <nicolarevelant@outlook.com>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: roberto <roberto@archlinux.org>

pkgname=transcode
pkgver=1.1.7
pkgrel=43
pkgdesc='A video/DVD ripper and encoder for the terminal/console'
arch=(x86_64)
url="https://sources.archlinux.org/other/packages/$pkgname"
license=(GPL)
depends=(
	a52dec
	alsa-lib
	freetype2
	gawk
	glibc
	lame
	libdvdread
	libdv
	libmpeg2
	libjpeg
	libogg
	libtheora
	libvorbis
	libx11
	libxaw
	libxext
	libxml2
	libxt
	libxv
	lzo
	mjpegtools
)
makedepends=(
	nasm
	x264
	xvidcore
)
source=(
	https://sources.archlinux.org/other/packages/$pkgname/$pkgname-$pkgver.tar.bz2
	transcode-imagemagick7.patch
	transcode-gcc10.patch
	transcode-glibc-2.32.patch
)
b2sums=(
	'25001d4cae83d86e5295917bcd9e2e77dd61637e238394a2d603398baf810201dc61d8b0de5b54a7b8848ac3bcef5fb211e8f2b43ed7da4e56e335b8d4d2fbe1'
	'fdf66bd56e8e87d029a27a057815be571e605e50c817b84a0a57c9696d69a5dc61421028f5526f6bf19ecab61c58811920e45ae2c59d4fc1ee6fb3f42950d43b'
	'c564b28e99ef397694243e9411e10feec4fe9c1b5efb8f6ea4c76621a61116a6c0d643a3c21a9544960763e9ff68221e747be1b66598f31bf638edaf585131cd'
	'cab8a1e553161ddf2e9ecd43e0307aa8cb0fdf9bf43a2df61a18404450eca47eaf9ff24c2bd9a3c73a5d92d63c19bb82d0be2263bee94ffca78ed1e9a96b6bb2'
)

prepare() {
	cd $pkgname-$pkgver
	patch -p1 -i ../transcode-imagemagick7.patch # Gentoo patch
	sed -e 's|freetype/ftglyph.h|freetype2/freetype/ftglyph.h|' -i filter/subtitler/load_font.c
	patch -p1 -i ../transcode-gcc10.patch # Fix build with GCC 10
	patch -p1 -i ../transcode-glibc-2.32.patch # Fix build with glibc 2.32
	autoreconf -vi
}

build() {
	cd $pkgname-$pkgver
	./configure --prefix=/usr \
		--enable-lame --enable-ogg --enable-vorbis --enable-theora \
		--enable-libdv --enable-libxml2 --enable-v4l \
		--enable-libjpeg --enable-lzo --enable-mjpegtools \
		--enable-freetype2 --enable-a52 \
		--enable-xvid --enable-x264 --enable-alsa --enable-libmpeg2 \
		--enable-libmpeg2convert --disable-ffmpeg

	#https://bugzilla.gnome.org/show_bug.cgi?id=655517
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

	make -j 8
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir" install
}
