# $Id$
# Maintainer: Ole André Vadla Ravnås <oleavr@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

_name=gst-plugins-good
pkgname=gst-plugins-good-oleavr
pkgver=1.12.0.r545.g770bb07f3
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Good Plugins"
url="https://github.com/oleavr/gst-plugins-good"
arch=(i686 x86_64)
license=(LGPL)
depends=(libpulse jack libsoup gst-plugins-base-libs wavpack aalib taglib libdv libshout libvpx
         gdk-pixbuf2 libcaca libavc1394 libiec61883 libxdamage v4l-utils cairo libgudev speex flac
         libraw1394)
makedepends=(python gtk-doc autoconf-archive git)
checkdepends=(gst-plugins-base)
provides=("$_name")
conflicts=("$_name")
source=("git+https://github.com/oleavr/gst-plugins-good"
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
    --with-package-name="GStreamer Good Plugins (Arch Linux)" \
    --with-package-origin="https://www.archlinux.org/" \
    --disable-fatal-warnings \
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
