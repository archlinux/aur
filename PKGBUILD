# Maintainer: Florian Pritz <flo@xssn.at>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgbasename=libcanberra
pkgbase=lib32-$_pkgbasename
pkgname=(lib32-libcanberra lib32-libcanberra-pulse)
pkgver=0.30
pkgrel=4
pkgdesc="A small and lightweight implementation of the XDG Sound Theme Specification (32-bit)"
arch=(x86_64)
license=(LGPL)
depends=(lib32-libvorbis lib32-libltdl lib32-alsa-lib lib32-tdb $_pkgbasename)
makedepends=(gtk-doc lib32-libpulse lib32-gtk2 git gcc-multilib libtool-multilib)
options=(!emptydirs)
url=http://0pointer.de/lennart/projects/libcanberra
source=("git://git.0pointer.de/libcanberra.git#commit=c0620e4")
sha256sums=('SKIP')

_plugindir=usr/lib32/$_pkgbasename-$pkgver

prepare() {
  cd $_pkgbasename
  ./autogen.sh
}

build() {
  cd $_pkgbasename

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure --sysconfdir=/etc --prefix=/usr --localstatedir=/var \
      --disable-static --with-builtin=dso --enable-null --disable-oss \
      --enable-alsa --disable-gstreamer --enable-pulse \
      --disable-udev --libdir=/usr/lib32

  # Fight unused direct deps
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool

  make
}

package_lib32-libcanberra() {
  optdepends=("$pkgbase-pulse: PulseAudio driver")

  cd $_pkgbasename

  make -j1 DESTDIR="$pkgdir" install
  rm "$pkgdir"/usr/lib32/libcanberra-gtk*.la
  rm "$pkgdir"/usr/lib32/gtk-2.0/modules/*.la

  # Split plugins
  for _p in pulse; do
    mkdir ../$_p-plugin
    mv "$pkgdir/$_plugindir"/libcanberra-$_p.* ../$_p-plugin
  done

  rm -r "${pkgdir}"/usr/{include,share,bin,lib32/gnome-settings-daemon-3.0}
}

package_lib32-libcanberra-pulse() {
  pkgdesc="PulseAudio plugin for libcanberra (32-bit)"
  depends=("$pkgbase=$pkgver-$pkgrel" lib32-libpulse)

  install -d "$pkgdir/$_plugindir"
  mv pulse-plugin/* "$pkgdir/$_plugindir"
}
