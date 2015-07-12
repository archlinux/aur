# $Id: PKGBUILD 231646 2015-02-17 09:02:54Z jgc $
# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=libcanberra-git
_pkgbase=libcanberra
pkgname=(libcanberra-git libcanberra-pulse-git libcanberra-gstreamer-git)
pkgver=0.30.r2.gc0620e4
_pkgver=0.30
pkgrel=1
epoch=1
pkgdesc="A small and lightweight implementation of the XDG Sound Theme Specification"
arch=(i686 x86_64)
license=(LGPL)
depends=(libvorbis libltdl alsa-lib tdb sound-theme-freedesktop)
makedepends=(gtk-doc libpulse gstreamer gtk2 gtk3 git)
options=(!emptydirs libtool)
url="http://0pointer.de/lennart/projects/libcanberra"
source=("$pkgbase::git://git.0pointer.de/libcanberra.git" libcanberra.xinit)
sha256sums=('SKIP'
            '2158708f594ab1688d6207eb1659190b3e3a1f711191de1f8e45dd42be8ceb76')

_plugindir=usr/lib/$_pkgbase-$_pkgver

pkgver() {
  cd $pkgbase
  git describe --tags --long | sed -r 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

prepare() {
  cd $pkgbase
  ./autogen.sh
}

build() {
  cd $pkgbase
  ./configure --sysconfdir=/etc --prefix=/usr --localstatedir=/var \
      --disable-static --with-builtin=dso --enable-null --disable-oss \
      --enable-alsa --enable-gstreamer --enable-pulse \
      --with-systemdsystemunitdir=/usr/lib/systemd/system --enable-gtk-doc

  # Fight unused direct deps
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool

  make
}

package_libcanberra-git() {
  install=libcanberra.install
  optdepends=("$pkgbase-pulse: PulseAudio driver"
              "$pkgbase-gstreamer: GStreamer driver")
  provides=("$_pkgbase")
  conflicts=("$_pkgbase")

  cd $pkgbase

  make -j1 DESTDIR="$pkgdir" install
  rm "$pkgdir"/usr/lib/libcanberra-gtk*.la
  rm "$pkgdir"/usr/lib/gtk-{2,3}.0/modules/*.la

  install -D "$srcdir/libcanberra.xinit" \
    "$pkgdir/etc/X11/xinit/xinitrc.d/40-libcanberra-gtk-module.sh"

  # Split plugins
  for _p in pulse gstreamer; do
    mkdir ../$_p-plugin
    mv "$pkgdir/$_plugindir"/libcanberra-$_p.* ../$_p-plugin
  done
}

package_libcanberra-pulse-git() {
  pkgdesc="PulseAudio plugin for libcanberra"
  depends=("$pkgbase=$pkgver-$pkgrel" libpulse)
  provides=("$_pkgbase-pulse")
  conflicts=("$_pkgbase-pulse")

  install -d "$pkgdir/$_plugindir"
  mv pulse-plugin/* "$pkgdir/$_plugindir"
}

package_libcanberra-gstreamer-git() {
  pkgdesc="GStreamer plugin for libcanberra"
  depends=("$pkgbase=$pkgver-$pkgrel" gstreamer)
  provides=("$_pkgbase-gstreamer")
  conflicts=("$_pkgbase-gstreamer")

  install -d "$pkgdir/$_plugindir"
  mv gstreamer-plugin/* "$pkgdir/$_plugindir"
}
