# $Id$
# Maintainer: Florent Thiéry <fthiery@gmail.com>
_pkgname=gst-plugins-bad
pkgname=$_pkgname-rpi-nox
pkgver=1.6.2
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Bad Plugins with compilation options optimized for RaspberryPi so that glimagesink works without Xorg"
arch=('armv6h' 'armv7h')
license=('LGPL')
url="http://gstreamer.freedesktop.org"
depends=('mjpegtools' 'gst-plugins-base-libs' 'curl' 'chromaprint' 'libmms' 'faad2' 'mpg123' 'faac' 'celt' 'libdca' 'soundtouch' 'spandsp' 'libdvdnav' 'libmodplug' 'libgme' 'opus' 'wayland' 'neon' 'libofa' 'fluidsynth' 'openjpeg' 'libwebp' 'libsrtp' 'gnutls' 'wildmidi' 'glu' 'sbc' 'rtmpdump' 'libgudev' 'raspberrypi-firmware-tools')
makedepends=('schroedinger' 'libexif' 'libdvdread' 'libvdpau' 'libmpeg2' 'python' 'wildmidi' 'librsvg' 'gobject-introspection' 'gtk-doc' 'libtiger' 'ladspa' 'libusb' 'raspberrypi-firmware-tools')
conflicts=('gst-plugins-bad')
options=(!emptydirs)
source=(${url}/src/$_pkgname/$_pkgname-$pkgver.tar.xz)
sha256sums=('650855e39ff56a8bb6cb0c192109c5926ce12f536d06e19ebf829de71ef396fe')

prepare() {
  cd $_pkgname-$pkgver
  autoreconf -vi
}

build() {
  cd $_pkgname-$pkgver

  ./configure CFLAGS="-I/opt/vc/include -I/opt/vc/include/interface/vcos/pthreads\
    -I/opt/vc/include/interface/vmcs_host/linux/" LDFLAGS="-L/opt/vc/lib" \
    --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-opengl  --disable-glx --enable-gles2 --enable-egl --enable-dispmanx \
    --with-gles2-module-name=/opt/vc/lib/libGLESv2.so --with-egl-module-name=/opt/vc/lib/libEGL.so \
    --disable-static --enable-experimental --enable-gtk-doc \
    --with-package-name="GStreamer Bad Plugins (Arch Linux)" \
    --with-package-origin="http://www.archlinux.org/" \
    --with-gtk=3.0

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

check() {
  cd $_pkgname-$pkgver
  # don't have a camera for the camerabin test
  make -k check || :
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
}
