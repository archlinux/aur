# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
# Contributor: Aaron 'venisonslurpee' Laursen <venisonslurpee@gmail.com>
# Contributor: Christopher Rosell <chrippa@tanuki.se>
# Contributor: lh <jarryson@gmail.com>
# Contributor: Sebastian Schwarz <seschwar@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Xilon <xilon@gmail.com>

pkgname=xmms2-git
pkgver=0.8DrO_o.862.g10d457e
pkgrel=1
pkgdesc="X-platform Music Multiplexing System 2"
arch=(armv6h i686 x86_64)
url="https://xmms2.org/"
license=(GPL LGPL)
_depends=('alsa-lib: ALSA output'
          'avahi: announce xmms2d via bonjour/mDNS/zeroconf'
          'boost: C++ bindings'
          'curl: play HTTP streams'
          'cython: Python bindings'
          'faad2: AAC support'
          'ffmpeg: WMA, avcodec & avformat support'
          'fftw: visualization'
          'flac: FLAC support'
          'fluidsynth: MIDI support'
          'jack: JACK output'
          'libao: libao output'
          'libcdio-paranoia: CDDA support'
          'libdiscid: CDDA support'
          'libgme: support for various video game music formats'
          'libmad: MP3 support'
          'libmms: play MMS streams'
          'libmodplug: MOD support'
          'libmpcdec: Musepack support'
          'libofa: MusicDNS fingerprinting'
          'libsamplerate: vocoder support'
          'libshout: Icecast output'
          'libvorbis: Ogg Vorbis support'
          'libxml2: XSPF and podcast support'
          'mac: APE support'
          'mpg123: alternative MP3 support'
          'opusfile: Opus support'
          'perl: Perl bindings'
          'ruby: Ruby bindings'
          'sidplay2-libs: support for C64 music files'
          'smbclient: direct CIFS/SMB access'
          'speex: Speex support'
          'wavpack: WavPack support')
depends=(glib2 readline)
makedepends=("${_depends[@]%%:*}" libpulse python2)
checkdepends=(cunit valgrind)
optdepends=("${_depends[@]}" 'oss: OSS output' 'pulseaudio: PulseAudio output')
provides=(xmms2)
conflicts=(xmms2 xmms2-devel)
install=install.sh
source=(git://git.xmms2.org/xmms2/xmms2-devel.git
        tmpfiles.conf
        system.service
        user.service)
md5sums=('SKIP'
         'd3ab09ed8d1cf982468d1ceb141d4a9d'
         '4b026ab80e853f24b5cf13b310afb83c'
         'f773f674882946065c02e36e9548eb00')

pkgver() {
    cd "$srcdir/xmms2-devel"
    git describe --always | sed 's/-/./g'
}

prepare() {
    cd "$srcdir/xmms2-devel"
    git submodule update --init
    sed -i '$a#define AVCODEC_MAX_AUDIO_FRAME_SIZE 192000 /* 1 second of 48kHz 32bit audio */' src/plugins/avcodec/avcodec_compat.h
    sed -i 's,#include <cdio/cdda.h>,#include <cdio/paranoia/cdda.h>,' src/plugins/cdda/cdda.c
    sed -i 's,libsmbclient.h,samba-4.0/libsmbclient.h,' src/plugins/samba/{samba.c,wscript}
}

build() {
    cd "$srcdir/xmms2-devel"
    ./waf configure --prefix=/usr --sbindir=/usr/bin --without-ldconfig \
            --with-ruby-archdir=`ruby -e 'puts RbConfig::CONFIG["vendorarchdir"]'` \
            --with-ruby-libdir=`ruby -e 'puts RbConfig::CONFIG["vendorlibdir"]'` --without-optionals=python
    ./waf build
}

check() {
    cd "$srcdir/xmms2-devel"
    ./waf --alltests
}

package() {
    cd "$srcdir/xmms2-devel"
    ./waf --destdir="$pkgdir" install
    install -d -o46 -g46 "$pkgdir/var/lib/xmms2"
    install -Dm0644 "$srcdir/tmpfiles.conf" \
            "$pkgdir/usr/lib/tmpfiles.d/xmms2.conf"
    install -Dm0644 "$srcdir/system.service" \
            "$pkgdir/usr/lib/systemd/system/xmms2d.service"
    install -Dm0644 "$srcdir/user.service" \
            "$pkgdir/usr/lib/systemd/user/xmms2d.service"

    # Python/cython are causing problems.
    # So, I commented it out until I or someone else can figure out how to fix it.
    ## also install python2 bindings
    #PYTHON=/usr/bin/python2 ./waf configure --prefix=/usr \
            #--with-optionals=python --without-xmms2d
    #./waf build
    ./waf --destdir="$pkgdir" install
}
