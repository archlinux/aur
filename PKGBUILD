# Maintainer: orumin <dev@orum.in>

_basename=gst-plugins-bad
pkgname="lib32-$_basename"
pkgver=1.12.1
pkgrel=3
pkgdesc="GStreamer Multimedia Framework Bad Plugins (32-bit)"
url="https://gstreamer.freedesktop.org/"
arch=('x86_64')
license=(LGPL)
depends=(mjpegtools lib32-gst-plugins-base-libs lib32-chromaprint lib32-libmms
         lib32-faad2 lib32-celt lib32-libdca lib32-libdvdnav lib32-libmodplug lib32-libgme
         lib32-wayland lib32-openjpeg2 lib32-libwebp lib32-libsrtp lib32-gnutls
         lib32-glu lib32-sbc lib32-rtmpdump lib32-libgudev lib32-graphene lib32-schroedinger
         lib32-libexif lib32-libdvdread lib32-libvdpau lib32-libmpeg2 lib32-wildmidi lib32-ladspa
         lib32-openal lib32-libusb lib32-vulkan-icd-loader lib32-libfdk-aac lib32-faac lib32-soundtouch
         lib32-spandsp lib32-neon lib32-webrtc-audio-processing lib32-libdc1394 lib32-libmpcdec
         lib32-zvbi gst-plugins-bad)
# lib32-libofa adn lib32-curl disabled
makedepends=(python valgrind-multilib gobject-introspection git autoconf-archive vulkan-headers
             lib32-gtk3 lib32-clutter lib32-librsvg lib32-libtiger lib32-fluidsynth lib32-opencv lib32-openexr)
_commit=30f004de7fa9fd83b32b1f9be0f35e660e546f8f  # tags/1.12.1^0
source=(${url}/src/$_basename/$_basename-$pkgver.tar.xz)
source=("git+https://anongit.freedesktop.org/git/gstreamer/gst-plugins-bad#commit=$_commit"
        "gst-common::git+https://anongit.freedesktop.org/git/gstreamer/common")
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

  sed -i 's/cmu_us_kal/&16/g' configure.ac ext/flite/gstflitetestsrc.c

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_basename

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --build=i686-pc-linux-gnu --libdir=/usr/lib32 \
    --with-package-name="GStreamer Bad Plugins (Arch Linux)" \
    --with-package-origin="http://www.archlinux.org/" \
    --with-gtk=3.0 \
    --disable-static --enable-experimental --disable-gtk-doc \
    --disable-lv2 --disable-ofa --disable-curl --disable-qt --disable-x265

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
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
  make DESTDIR="${pkgdir}" install

  cd "$pkgdir"/usr
  rm -r include share
}
