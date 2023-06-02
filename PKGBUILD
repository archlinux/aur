# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=fastahack
pkgver=1.0.0
pkgrel=3
pkgdesc="utilities for indexing and sequence extraction from FASTA files"
arch=('x86_64')
url='https://github.com/ekg/fastahack'
depends=('glibc' 'gcc-libs')
makedepends=('quilt')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ekg/fastahack/archive/refs/tags/v${pkgver}.tar.gz"
        'Makefile.patch'
        'series')

sha512sums=('f7185a9d963f7a08d4d75bba46466fb964dfa8ed28096b6271bb1910ed0c96b937db9119869233b732f546933e04f8e258ab253a5904b3a0905423c1ceef20c5'
            'ffb3658604db6eaf8459b14130a1f40136bda777f60799ff9a40adeae91512018f28bf35a0157ecc77076b62d6eb8e14587b7409de8bb02fe11b282b44c5bf2d'
            '45be7a6354c66f0ee9624207a21884cb2bdf6ee78956d1f384620f33d3b18aa369d2000cc05c4c1b2b701098ec1cc03586a59db60d453fb70073696340ea1cd5')

prepare() {
  mkdir -p ${pkgname}-${pkgver}/patches
  cp *.patch ${pkgname}-${pkgver}/patches
  cp series ${pkgname}-${pkgver}/patches
  cd ${pkgname}-${pkgver}
  quilt push -a
}

build() {
   cd ${pkgname}-${pkgver}
   export LDFLAGS="-Wl,-O2,--sort-common,--as-needed,-z,relro,-z,now"
   export PREFIX="/usr"
   make 
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR=${pkgdir}/ install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
