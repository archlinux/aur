# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ausweisapp2
pkgver=1.22.0
pkgrel=2
pkgdesc="A software application that you install on your computer to use your national identity card or your electronic residence permit for online identification"
arch=('i686' 'x86_64')
license=('custom:EUPL1.2')
url="https://www.ausweisapp.bund.de/"
depends=('qt5-declarative' 'qt5-graphicaleffects' 'qt5-quickcontrols2' 'qt5-svg' 'qt5-websockets' 'pcsclite' 'http-parser')
makedepends=('cmake' 'qt5-tools')
optdepends=('ccid' 'acsccid' 'pcsc-cyberjack')
source=("manpage.patch" "https://github.com/Governikus/AusweisApp2/releases/download/${pkgver}/AusweisApp2-${pkgver}.tar.gz"{,.asc})
validpgpkeys=('699BF3055B0A49224EFDE7C72D7479A531451088')
sha256sums=('bd3ee7bff4ceef90fa43d14cfa9c9545e708615a0c5658bca938e347fcb1ac04'
            '6623533388516ae449741bdd53fdb5c514e84e24fa85d091e83c4c3674987561'
            'SKIP')

prepare() {
  cd "AusweisApp2-$pkgver"
  patch -p1 -i "${srcdir}/manpage.patch"
}

build() {
  cd "${srcdir}"
  cmake -B build -DCMAKE_BUILD_TYPE=MinSizeRel -DCMAKE_INSTALL_PREFIX=/usr "${srcdir}/AusweisApp2-${pkgver}"
  cmake --build build
}

package() {
  cd "${srcdir}"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "${srcdir}/AusweisApp2-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
