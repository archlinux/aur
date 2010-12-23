# Maintainer: Florian Pritz <flo@xssn.at>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgbasename=libcanberra
pkgbase=lib32-$_pkgbasename
pkgname=(lib32-libcanberra lib32-libcanberra-pulse)
pkgver=0.26
pkgrel=3
pkgdesc="A small and lightweight implementation of the XDG Sound Theme Specification (32-bit)"
arch=(x86_64)
license=('LGPL')
depends=('lib32-libvorbis>=1.3.1' 'lib32-libtool>=2.2.10' 'lib32-gtk2>=2.21.8' 'lib32-alsa-lib>=1.0.23' 'lib32-tdb>=1.2.1' $_pkgbasename)
makedepends=('gtk-doc' lib32-libpulse gcc-multilib libtool-multilib)
options=(!emptydirs)
url=http://0pointer.de/lennart/projects/libcanberra
source=("$url/$_pkgbasename-$pkgver.tar.gz")
md5sums=('ee2c66ada7c851a4e7b6eb1682285a24')

build() {
  cd "$srcdir/$_pkgbasename-$pkgver"

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure --sysconfdir=/etc --prefix=/usr --localstatedir=/var \
      --disable-static --with-builtin=dso --enable-null --disable-oss \
      --enable-alsa --disable-gstreamer --enable-pulse \
      --libdir=/usr/lib32
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

  rm -rf "${pkgdir}"/{etc,usr/{include,share,bin}}
}

package_lib32-libcanberra-pulse() {
  pkgdesc="PulseAudio plugin for libcanberra (32-bit)"
  depends=("$pkgbase=$pkgver-$pkgrel" 'lib32-libpulse')

  cd "$srcdir/$_pkgbasename-$pkgver"

  mkdir -p "${pkgdir}/usr/lib32/${_pkgbasename}-${pkgver}"
  mv pulse-plugin/* "${pkgdir}/usr/lib32/${_pkgbasename}-${pkgver}" 
}
