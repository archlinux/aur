#  Maintainer: Blair Bonnett <blair.bonnett at gmail>
# Contributor: Graziano Giuliani <giuliani@lamma.rete.toscana.it>
# Contributor: Graziano Giuliani <graziano.giuliani@gmail.com>

pkgname=nco
pkgver=5.3.3
pkgrel=1
pkgdesc="netCDF Operators allow users to manipulate and analyse data stored in NetCDF files"
url="http://nco.sourceforge.net/"
license=('BSD-3-Clause')
arch=('x86_64')

depends=(
  'bash'
  'cblas'
  'ccr'
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
  '73082e9144215bb723b662b55f752e684a7308aa9813481e4fbd8a61265a762b'
  '762e7d1857efed1abf4950d747b84e83f55b4557a1c63d839f9b6addb15fc7c0'
)

prepare() {
  cd nco
  patch -p0 -i "$srcdir/use_antlr2.patch"
}

build() {
  cd nco
  ./configure \
    --prefix=/usr \
    --with-hdf5-plugin-path=/usr/lib/hdf5/plugin \
    --enable-ccr
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
