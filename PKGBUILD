# Maintainer: Pest <pest@devault.cc>
_pkgname=devault
pkgname="${_pkgname}core-git"
pkgver=r21833.bd1cbe44e
pkgrel=1
pkgdesc="QT Desktop wallet for the DVT blockchain"
arch=('x86_64')
license=('MIT')
url="https://github.com/devaultcrypto/"
conflicts=("${_pkgname}" "${_pkgname}core")
source=("git+https://github.com/devaultcrypto/${_pkgname}.git"
        'devault-qt.desktop')
depends=('boost-libs' 'qt5-base' 'qrencode' 'zeromq' 'miniupnpc'
         'hicolor-icon-theme' 'libevent')
makedepends=('python' 'boost' 'qt5-tools' 'cmake')
sha256sums=('SKIP'
            '2cc2b644725c95da87fcdc89dcac32d54934fadb681dfce616d059e97ab26255')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S "${_pkgname}" \
    -DCMAKE_BUILD_TYPE=None \
    -DBUILD_CTESTS=OFF \
    -DENABLE_MAN=OFF \
    -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --prefix /usr

  install -Dm644 "${srcdir}/devault-qt.desktop" \
    "${pkgdir}/usr/share/applications/DeVault-Core.desktop"
  install -Dm644 "${srcdir}/${_pkgname}/share/pixmaps/bitcoin128.png" \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/devault-128.png"
  install -Dm644 "${srcdir}/${_pkgname}/COPYING" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
