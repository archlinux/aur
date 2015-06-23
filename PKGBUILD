# Contributor: Stas Bourakov <sbourakov(at)gmail.com>

pkgname=xine-lib_for_enigma2
pkgver=20140610
pkgrel=1
pkgdesc="Xine-lib, version, created only for the Enigma2 project."
arch=('i686' 'x86_64')
url="https://github.com/Raider05/enigma2pc"
license=('GPL2')
depends=('gcc-libs' 'pulseaudio' 'ffmpeg')
makedepends=('git' 'make')
conflicts=('xine-lib_for_openpli-e2' 'xine-lib')
source=('git://github.com/Raider05/enigma2pc.git'
	'codec.patch')
provides=('xine-lib')
conflicts=('xine-lib')
_gitname='enigma2pc'

pkgver() {
  cd "$srcdir/$_gitname"
  git log -1 --pretty=format:%cd --date=short | sed 's/-//g'
}

package() {
    if [ -d "$srcdir/$_gitname-build" ]; then
      rm -rf "$srcdir/$_gitname-build"
    fi

    cp -r "$srcdir/$_gitname/xine-lib" "$srcdir/$_gitname-build" 
    cd "$srcdir/$_gitname-build"
#    patch -p2 -i $srcdir/codec.patch
####
  LANG=C ./autogen.sh --prefix=/usr \
               --disable-fb \
               --disable-vidix \
               --disable-dxr3 \
               --disable-sdl \
               --disable-xvmc \
               --disable-oss \
               --disable-syncfb \
               --disable-w32dll \
               --disable-musepack \
               --disable-samba \
               --disable-gdkpixbuf \
               --disable-modplug \
               --disable-real-codecs \
               --disable-gnomevfs \
               --disable-aalib \
               --disable-nosefart \
               --disable-modplug \
               --disable-vcd \
               --disable-vidix \
               --disable-xinerama \
               --disable-v4l \
               --disable-v4l2 \
               --disable-libv4l \
               --without-esound \
               --without-xcb \
               --without-imagemagick \
               --without-jack \
               --with-pulseaudio \
               --without-sdl \
               --without-speex \
               --without-wavpack \
               --without-caca \
               --disable-dvb \
               --enable-vdpau \
               --enable-vdr \
               --disable-dxr3 \
               --with-x \
               --with-alsa
               #--enable-debug
# if this xine-lib is too lean for you simply replace with:
# ./autogen.sh --disable-xinerama --disable-musepack --prefix=/usr 

      echo "build OpenPliPC xine-lib, please wait..."
      
    make `CXXFLAGS += -O2` || return 1
    make install DESTDIR=$pkgdir || return 1
}


md5sums=('SKIP'
         '88e2588c9d0287c553f966be6b64d79d')
