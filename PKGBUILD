# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ausweisapp2
pkgver=1.12.2
pkgrel=1
pkgdesc="A software application that you install on your computer to use your national identity card or your electronic residence permit for online identification"
arch=('i686' 'x86_64')
license=('custom:EUPL1.2')
url="https://www.ausweisapp.bund.de/ausweisapp2-home/"
depends=('libgl' 'pcsclite' 'libxkbcommon-x11')
makedepends=('cmake' 'python2')
source=("https://github.com/Governikus/AusweisApp2/releases/download/${pkgver}/AusweisApp2-${pkgver}.tar.gz"{,.asc}
        "https://download.qt.io/official_releases/qt/5.8/5.8.0/single/qt-everywhere-opensource-src-5.8.0.tar.xz"
        "https://www.openssl.org/source/openssl-1.0.2k.tar.gz")
noextract=("qt-everywhere-opensource-src-5.8.0.tar.xz"
           "openssl-1.0.2k.tar.gz")
validpgpkeys=('699BF3055B0A49224EFDE7C72D7479A531451088')
sha256sums=('b1d0daacd5ad1daefde8b2e125e3f2c024130e74ea7541728f26ffd700837c82'
            'SKIP'
            '0f4c54386d3dbac0606a936a7145cebb7b94b0ca2d29bc001ea49642984824b6'
            '6b3977c61f2aedf0f96367dcfb5c6e578cf37e7b8d913b4ecb6643c3cb88d8c0')

build() {
  mkdir -p "${srcdir}/Toolchain" "${srcdir}/Build"

  cd "${srcdir}/Toolchain"
  msg2 "Building toolchain"
  cmake -DCMAKE_BUILD_TYPE=RELEASE -DPACKAGES_DIR="${srcdir}" "${srcdir}/AusweisApp2-${pkgver}/libs"
  make

  cd "${srcdir}/Build"
  msg2 "Building AusweisApp2"
  cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_PREFIX_PATH="${srcdir}/Toolchain/dist" "${srcdir}/AusweisApp2-${pkgver}"
  make
}

package() {
  cd "${srcdir}/Build"

  make install
  install -dm755 "${pkgdir}/opt" "${pkgdir}/usr/bin"
  cp -a dist "${pkgdir}/opt/AusweisApp2"
  mv "${pkgdir}/opt/AusweisApp2/share" "${pkgdir}/usr/share"
  sed -i '/^Exec=/cExec=/usr/bin/AusweisApp2' "${pkgdir}/usr/share/applications/AusweisApp2.desktop"
  echo -e '[Paths]\nPrefix=..' > "${pkgdir}/opt/AusweisApp2/bin/qt.conf"
  install -Dt "${pkgdir}/opt/AusweisApp2/lib" -m755 "${srcdir}/Toolchain/dist/lib/"*.so*
  cp -a "${srcdir}/Toolchain/dist/plugins" "${pkgdir}/opt/AusweisApp2/"
  install -t "${pkgdir}/opt/AusweisApp2/translations" -m644 "${srcdir}/Toolchain/dist/translations/"qt*.qm
  echo -e '#!/usr/bin/env sh\nexport LD_LIBRARY_PATH="/opt/AusweisApp2/lib:${LD_LIBRARY_PATH}"\n/opt/AusweisApp2/bin/AusweisApp2' > "${pkgdir}/usr/bin/AusweisApp2"
  chmod 755 "${pkgdir}/usr/bin/AusweisApp2"
  install -Dm644 "${srcdir}/AusweisApp2-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
