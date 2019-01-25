# Maintainer: Chan Beom Park <cbpark@gmail.com>

pkgname=whizard
pkgver=2.7.0
pkgrel=1
pkgdesc="The Generator of Monte Carlo Event Generators for Tevatron, LHC, ILC, CLIC, CEPC, FCC-ee, FCC-hh, SppC and other High Energy Physics Experiments"
arch=("x86_64")
url="http://${pkgname}.hepforge.org"
license=('GPL2')
depends=('gcc-libs' 'gcc-fortran' 'ocaml' 'libtirpc')
makedepends=('texlive-bin' 'texlive-pictures' 'ghostscript')
optdepends=('pythia: PYTHIA8 for shower and hadronization'
            'lhapdf: LHAPDF for structure functions'
            'fastjet: FastJet for handling event data'
            'looptools: LoopTools loop integral library'
            'hepmc: HepMC for handling event data')
source=("${url}/downloads/${pkgname}-${pkgver}.tar.gz")
sha256sums=('97a50705a8ba4174206cdc2c9cf0981a4046352e815e1903f124a92bd05eb4a9')

prepare() {
  cd "${pkgname}-${pkgver}"

  mkdir -p build
}

build() {
  cd "${pkgname}-${pkgver}"/build

  ../configure --prefix=/usr \
               --enable-lhapdf \
               --enable-hepmc \
               --enable-pythia8 \
               --enable-fastjet \
               --enable-looptools \
               --with-precision=quadruple \
               CPPFLAGS="-I/usr/include/tirpc" LIBS="-ltirpc"
  make
}

package() {
  cd "${pkgname}-${pkgver}"/build

  make DESTDIR="$pkgdir" install
  cd ..
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
