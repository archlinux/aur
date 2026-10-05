#  Maintainer: Blair Bonnett <blair.bonnett at gmail>
# Contributor: Graziano Giuliani <giuliani@lamma.rete.toscana.it>
# Contributor: Graziano Giuliani <graziano.giuliani@gmail.com>

pkgname=nco
pkgver=5.4.1
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
  'libgcc'
  'libgomp'
  'libstdc++'
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
  '17f43eaf0d6dd4c5afde4d3b1b1c2d3b6d231c2b684b2b3a13924a62f884f01c'
  'dccc14050d0928f88f28358fd8f25266a67a965c79606d8156f95185e7a3d139'
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
