# Maintainer: Chris Kitching <chriskitching@linux.com>

_basename=gst-plugins-base
pkgbase=lib32-$_basename
pkgname=('lib32-gst-plugins-base-libs' 'lib32-gst-plugins-base')
pkgver=1.6.2
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Base Plugins"
arch=('i686' 'x86_64')
license=('LGPL')
makedepends=('pkgconfig' 'lib32-gstreamer' 'lib32-orc' 'lib32-libxv' 'lib32-alsa-lib' 'lib32-cdparanoia' 'lib32-libvisual' 'lib32-libvorbis' 'lib32-libtheora' 'pango' 'gobject-introspection' 'python2')
options=(!emptydirs)
url="http://gstreamer.freedesktop.org/"
source=(${url}/src/$_basename/$_basename-${pkgver}.tar.xz)
sha256sums=('c75dd400e451526ed71e1c4955e33d470a2581f5e71ecf84920a41c0a5c75322')

build() {
  cd $_basename-$pkgver

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure\
    --build=i686-pc-linux-gnu\
    --prefix=/usr\
    --sysconfdir=/etc\
    --localstatedir=/var\
    --libexecdir=/usr/lib32\
    --libdir=/usr/lib32\
    --disable-static\
    --disable-examples\
    --disable-gtk-doc-html\
    --enable-experimental \
    --with-package-name="GStreamer Base Plugins (Arch Linux)" \
    --with-package-origin="http://www.archlinux.org/"

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make

  sed -e 's/^SUBDIRS_EXT =.*/SUBDIRS_EXT =/' -i Makefile
}

check() {
  cd $_basename-$pkgver
  # Testsuite fails on one test. Some refcount leak
  make check
}

package_lib32-gst-plugins-base-libs() {
  pkgdesc="GStreamer Multimedia Framework Base Plugin libraries"
  depends=('lib32-gstreamer' 'lib32-orc' 'lib32-libxv')

  cd $_basename-$pkgver
  make DESTDIR="${pkgdir}" install

  rm -Rf ${pkgdir}/usr/share
  rm -Rf ${pkgdir}/usr/include
  rm -Rf ${pkgdir}/usr/bin
}

package_lib32-gst-plugins-base() {
  depends=("lib32-gst-plugins-base-libs=$pkgver" 'lib32-alsa-lib' 'lib32-cdparanoia' 'lib32-libvisual' 'lib32-libvorbis' 'lib32-libtheora' 'pango')

  cd $_basename-$pkgver
  make -C gst-libs DESTDIR="${pkgdir}" install
  make -C ext DESTDIR="${pkgdir}" install
  make -C gst-libs DESTDIR="${pkgdir}" uninstall

  # Seems to be no build flag to turn this crap off, soo...
  rm -Rf ${pkgdir}/usr/share
  rm -Rf ${pkgdir}/usr/include
  rm -Rf ${pkgdir}/usr/bin
}
