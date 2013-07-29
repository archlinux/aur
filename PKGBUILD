# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Baptiste Daroussin <baptiste.daroussin@gmail.com>
# Contributor: Grigorios Bouzakis <grbzks[at]gmail[dot]com>
# Contributor: mightyjaym <jm.ambrosino@free.fr>

_pkgbasename=giflib
pkgname=lib32-$_pkgbasename
pkgver=5.0.4
pkgrel=1
pkgdesc="A library for reading and writing gif images (32-bit)"
url="http://sourceforge.net/projects/giflib/"
arch=('x86_64')
license=('MIT')
depends=('lib32-libx11' 'lib32-libsm' $_pkgbasename)
makedepends=('xmlto' 'docbook-xsl' 'docbook-xml')
provides=("lib32-libungif=${pkgver}")
conflicts=('lib32-libungif')
replaces=('lib32-libungif')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/giflib/${_pkgbasename}-${pkgver}.tar.bz2)
md5sums=('da60935d07374de00a78c2f6f720c8f5')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd ${srcdir}/${_pkgbasename}-${pkgver}
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd ${srcdir}/${_pkgbasename}-${pkgver}

  make DESTDIR=${pkgdir} install

  # libungif compatibility - instructions taken from Redhat specfile
  MAJOR=`echo ${pkgver} | sed 's/\([0-9]\+\)\..*/\1/'`
  gcc -m32 -shared -Wl,-soname,libungif.so.${MAJOR} -Llib/.libs -lgif -o libungif.so.${pkgver}
  install -m755 libungif.so.${pkgver} ${pkgdir}/usr/lib32/
  ln -sf libungif.so.${pkgver} ${pkgdir}/usr/lib32/libungif.so.4
  ln -sf libungif.so.4 ${pkgdir}/usr/lib32/libungif.so

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  install -m755 -d ${pkgdir}/usr/share/licenses
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
