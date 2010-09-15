# Maintainer: Florian Pritz <flo@xssn.at>

_pkgbasename=libcanberra
pkgname=lib32-$_pkgbasename
pkgver=0.23
pkgrel=4
pkgdesc="A small and lightweight implementation of the XDG Sound Theme Specification (32-bit)"
arch=(x86_64)
license=('LGPL')
depends=('lib32-libvorbis>=1.2.1rc1' 'lib32-libtool>=2.2.6a' 'lib32-gtk2>=2.18.2' 'alsa-lib>=1.0.20' 'lib32-tdb' $_pkgbasename)
makedepends=('gtk-doc' lib32-pulseaudio gcc-multilib libtool-multilib)
optdepends=('lib32-pulseaudio: PulseAudio support')
options=(!emptydirs)
url=http://0pointer.de/lennart/projects/libcanberra
source=(http://0pointer.de/lennart/projects/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.gz)
md5sums=('83fb2fb7608c77f91904e12a867534fd')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  ./configure --sysconfdir=/etc --prefix=/usr --localstatedir=/var \
      --disable-static --libdir=/usr/lib32\
      --enable-alsa --enable-null --disable-gstreamer --enable-oss --enable-pulse \
      --with-builtin=dso
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  make -j1 DESTDIR="${pkgdir}" install
  rm -f "${pkgdir}/usr/lib32/libcanberra-gtk.la"
  rm -f "${pkgdir}/usr/lib32/gtk-2.0/modules/"*.la
  
  rm -rf "${pkgdir}"/{etc,usr/{include,share,bin}}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
