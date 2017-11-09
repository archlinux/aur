# $Id$
# Maintainer: Ole André Vadla Ravnås <oleavr@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

_name=gstreamer
pkgname=gstreamer-oleavr
pkgver=1.12.0.r189.ge1f039b7f
pkgrel=1
pkgdesc="GStreamer open-source multimedia framework core library"
url="https://github.com/oleavr/gstreamer"
arch=(i686 x86_64)
license=(LGPL)
depends=(libxml2 glib2 libunwind libcap libelf)
makedepends=(intltool pkgconfig gtk-doc gobject-introspection autoconf-archive git
             valgrind bash-completion)
checkdepends=(gmp gsl gtk3)
provides=("$_name")
conflicts=("$_name")
install=gstreamer.install
source=("git+https://github.com/oleavr/gstreamer"
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
    --with-package-name="GStreamer (Arch Linux)" \
    --with-package-origin="https://www.archlinux.org/" \
    --disable-fatal-warnings \
    --enable-gtk-doc --disable-static

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
