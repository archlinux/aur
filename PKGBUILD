# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: orumin <dev@orum.in>

_basename=gst-plugins-bad
pkgname=lib32-gst-plugins-bad
pkgver=1.14.4
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Bad Plugins (32-bit)"
url="https://gstreamer.freedesktop.org/"
arch=(x86_64)
license=(LGPL)
depends=(lib32-aom lib32-bluez-libs lib32-celt lib32-chromaprint lib32-curl lib32-faac lib32-faad2
         lib32-fluidsynth lib32-glu lib32-gnutls lib32-gst-plugins-base-libs lib32-ladspa
         lib32-lcms2 lib32-libbs2b lib32-libdc1394 lib32-libdca lib32-libde265 lib32-libdvdnav
         lib32-libdvdread lib32-libexif lib32-libfdk-aac lib32-libgme lib32-libgudev lib32-libkate
         lib32-libmms lib32-libmodplug lib32-libmpcdec  lib32-libmpeg2 lib32-libnice lib32-libofa
         lib32-libsrtp lib32-libusb lib32-libvdpau lib32-libwebp lib32-lilv lib32-mjpegtools
         lib32-neon lib32-openal lib32-opencv lib32-openexr lib32-openjpeg2 lib32-rtmpdump lib32-sbc
         lib32-soundtouch lib32-spandsp lib32-srt lib32-vulkan-icd-loader lib32-wayland
         lib32-webrtc-audio-processing lib32-wildmidi lib32-x265 lib32-zbar lib32-zvbi gst-plugins-bad)
makedepends=(autoconf-archive git gobject-introspection lib32-gtk3 lib32-librsvg lib32-libtiger
             python vulkan-headers lib32-vulkan-validation-layers)
_commit=566e4ecc223b18fce8bd932f5e4885f41f746dd4  # tags/1.14.4^0
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
        --disable-flite

    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

check() {
    cd $_basename

    # bad tests are bad
    #make -k check || :
}

package() {
    cd $_basename

    make DESTDIR="$pkgdir" install

    cd "$pkgdir/usr"

    rm -r include share
}
