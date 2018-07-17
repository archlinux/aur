# Maintainer: Jaan Toots <jaantoots@gmail.com>
pkgname=digidoc4-client
_pkgname=qdigidoc4
pkgver=4.0.0
pkgrel=2
pkgdesc="Application for digitally signing and encrypting documents"
arch=('x86_64')
url="https://github.com/open-eid/DigiDoc4-Client"
license=('LGPL2.1')
depends=('hicolor-icon-theme' 'libdigidocpp' 'opensc' 'qt5-svg')
optdepends=('ccid: smart card support')
makedepends=('cmake' 'qt5-tools')
conflicts=('qdigidoc')
source=("https://github.com/open-eid/DigiDoc4-Client/releases/download/v${pkgver}/${_pkgname}_${pkgver}.tar.gz"
        "digidoc4-client.patch")
sha256sums=('165433cd9afc7addc095006bcd8336f61958264f1a08c3de39e615d1387a6ff0'
            'd7cf1668f450ff9846481625e2480105eb365a658aa6b2876874873fe874746d')

prepare() {
  [[ -d "${_pkgname}-build" ]] && rm -r "${_pkgname}-build"
  mkdir "${_pkgname}-build"
  cd "${srcdir}/${_pkgname}_${pkgver}"
  patch -p1 -i "${srcdir}/digidoc4-client.patch"
}

build() {
  cd "${_pkgname}-build"
  cmake "../${_pkgname}_${pkgver}" \
        -DCMAKE_C_FLAGS:STRING="${CFLAGS} -ffile-prefix-map=$srcdir=." \
        -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS} -ffile-prefix-map=$srcdir=." \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_INSTALL_LIBDIR="lib" \
        -DCMAKE_INSTALL_SYSCONFDIR="/etc"
  make
}

package() {
  cd "${_pkgname}-build"
  make DESTDIR="${pkgdir}/" install
}
