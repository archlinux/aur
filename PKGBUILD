# Contributor: Sebastian Vandekerckhove <ptitfox@scarlet.be>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=audiere
pkgver=1.9.4
pkgrel=10
pkgdesc="High-level audio API. It can play Ogg Vorbis, MP3, FLAC, uncompressed WAV, AIFF, MOD, S3M, XM, and IT files"
arch=('i686' 'x86_64')
url="http://audiere.sourceforge.net/"
license=('LGPL')
depends=('speex' 'wxgtk' 'libvorbis' 'libcdaudio')
optdepends=('flac: for flac format')
source=(http://downloads.sourceforge.net/sourceforge/audiere/audiere-1.9.4.tar.gz gcc-4.4.patch TagsDialog.h DeviceFrame.cpp MIDIDeviceDialog.h speexfile.cpp.patch)
md5sums=('b95dfe6f1e69cfd12371747f22772766' 'bd082fa9a258ef6598eefe88a71a4279'\
         '55c31ad9a68304f49f30ac8ca9fa3288' '0fe69aeb84a6860ef7a36f75887f4f07'\
         'a80de799a3b833f0331cf83f7f6a27ab' '8dd3fd42cb0ff4961ec050fc859bcf63')
options=('!libtool')

build() {
    cd $srcdir/$pkgname-$pkgver
    msg "Apply patch ..."
    patch -Np1 < $srcdir/gcc-4.4.patch || return 1
    patch -Np1 < $srcdir/speexfile.cpp.patch || return 1
    for _i in TagsDialog.h DeviceFrame.cpp MIDIDeviceDialog.h
    do
      cp $srcdir/${_i} examples/wxPlayer || return 1
    done
    ./configure --prefix=/usr --with-pic --without-dumb || return 1
	sed -ie 's/wxOPEN/wxFD_OPEN/g' examples/wxPlayer/{MIDIDeviceFrame,DeviceFrame}.cpp 
    make || return 1
}
package() {
    cd $srcdir/$pkgname-$pkgver
    make DESTDIR=$pkgdir install || return 1
}
