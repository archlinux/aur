# Maintainer: A. Klitzing <aklitzing@gmail.com>

pkgname=ausweisapp2
pkgver=1.26.7
pkgrel=2
pkgdesc="A software application that you install on your computer to use your national identity card or your electronic residence permit for online identification"
arch=('i686' 'x86_64' 'aarch64')
license=('custom:EUPL1.2')
url="https://www.ausweisapp.bund.de/"
depends=('qt6-declarative' 'qt6-svg' 'qt6-websockets' 'qt6-scxml' 'pcsclite' 'http-parser')
makedepends=('cmake' 'qt6-tools' 'qt6-shadertools' 'ninja' 'pkgconf')
optdepends=('ccid' 'acsccid' 'pcsc-cyberjack')
source=("https://github.com/Governikus/AusweisApp2/releases/download/${pkgver}/AusweisApp2-${pkgver}.tar.gz"{,.asc} "qt66.patch")
validpgpkeys=('699BF3055B0A49224EFDE7C72D7479A531451088')
sha256sums=('8062fe04332e9a7bee4c75fe3ef3efda6748c1a19a6fda8770f7914939c7bd28'
            'SKIP'
            '59beebd6777d772488dc371dd85f9c28d554c480d0c094ee05b463b17cd1f0d6')

prepare() {
  cd "AusweisApp2-$pkgver"
  patch -p1 -i "$srcdir/qt66.patch"
}

build() {
  cd "${srcdir}"
  cmake -GNinja -B build -DCMAKE_BUILD_TYPE=MinSizeRel -DCMAKE_INSTALL_PREFIX=/usr "${srcdir}/AusweisApp2-${pkgver}"
  cmake --build build
}

package() {
  cd "${srcdir}"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "${srcdir}/AusweisApp2-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
