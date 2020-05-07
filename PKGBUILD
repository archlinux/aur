# Maintainer: Florian Pritz <flo@xssn.at>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=lib32-libcanberra
pkgname=(lib32-libcanberra lib32-libcanberra-pulse lib32-libcanberra-gstreamer)
pkgver=0.30+2+gc0620e4
pkgrel=3
pkgdesc="A small and lightweight implementation of the XDG Sound Theme Specification (32-bit)"
arch=(x86_64)
license=(LGPL)
depends=(lib32-libvorbis lib32-libltdl lib32-alsa-lib lib32-tdb libcanberra)
makedepends=(gtk-doc lib32-libpulse lib32-gstreamer lib32-gtk2 lib32-gtk3 git)
options=(!emptydirs libtool)
url="http://0pointer.de/lennart/projects/libcanberra"
_commit=c0620e432650e81062c1967cc669829dbd29b310  # master
source=("git+http://git.0pointer.net/clone/libcanberra.git#commit=$_commit")
sha256sums=('SKIP')

_plugindir=usr/lib32/libcanberra-0.30

pkgver() {
  cd libcanberra
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd libcanberra
  ./autogen.sh
}

build() {
  cd libcanberra

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  ./configure --sysconfdir=/etc --prefix=/usr --localstatedir=/var \
      --libdir=/usr/lib32 \
      --disable-static --with-builtin=dso --enable-null --disable-oss \
      --enable-alsa --enable-gstreamer --enable-pulse \
      --with-systemdsystemunitdir=/usr/lib/systemd/system --enable-gtk-doc

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package_lib32-libcanberra() {
  optdepends=("$pkgbase-pulse: PulseAudio driver"
              "$pkgbase-gstreamer: GStreamer driver")
  provides=(libcanberra{,-gtk,-gtk3}.so)

  cd libcanberra

  make -j1 DESTDIR="$pkgdir" install
  rm "$pkgdir"/usr/lib32/libcanberra-gtk*.la
  rm "$pkgdir"/usr/lib32/gtk-{2,3}.0/modules/*.la

  # Split plugins
  for _p in pulse gstreamer; do
    mkdir ../$_p-plugin
    mv "$pkgdir/$_plugindir"/libcanberra-$_p.* ../$_p-plugin
  done

  rm -r "$pkgdir"/usr/{include,share,bin,lib,lib32/gnome-settings-daemon-3.0}
  rm "$pkgdir"/usr/lib32/*.la
}

package_lib32-libcanberra-pulse() {
  pkgdesc="PulseAudio plugin for libcanberra (32-bit)"
  depends=("$pkgbase=$pkgver-$pkgrel" lib32-libpulse)

  install -d "$pkgdir/$_plugindir"
  mv pulse-plugin/* "$pkgdir/$_plugindir"
}

package_lib32-libcanberra-gstreamer() {
  pkgdesc="GStreamer plugin for libcanberra (32-bit)"
  depends=("$pkgbase=$pkgver-$pkgrel" lib32-gstreamer)

  install -d "$pkgdir/$_plugindir"
  mv gstreamer-plugin/* "$pkgdir/$_plugindir"
}
