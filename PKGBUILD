# Maintainer: orumin <dev@orum.in>

_basename=gst-plugins-bad
pkgname="lib32-$_basename"
pkgver=1.8.1
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Bad Plugins (32-bit)"
arch=('x86_64')
license=(LGPL)
url="http://gstreamer.freedesktop.org/"
depends=('mjpegtools' 'lib32-gst-plugins-base-libs' 'curl' 'lib32-chromaprint' 'lib32-libmms' 
         'lib32-faad2' 'lib32-faac' 'lib32-celt' 'lib32-libdca' 'lib32-soundtouch' 'lib32-spandsp'
         'lib32-libdvdnav' 'lib32-libmodplug' 'lib32-libgme' 'lib32-wayland' 'lib32-neon' 'lib32-libofa'
         'lib32-fluidsynth' 'lib32-openjpeg' 'lib32-libwebp' 'lib32-libsrtp' 'lib32-gnutls' 'lib32-wildmidi'
         'lib32-glu' 'lib32-sbc' 'lib32-rtmpdump' 'lib32-libgudev' 'lib32-graphene' 'gst-plugins-bad')
makedepends=('lib32-schroedinger' 'lib32-libexif' 'lib32-libdvdread' 'lib32-libvdpau' 'lib32-libmpeg2'
             'python' 'valgrind-multilib' 'lib32-wildmidi' 'lib32-librsvg' 'gobject-introspection'
             'lib32-gtk3' 'lib32-clutter' 'lib32-libtiger' 'lib32-ladspa' 'lib32-openal' 'lib32-libusb'
             'vulkan-headers' 'vulkan-icd-loader')
options=(!emptydirs)
source=(${url}/src/$_basename/$_basename-$pkgver.tar.xz)
sha256sums=('0bbd58f363734fc0c4a620b2d6fb01d427fdafdbda7b90b4e15d03b751ca40f5')

prepare() {
  cd $_basename-$pkgver
  autoreconf -vi
}

build() {
  cd $_basename-$pkgver

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --build=i686-pc-linux-gnu --libdir=/usr/lib32 \
    --disable-static --enable-experimental --disable-gtk-doc \
    --with-package-name="GStreamer Bad Plugins (Arch Linux)" \
    --with-package-origin="http://www.archlinux.org/" \
    --with-gtk=3.0

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

check() {
  cd $_basename-$pkgver
  # don't have a camera for the camerabin test
  make -k check || :
}

package() {
  cd $_basename-$pkgver
  make DESTDIR="${pkgdir}" install

  cd "$pkgdir"/usr
  rm -r include share
}
