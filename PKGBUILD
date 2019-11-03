# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ausweisapp2
pkgver=1.18.2
pkgrel=1
pkgdesc="A software application that you install on your computer to use your national identity card or your electronic residence permit for online identification"
arch=('i686' 'x86_64')
license=('custom:EUPL1.2')
url="https://www.ausweisapp.bund.de/ausweisapp2-home/"
depends=('qt5-declarative' 'qt5-graphicaleffects' 'qt5-quickcontrols2' 'qt5-svg' 'qt5-websockets' 'pcsclite')
makedepends=('cmake' 'qt5-tools')
optdepends=('ccid')
source=("https://github.com/Governikus/AusweisApp2/releases/download/${pkgver}/AusweisApp2-${pkgver}.tar.gz"{,.asc}
        "qml-path.patch")
validpgpkeys=('699BF3055B0A49224EFDE7C72D7479A531451088')
sha256sums=('2b21d25ca065d1004e3d72f418d542240ab6b62e9e68ed05958e70455f4a3e64'
            'SKIP'
            '52a45aa940b0d6fe5236e45cb3c587237955b7e128eb5f6b5c6398e034778ca4')

prepare() {
  cd "${srcdir}/AusweisApp2-${pkgver}"

  # TODO: Ask upstream whether copying all that QML stuff is really necessary
  patch -Np1 < "${srcdir}/qml-path.patch"
}

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
