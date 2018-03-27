# Maintainer: Brad Fanella <cesura@archlinux.org>
# Contributor: Sebastian Vandekerckhove <ptitfox@scarlet.be>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=audiere
pkgver=1.9.4
pkgrel=11
pkgdesc="High-level audio API. It can play Ogg Vorbis, MP3, FLAC, uncompressed WAV, AIFF, MOD, S3M, XM, and IT files"
arch=('i686' 'x86_64')
url="http://audiere.sourceforge.net/"
license=('LGPL')
depends=('speex' 'wxgtk' 'libvorbis' 'libcdaudio')
optdepends=('flac: for flac format')
source=("http://downloads.sourceforge.net/sourceforge/audiere/$pkgname-$pkgver.tar.gz"
	"gcc-4.4.patch"
	"TagsDialog.h"
	"DeviceFrame.cpp"
	"MIDIDeviceDialog.h"
	"speexfile.cpp.patch")
sha256sums=("74538fbc2f1ef467b3e1376c6ff4e0f40b664fca1dbfb1fcaa2fb823d5f5a219"
		"85484468c0c433eefbc9a7a9b3f30755c3bb591253bb1b93d3a82f26371e329a"
		"f396e196c6f72c14ecc65614d3151dd402a2988befbd829357eba1b8094846ce"
		"c6608b8d2cff4b7cddea357153d64e9e5b9ef97081d77cd34526639c28ff0010"
		"eba407f69d83d94071fc7987744346b041b66a07874ed4c5998e2ace758f593f"
		"505ce52b599f154a2eb090ae46234053b7bf47a69bfdcd1539e68094b34c806c")
options=('!libtool')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	patch -Np1 < "$srcdir/gcc-4.4.patch"
	patch -Np1 < "$srcdir/speexfile.cpp.patch"
	for _i in TagsDialog.h DeviceFrame.cpp MIDIDeviceDialog.h
	do
		cp "$srcdir/${_i}" examples/wxPlayer
	done

	sed -ie 's/wxOPEN/wxFD_OPEN/g' examples/wxPlayer/{MIDIDeviceFrame,DeviceFrame}.cpp 
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr --with-pic --without-dumb
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
