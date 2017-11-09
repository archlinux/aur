# $Id$
# Maintainer: Ole André Vadla Ravnås <oleavr@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

_name=gst-plugins-bad
pkgname=gst-plugins-bad-oleavr
pkgver=1.12.0.r573.g3079a723c
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Bad Plugins"
url="https://github.com/oleavr/gst-plugins-bad"
arch=(i686 x86_64)
license=(LGPL)
depends=(mjpegtools gst-plugins-base-libs curl chromaprint libmms faad2 celt libdca libdvdnav
         libmodplug libgme wayland libofa openjpeg2 libwebp libsrtp gnutls glu sbc rtmpdump
         libgudev graphene schroedinger libexif libdvdread libvdpau libmpeg2 wildmidi ladspa
         openal libusb vulkan-icd-loader libfdk-aac faac soundtouch spandsp neon
         webrtc-audio-processing libdc1394 libmpcdec zvbi)
makedepends=(python valgrind gobject-introspection gtk-doc git autoconf-archive vulkan-headers
             gtk3 clutter librsvg libtiger qt5-declarative qt5-x11extras qt5-wayland zbar
             fluidsynth lilv opencv openexr)
provides=("$_name")
conflicts=("$_name")
source=("git+https://github.com/oleavr/gst-plugins-bad"
        "gst-common::git+https://anongit.freedesktop.org/git/gstreamer/common")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/$_name"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_name"

  git submodule init
  git config --local submodule.common.url "$srcdir/gst-common"
  git submodule update

  sed -i 's/cmu_us_kal/&16/g' configure.ac ext/flite/gstflitetestsrc.c

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "$srcdir/$_name"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib \
    --with-package-name="GStreamer Bad Plugins (Arch Linux)" \
    --with-package-origin="https://www.archlinux.org/" \
    --disable-fatal-warnings \
    --with-gtk=3.0 \
    --enable-experimental --enable-gtk-doc --disable-static

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

check() {
  cd "$srcdir/$_name"
  # bad tests are bad
  #make -k check || :
}

package() {
  cd "$srcdir/$_name"
  make DESTDIR="$pkgdir" install
}
