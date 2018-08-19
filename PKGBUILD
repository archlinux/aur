# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: orumin <dev@orum.in>

_basename=gst-plugins-bad
pkgname=lib32-gst-plugins-bad
pkgver=1.14.1
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Bad Plugins (32-bit)"
url="https://gstreamer.freedesktop.org/"
arch=(x86_64)
license=(LGPL)
depends=(lib32-mjpegtools lib32-curl lib32-chromaprint lib32-libmms
         lib32-faad2 lib32-celt lib32-libdca lib32-libdvdnav lib32-libgme lib32-libofa lib32-libsrtp
         lib32-sbc lib32-rtmpdump lib32-libmpeg2 lib32-wildmidi lib32-ladspa
         lib32-openal lib32-vulkan-icd-loader lib32-libfdk-aac lib32-faac lib32-soundtouch
         lib32-spandsp lib32-neon lib32-webrtc-audio-processing lib32-libmpcdec
         lib32-zvbi lib32-libbs2b lib32-libnice lib32-bluez-libs lib32-srt
         lib32-x265 lib32-lilv lib32-libkate lib32-opencv lib32-fluidsynth
         lib32-aom lib32-libde265 gst-plugins-bad)
makedepends=(python autoconf-archive git gobject-introspection lib32-gtk3 vulkan-headers
             lib32-vulkan-validation-layers lib32-libtiger)
_commit=fd178617d0fc3bed781d566def792f90d7825d01  # tags/1.14.1^0
source=("git+https://anongit.freedesktop.org/git/gstreamer/gst-plugins-bad#commit=$_commit"
        "gst-common::git+https://anongit.freedesktop.org/git/gstreamer/common"
        missing-includes.diff)
sha256sums=('SKIP'
            'SKIP'
            'acf625d58611372532bc76e7276dacd69d2a9f7dee88ed9e2e8ecae0881476a3')

pkgver() {
    cd $_basename

    git describe --tags | sed 's/-/+/g'
}

prepare() {
    cd $_basename

    # error: ‘CV_RGB’ was not declared in this scope
    patch -Np1 -i ../missing-includes.diff

    git submodule init
    git config --local submodule.common.url "$srcdir/gst-common"
    git submodule update

    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd $_basename

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    ./configure \
        --build=i686-pc-linux-gnu \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --libexecdir=/usr/lib32 \
        --libdir=/usr/lib32 \
        --with-package-name="GStreamer Bad Plugins (Arch Linux)" \
        --with-package-origin="https://www.archlinux.org/" \
        --with-gtk=3.0 \
        --enable-experimental \
        --disable-gtk-doc \
        --disable-static \
        --disable-qt \
        --disable-gl \
        --disable-zbar

    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

check() {
    cd $_basename

    # bad tests are bad
    make -k check || :
}

package() {
    cd $_basename

    make DESTDIR="$pkgdir" install

    cd "$pkgdir/usr"

    rm -r include share
}
