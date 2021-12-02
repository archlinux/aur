# Maintainer: Chan Beom Park <cbpark@gmail.com>

pkgname=whizard
pkgver=3.0.2
pkgrel=1
pkgdesc="The Generator of Monte Carlo Event Generators for Tevatron, LHC, ILC, CLIC, CEPC, FCC-ee, FCC-hh, SppC and other High Energy Physics Experiments"
arch=("x86_64")
url="http://${pkgname}.hepforge.org"
license=('GPL2')
depends=('gcc-libs' 'gcc-fortran' 'ocaml' 'libtirpc')
makedepends=('texlive-bin' 'texlive-pictures' 'ghostscript')
optdepends=('pythia8: PYTHIA8 for shower and hadronization'
            'lhapdf: LHAPDF for structure functions'
            'fastjet: FastJet for handling event data'
            'looptools: LoopTools loop integral library'
            'hepmc: HepMC for handling event data')
source=("${url}/downloads/?f=${pkgname}-${pkgver}.tar.gz")
sha256sums=('f1db92cd95a0281f6afbf4ac32ab027670cb97a57ad8f5139c0d1f61593d66ec')

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
               CPPFLAGS="-I/usr/include/tirpc" LIBS="-ltirpc" \
               CXXFLAGS="-std=c++17" \
               CFLAGS="-Wno-error=format-security"

  make
}

package() {
  cd "${pkgname}-${pkgver}"/build

  make DESTDIR="$pkgdir" install
  cd ..
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
