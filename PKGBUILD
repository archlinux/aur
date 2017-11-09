# $Id$
# Maintainer: Ole André Vadla Ravnås <oleavr@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

_name=gstreamer
pkgname=gstreamer-oleavr
pkgver=1.12.0.r189.g938ad6b2d
pkgrel=1
pkgdesc="GStreamer open-source multimedia framework core library"
url="https://gstreamer.freedesktop.org/"
arch=(i686 x86_64)
license=(LGPL)
depends=(libxml2 glib2 libunwind libcap libelf)
makedepends=(intltool pkgconfig gtk-doc gobject-introspection autoconf-archive git
             valgrind bash-completion)
checkdepends=(gmp gsl gtk3)
provides=("$_name")
conflicts=("$_name")
install=gstreamer.install
source=("git+https://github.com/oleavr/gstreamer#branch=master"
        "gst-common::git+https://anongit.freedesktop.org/git/gstreamer/common")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname

  git submodule init
  git config --local submodule.common.url "$srcdir/gst-common"
  git submodule update

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib \
    --with-package-name="GStreamer (Arch Linux)" \
    --with-package-origin="https://www.archlinux.org/" \
    --enable-gtk-doc --disable-static

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

check() {
  cd $pkgname
  make check
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
