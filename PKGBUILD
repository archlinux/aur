# Maintainer: Dmitry Kharitonov <arch[at]nano-model[dot]com>
# Contributor: Michael Thalmeier <michael@thalmeier.at>

pkgname=curecoin-qt-git
pkgver=v2.1.0.1.r0.gc06a7b2
pkgrel=1
pkgdesc="GUI client (wallet) for CureCoin cryptocurrency"
arch=('x86_64' 'i686')
url="https://curecoin.net/"
license=('MIT')
provides=('curecoin-qt')
conflicts=('curecoin-qt')
depends=('qt5-base' 'qt5-tools' 'miniupnpc' 'boost-libs' 'openssl')
makedepends=('boost' 'db' 'git')
source=("git+https://github.com/cygnusxi/CurecoinSource.git"
        "62.patch"
        "curecoin.desktop")
sha256sums=('SKIP'
            'e4b91a65d1f1afe7c165cbc4f090bfe4dc914a36915e9ef5f5d6ba0a981db0af'
            '47e4c7305240dd16361d922bf6bc3a86ee53d7e0bc43bdf12c341ea0b7968387')

pkgver() {
  cd "${srcdir}/CurecoinSource"
  set -o pipefail
  git describe --tags --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/CurecoinSource"
  #patch --forward --strip=1 --input="${srcdir}/62.patch"
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
