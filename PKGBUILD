#  Maintainer: Blair Bonnett <blair.bonnett at gmail>
# Contributor: Graziano Giuliani <giuliani@lamma.rete.toscana.it>
# Contributor: Graziano Giuliani <graziano.giuliani@gmail.com>

pkgname=nco
pkgver=5.3.7
pkgrel=1
pkgdesc="netCDF Operators allow users to manipulate and analyse data stored in NetCDF files"
url="http://nco.sourceforge.net/"
license=('BSD-3-Clause')
arch=('x86_64')

# N.B., ccr is currently not needed as all its filters are now integrated into netcdf-c:
# https://github.com/Unidata/netcdf-c/issues/3121
depends=(
  'bash'
  'cblas'
  'curl'
  'glibc'
  'gcc-libs'
  'gsl'
  'netcdf'
  'udunits'
)
makedepends=(
  'antlr2'
  'git'
)
options=('!libtool')

source=(
  "git+https://github.com/nco/nco.git#tag=$pkgver"
  'use_antlr2.patch'
)
sha256sums=(
  'ccea7400769da6d2af570fa6ea59736b880c70ff37cf08cddfa9e2252eaec3c5'
  'd83d003eb3c426905c082b9a705f3d3ec7a0420bb8b258e45b7490f50296c0f5'
)

prepare() {
  cd nco
  patch -p0 -i "$srcdir/use_antlr2.patch"
}

build() {
  cd nco
  ./configure \
    --prefix=/usr \
    --with-hdf5-plugin-path=/usr/lib/hdf5/plugin
  make
}

check() {
  cd nco
  make check
}

package() {
  cd nco
  make DESTDIR="$pkgdir" install install-html
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
# vim:set ts=2 sw=2 et:
