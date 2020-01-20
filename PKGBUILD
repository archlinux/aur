# Maintainer: Dmitry Kharitonov <darksab0r at gmail com>
# Contributor: Michael Thalmeier <michael@thalmeier.at>

pkgname=curecoin-qt-git
pkgver=v2.0.0.2.r5.gf9d54f9
pkgrel=1
pkgdesc="GUI client (wallet) for CureCoin cryptocurrency"
arch=('x86_64' 'i686')
url="https://curecoin.net/"
license=('MIT')
provides=('curecoin-qt')
conflicts=('curecoin-qt')
depends=('qt5-base' 'qt5-tools' 'miniupnpc' 'boost1.69-libs' 'openssl-1.0')
makedepends=('boost1.69' 'db' 'git')
source=("git+https://github.com/cygnusxi/CurecoinSource.git#branch=master"
        "curecoin.desktop")

sha256sums=('SKIP'
            '47e4c7305240dd16361d922bf6bc3a86ee53d7e0bc43bdf12c341ea0b7968387')

pkgver() {
  cd ${srcdir}/CurecoinSource
  set -o pipefail
  git describe --tags --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/CurecoinSource"
  # Switch to OpenSSL 1.0
  echo "INCLUDEPATH += /usr/include/openssl-1.0" >> "curecoin-qt.pro"
  echo "LIBS += -L/usr/lib/openssl-1.0 -lcrypto -lz" >> "curecoin-qt.pro"
}

build() {
  cd "${srcdir}/CurecoinSource"
  qmake
  make -j1
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
