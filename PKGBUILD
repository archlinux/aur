# $Id$
# Maintainer: Ole André Vadla Ravnås <oleavr@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

_name=gst-plugins-ugly
pkgname=gst-plugins-ugly-oleavr
pkgver=1.12.0.r38.g83d7d2f6
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Ugly Plugins"
url="https://github.com/oleavr/gst-plugins-ugly"
arch=(i686 x86_64)
license=(LGPL)
depends=(gst-plugins-base-libs libdvdread lame libmpeg2 a52dec libsidplay
         libcdio libx264 libx264-all opencore-amr mpg123)
makedepends=(python gtk-doc x264 autoconf-archive git valgrind)
provides=("$_name")
conflicts=("$_name")
source=("git+https://github.com/oleavr/gst-plugins-ugly"
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
    --with-package-name="GStreamer Ugly Plugins (Arch Linux)" \
    --with-package-origin="https://www.archlinux.org/" \
    --disable-fatal-warnings \
    --with-x264-libraries="/usr/lib/x264/libx264-8bit.so:/usr/lib/x264/libx264-10bit.so" \
    --enable-experimental --enable-gtk-doc --disable-static

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

check() {
  cd "$srcdir/$_name"
  make check
}

package() {
  cd "$srcdir/$_name"
  make DESTDIR="$pkgdir" install
}
