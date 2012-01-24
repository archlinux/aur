# Maintainer: Florian Pritz <flo@xssn.at>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgbasename=libcanberra
pkgbase=lib32-$_pkgbasename
pkgname=(lib32-libcanberra lib32-libcanberra-pulse)
pkgver=0.28
pkgrel=3
pkgdesc="A small and lightweight implementation of the XDG Sound Theme Specification (32-bit)"
arch=(x86_64)
license=('LGPL')
depends=('lib32-libvorbis' 'lib32-libtool' 'lib32-gtk2' 'lib32-alsa-lib' 'lib32-tdb'
         $_pkgbasename)
makedepends=('gtk-doc' lib32-libpulse gcc-multilib libtool-multilib)
options=(!emptydirs)
url=http://0pointer.de/lennart/projects/libcanberra
source=("$url/$_pkgbasename-$pkgver.tar.gz")
md5sums=('c198b4811598c4c161ff505e4531b02c')

build() {
  cd "$srcdir/$_pkgbasename-$pkgver"

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure --sysconfdir=/etc --prefix=/usr --localstatedir=/var \
      --disable-static --with-builtin=dso --enable-null --disable-oss \
      --enable-alsa --disable-gstreamer --enable-pulse --disable-udev \
      --libdir=/usr/lib32

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool

  make
}

package_lib32-libcanberra() {
  optdepends=("$pkgbase-pulse: PulseAudio driver")

  cd "$srcdir/$_pkgbasename-$pkgver"

  make -j1 DESTDIR="${pkgdir}" install
  rm -f "${pkgdir}/usr/lib32/libcanberra-gtk.la"
  rm -f "${pkgdir}/usr/lib32/gtk-2.0/modules/"*.la


  # Split libcanberra-pulse
  mkdir pulse-plugin
  mv "${pkgdir}"/usr/lib32/${_pkgbasename}-${pkgver}/${_pkgbasename}-pulse.* pulse-plugin

  rm -rf "${pkgdir}"/{etc,usr/{include,share,bin,lib32/gnome-settings-daemon-3.0}}
}

package_lib32-libcanberra-pulse() {
  pkgdesc="PulseAudio plugin for libcanberra (32-bit)"
  depends=("$pkgbase=$pkgver-$pkgrel" 'lib32-libpulse')

  cd "$srcdir/$_pkgbasename-$pkgver"

  mkdir -p "${pkgdir}/usr/lib32/${_pkgbasename}-${pkgver}"
  mv pulse-plugin/* "${pkgdir}/usr/lib32/${_pkgbasename}-${pkgver}" 
}
