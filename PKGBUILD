# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ausweisapp2
pkgver=1.16.2
pkgrel=1
pkgdesc="A software application that you install on your computer to use your national identity card or your electronic residence permit for online identification"
arch=('i686' 'x86_64')
license=('custom:EUPL1.2')
url="https://www.ausweisapp.bund.de/ausweisapp2-home/"
depends=('qt5-svg' 'qt5-websockets' 'pcsclite')
makedepends=('cmake' 'qt5-tools')
source=("https://github.com/Governikus/AusweisApp2/releases/download/${pkgver}/AusweisApp2-${pkgver}.tar.gz"{,.asc})
validpgpkeys=('699BF3055B0A49224EFDE7C72D7479A531451088')
sha256sums=('3ac0e85e3a8098d85cd868eac2cbf7cb75ed719766df5940d7bf058fda25c1a0'
            'SKIP')

build() {
  mkdir -p "${srcdir}/Build"

  cd "${srcdir}/Build"
  cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/opt/AusweisApp2 "${srcdir}/AusweisApp2-${pkgver}"
  make
}

package() {
  cd "${srcdir}/Build"

  make install DESTDIR="${pkgdir}"
  install -dm755 "${pkgdir}/usr/bin"
  # fwr the translation directory is expected to be located right next to the application binary
  ln -s "/opt/AusweisApp2/translations" "${pkgdir}/opt/AusweisApp2/bin/"
  ln -s "/opt/AusweisApp2/bin/AusweisApp2" "${pkgdir}/usr/bin/"
  mv "${pkgdir}/opt/AusweisApp2/share" "${pkgdir}/usr/share"
  install -Dm644 "${srcdir}/AusweisApp2-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
