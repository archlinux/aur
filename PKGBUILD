# Maintainer: Dmitry Kharitonov <darksab0r at gmail com>

pkgname=curecoin-qt-git
pkgver=r130.17d71dd
pkgrel=3
pkgdesc="GUI client (wallet) for CureCoin cryptocurrency"
arch=('x86_64' 'i686')
url="https://curecoin.net/"
license=('MIT')
provides=('curecoin-qt')
conflicts=('curecoin-qt')
depends=('qt5-base' 'qt5-tools' 'miniupnpc' 'boost-libs' 'openssl-1.0')
makedepends=('boost' 'db' 'git')
source=("git+https://github.com/cygnusxi/CurecoinSource.git#branch=master"
        "0001-miniupnpc.patch"
        "0002-boost166.patch"
        "curecoin.desktop")

sha256sums=('SKIP'
            'ef598aee46b5ad12b43db8942c08ef2cbece002efa731394066ebff654bea5e1'
            'a61d0bec8c5d5955b6eb8cbb4e39e65dc6f564c15af80712dc7d8736c340881c'
            '47e4c7305240dd16361d922bf6bc3a86ee53d7e0bc43bdf12c341ea0b7968387')

pkgver() {
  cd ${srcdir}/CurecoinSource
  set -o pipefail
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/CurecoinSource"
  # Switch to OpenSSL 1.0
  echo "INCLUDEPATH += /usr/include/openssl-1.0" >> "curecoin-qt.pro"
  echo "LIBS += -L/usr/lib/openssl-1.0 -lcrypto -lz" >> "curecoin-qt.pro"

  # Fix compilation error with miniupnpc v 1.9
  patch -p1 <"${srcdir}/0001-miniupnpc.patch"

  # Fix compilation error with boost v 1.66
  patch -p1 <"${srcdir}/0002-boost166.patch"
}

build() {
  cd "${srcdir}/CurecoinSource"
  qmake
  make ${MAKEFLAGS}

}

package() {
  cd "${srcdir}"
  install -Dm644 curecoin.desktop ${pkgdir}/usr/share/applications/curecoin.desktop

  cd "${srcdir}/CurecoinSource"
  mkdir -p -m 755 "${pkgdir}/usr/share/curecoin-qt/"
  install -Dm755 curecoin-qt "${pkgdir}/usr/bin/curecoin-qt"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 src/qt/res/icons/curecoin.png "${pkgdir}/usr/share/pixmaps/curecoin.png"
}
