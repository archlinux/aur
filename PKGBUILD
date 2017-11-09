# $Id$
# Maintainer: Ole André Vadla Ravnås <oleavr@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

_name=gst-plugins-base
pkgbase=gst-plugins-base-oleavr
pkgname=(gst-plugins-base-libs-oleavr gst-plugins-base-oleavr)
pkgver=1.12.0.r218.gb9aaa7f4f
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Base Plugins"
url="https://github.com/oleavr/gst-plugins-base"
arch=(i686 x86_64)
license=(LGPL)
makedepends=(gstreamer orc libxv iso-codes alsa-lib cdparanoia libvisual libvorbis libtheora pango
             opus gobject-introspection gtk-doc autoconf-archive git pkgconfig)
checkdepends=(gtk3 qt5-base)
options=(!emptydirs)
source=("git+https://github.com/oleavr/gst-plugins-base"
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

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "$srcdir/$_name"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib \
    --with-package-name="GStreamer Base Plugins (Arch Linux)" \
    --with-package-origin="https://www.archlinux.org/" \
    --disable-fatal-warnings \
    --enable-experimental --enable-gtk-doc --disable-static

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make

  sed -e 's/^SUBDIRS_EXT =.*/SUBDIRS_EXT =/' -i Makefile
}

check() {
  cd "$srcdir/$_name"
  make check
}

package_gst-plugins-base-libs-oleavr() {
  pkgdesc="GStreamer Multimedia Framework Base Plugin libraries"
  depends=(gstreamer orc libxv iso-codes)
  provides=("$_name-libs")
  conflicts=("$_name-libs")

  cd "$srcdir/$_name"
  make DESTDIR="$pkgdir" install
}

package_gst-plugins-base-oleavr() {
  depends=("gst-plugins-base-libs-oleavr=$pkgver" alsa-lib cdparanoia libvisual libvorbis
           libtheora pango opus)
  provides=("$_name")
  conflicts=("$_name")

  cd "$srcdir/$_name"
  make -C gst-libs DESTDIR="$pkgdir" install
  make -C ext DESTDIR="$pkgdir" install
  make -C gst-libs DESTDIR="$pkgdir" uninstall
}
