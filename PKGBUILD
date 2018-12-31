# Maintainer: Chan Beom Park <cbpark@gmail.com>

pkgname=whizard
pkgver=2.6.4
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
sha256sums=('58af39329f3445e36d0fbfea7010568cf3653a5b4d249cc1cd8ccfb04ceddfa5')

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
               CPPFLAGS="-I/usr/include/tirpc" LIBS="-ltirpc"
  make
}

package() {
  cd "${pkgname}-${pkgver}"/build

  make DESTDIR="$pkgdir" install
  cd ..
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
