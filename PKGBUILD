# Maintainer: Maxime Gauduin <alucryd@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgbase=lib32-gstreamer0.10-base
pkgname=('lib32-gstreamer0.10-base' 'lib32-gstreamer0.10-base-plugins')
pkgver=0.10.36
pkgrel=7
arch=('x86_64')
url='http://gstreamer.freedesktop.org/'
license=('LGPL')
makedepends=('lib32-alsa-lib' 'lib32-cdparanoia' 'lib32-gstreamer0.10'
             'lib32-libgl' 'lib32-libtheora' 'lib32-libvisual'
             'lib32-libvorbis' 'lib32-libxv' 'lib32-orc' 'lib32-pango')
options=('!emptydirs')
source=("http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-${pkgver}.tar.xz")
sha256sums=('1fe45c3894903001d4d008b0713dab089f53726dcb5842d5b40c2595a984e64a')

build() {
  cd gst-plugins-base-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --localstatedir='/var' \
    --sysconfdir='/etc' \
    --with-package-name='GStreamer Base Plugins (Archlinux Multilib)' \
    --with-package-origin='http://www.archlinux.org/' \
    --enable-experimental \
    --disable-examples \
    --disable-gnome_vfs \
    --disable-introspection \
    --disable-static
  make
  sed -e 's/^SUBDIRS_EXT =.*/SUBDIRS_EXT =/' -i Makefile
}

package_lib32-gstreamer0.10-base() {
  pkgdesc='GStreamer Multimedia Framework Base plugin libraries'
  depends=('gstreamer0.10-base' 'lib32-gstreamer0.10' 'lib32-orc'
           'lib32-libxv')

  cd gst-plugins-base-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}

package_lib32-gstreamer0.10-base-plugins() {
  pkgdesc='GStreamer Multimedia Framework Base Plugins (gst-plugins-base)'
  depends=('gstreamer0.10-base-plugins' 'lib32-alsa-lib' 'lib32-cdparanoia'
           'lib32-gstreamer0.10-base' 'lib32-libtheora' 'lib32-libvisual'
           'lib32-libvorbis' 'lib32-pango')

  cd gst-plugins-base-${pkgver}

  make -C gst-libs DESTDIR="${pkgdir}" install
  make -C ext DESTDIR="${pkgdir}" install
  make -C gst-libs DESTDIR="${pkgdir}" uninstall
}

# vim: ts=2 sw=2 et:
