# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('6sv11')
pkgver=1.1
pkgrel=2
_6s="Second Simulation of a Satellite Signal in the Solar Spectrum"
pkgdesc="$_6s - Vector - 1.1"
arch=('i686' 'x86_64')
url='http://6s.ltdri.org'
license=('custom')
makedepends=('gcc-fortran')
depends=('gcc-libs')
options=(!emptydirs)
source=("http://rtwilson.com/downloads/6SV-1.1.tar")
sha256sums=('eedf652e6743b3991b5b9e586da2f55c73f9c9148335a193396bf3893c2bc88f')

prepare() {
  cd "$srcdir/6SV1.1/"

  # Use gfortran instead of g77 and add some extra options as described in
  # http://py6s.readthedocs.io/en/latest/installation.html
  _fopts='-std=legacy -ffixed-line-length-none -ffpe-summary=none'
  sed -i "s/g77/gfortran $_fopts/g" Makefile

  # Creates a standalone license file from the only source file with this info
  cat > ../LICENSE <<EOF
The 6SV Fortran library doesn't specify its license anywhere.
However, the text below is written as comments for the mvbp1 function
in the VERSTOOLS.f source file:

remarks:

[...]

EOF
  sed -n '/5. t/,/your u/s/^c\s\?\s\?//p' "VERSTOOLS.f" >> ../LICENSE
}

build() {
  cd "$srcdir/6SV1.1/"
  make
}

package() {
  cd "$srcdir/6SV1.1/"
  install -Dm755 sixsV1.1 "$pkgdir/usr/bin/sixsV1.1"
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
