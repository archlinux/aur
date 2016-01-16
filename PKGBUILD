# Maintainer: Chris Kitching <chriskitching@linux.com>

pkgname=lib32-gstreamer
pkgver=1.6.2
pkgrel=1
pkgdesc="GStreamer Multimedia Framework"
arch=('x86_64')
license=('LGPL')
url="http://gstreamer.freedesktop.org/"
depends=('libxml2' 'glib2')
optdepends=('sh: feedback script')
makedepends=('intltool' 'pkgconfig' 'gtk-doc' 'gobject-introspection' 'python2')
source=(${url}/src/gstreamer/gstreamer-${pkgver}.tar.xz)
sha256sums=('5896716bd8e089dba452932a2eff2bb6f6c9d58ff64a96635d157f1ffaf8feb2')

build() {
  cd "${srcdir}/gstreamer-${pkgver}"

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
    --disable-maintainer-mode\
    --disable-debug\
    --disable-examples\
    --disable-tests\
    --with-package-name="GStreamer (Arch Linux)" \
    --with-package-origin="http://www.archlinux.org/" \
    --disable-static\
    --disable-docbook\
    --disable-gtk-doc-html\
    --disable-gtk-doc-pdf\
    --disable-gtk-doc\
    --disable-gst-debug \
    --disable-benchmarks\
    --disable-tools

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd "${srcdir}/gstreamer-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Evil hack because the config options don't let us stop making this crap...
  rm -R ${pkgdir}/usr/share
  rm -R ${pkgdir}/usr/include
}
