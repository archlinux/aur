# Maintainer: Pavel Ruzicka <rossetti at seznam dot cz>
# Contributor: Alexandre Petitjean <alpetitjean_gmail dot_com>

pkgname=geographiclib
_pkgname=GeographicLib
pkgver=1.43
pkgrel=1
pkgdesc="Set of C++ classes for conversions between geographic, UTM, UPS, MGRS, geocentric, and local cartesian coordinates, for gravity, geoid height, and geomagnetic field calculations and for solving geodesic problems. Geotrans replacement."
arch=('i686' 'x86_64')
url="http://geographiclib.sourceforge.net/"
license=('custom') # MIT/X11
depends=('bash')
makedepends=('gcc' 'make' 'cmake')

source=(http://downloads.sourceforge.net/project/geographiclib/distrib/${_pkgname}-${pkgver}.tar.gz)
md5sums=('189f39515deab72ff006a337c3d06b48')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cmake ./ \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DGEOGRAPHICLIB_EXAMPLES=0 \
    -DGEOGRAPHICLIB_DOCUMENTATION=0
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # move scripts from /usr/sbin to /usr/bin - due to pacman >= 4.2 directory symlink handling
  mv ${pkgdir}/usr/sbin/* ${pkgdir}/usr/bin
  rm -r ${pkgdir}/usr/sbin
}
