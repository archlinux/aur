# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: orumin <dev@orum.in>

_basename=gst-plugins-bad
pkgname=lib32-gst-plugins-bad
pkgver=1.16.1
pkgrel=3
pkgdesc="GStreamer open-source multimedia framework bad plugins (32-bit)"
url="https://gstreamer.freedesktop.org/"
arch=(x86_64)
license=(LGPL)
depends=(lib32-aom lib32-bluez-libs lib32-celt lib32-chromaprint lib32-curl lib32-faac lib32-faad2
        lib32-fluidsynth lib32-gnutls lib32-gst-plugins-base-libs lib32-gst-plugins-good lib32-ladspa
        lib32-lcms2 lib32-libbs2b lib32-libdc1394 lib32-libdca lib32-libde265 lib32-libdvdnav
        lib32-libdvdread lib32-libexif lib32-libfdk-aac lib32-libgme lib32-libgudev lib32-libkate
        lib32-liblrdf lib32-libmms lib32-libmodplug lib32-libmpcdec lib32-libmpeg2 lib32-libnice
        lib32-libofa lib32-librsvg lib32-libsrtp lib32-libusb lib32-libvdpau lib32-libwebp lib32-lilv
        lib32-lv2 lib32-mjpegtools lib32-neon lib32-openal lib32-openexr lib32-openjpeg2 lib32-rtmpdump
        lib32-sbc lib32-soundtouch lib32-spandsp lib32-srt lib32-vulkan-icd-loader lib32-wayland
        lib32-webrtc-audio-processing lib32-wildmidi lib32-x265 lib32-zbar lib32-zvbi
        gst-plugins-bad)
makedepends=(git gobject-introspection lib32-gtk3 lib32-libtiger lib32-vulkan-validation-layers lv2
             meson python vulkan-headers)
_commit=c3c54aad2d45fb246a9b9e8a5e05488c15c27173  # tags/1.16.1^0
source=("git+https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad.git#commit=$_commit"
        'gst-common::git+https://gitlab.freedesktop.org/gstreamer/common.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd $_basename

    git describe --tags | sed 's/-/+/g'
}

prepare() {
    cd $_basename

    git submodule init
    git config --local submodule.common.url "$srcdir/gst-common"
    git submodule update

    sed -e 's|-std=c++98||' -i ext/openexr/Makefile.am # openexr 2.4 requires c++11
    sed -e "s|'-std=c++98'||" -i ext/openexr/meson.build
}

build() {
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG='/usr/bin/i686-pc-linux-gnu-pkg-config'

    arch-meson $_basename build \
        --libdir=/usr/lib32 \
        -D directfb=disabled \
        -D flite=disabled \
        -D gsm=disabled \
        -D iqa=disabled \
        -D msdk=disabled \
        -D nvdec=disabled \
        -D nvenc=disabled \
        -D opencv=disabled \
        -D openh264=disabled \
        -D openmpt=disabled \
        -D openni2=disabled \
        -D opensles=disabled \
        -D sctp=disabled \
        -D tinyalsa=disabled \
        -D voaacenc=disabled \
        -D voamrwbenc=disabled \
        -D wasapi=disabled \
        -D wpe=disabled \
        -D gl=disabled \
        -D gobject-cast-checks=disabled \
        -D glib-asserts=disabled \
        -D glib-checks=disabled \
        -D package-name="GStreamer Bad Plugins (Arch Linux)" \
        -D package-origin="https://www.archlinux.org/"

    ninja -C build

}

check() {
    meson test -C build --print-errorlogs
}

package() {
    DESTDIR="$pkgdir" meson install -C build

    rm -rf "${pkgdir}"/usr/{bin,include,share}
}
