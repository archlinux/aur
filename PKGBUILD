# Maintainer: Gicu Gorodenco <cyclopsihus 'at' gmail 'dot' com>
# Contributor: rafael ff1 <rafael.f.f1 'at' gmail 'dot' com> 
_pkgbasename=esound
pkgname=lib32-$_pkgbasename
pkgver=0.2.41
pkgrel=4
pkgdesc="Enlightened Sound Daemon (32 bit, library only)"
arch=('x86_64')
url="http://www.tux.org/~ricdude/EsounD.html"
license=('LGPL')
depends=('lib32-audiofile' 'lib32-alsa-lib>=1.0.18' "$_pkgbasename")
makedepends=('gcc-multilib')
options=('!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/${_pkgbasename}/0.2/${_pkgbasename}-${pkgver}.tar.bz2)
md5sums=('8d9aad3d94d15e0d59ba9dc0ea990c6c')

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  # alsa drain fix
  sed -i 's/drain/drop/' audio_alsa09.c

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --disable-static \
              --with-audiofile \
              --without-libwrap \
              --enable-alsa \
              --disable-artstest \
              --libdir=/usr/lib32 \
              CC='gcc -m32'
  make CFLAGS="$CFLAGS -lm"
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  # Cleanup for a lib32 package
  rm -rf ${pkgdir}/usr/{../etc,bin,include,share}
  # Install license
  install -Dm644 COPYING.LIB ${pkgdir}/usr/share/licenses/${pkgname}/COPYING.LIB
}
