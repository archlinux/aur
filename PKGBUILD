# $Id$
# Maintainer: Ole André Vadla Ravnås <oleavr@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

_name=gst-libav
pkgname=gst-libav-oleavr
pkgver=1.12.0.r30.gc97d498
pkgrel=1
pkgdesc="GStreamer Multimedia Framework ffmpeg Plugin"
url="https://github.com/oleavr/gst-libav"
arch=(i686 x86_64)
license=(GPL)
depends=(gst-plugins-base-libs bzip2 ffmpeg)
makedepends=(python gtk-doc autoconf-archive git valgrind yasm)
provides=("$_name" "gst-ffmpeg=$pkgver-$pkgrel")
conflicts=("$_name")
source=("git+https://github.com/oleavr/gst-libav"
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
    --with-package-name="GStreamer ffmpeg Plugin (Arch Linux)" \
    --with-package-origin="https://www.archlinux.org/" \
    --disable-fatal-warnings \
    --without-system-libav --with-libav-extra-configure="--enable-runtime-cpudetect" \
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
