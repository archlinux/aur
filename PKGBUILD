# Maintainer: Dmitry Kharitonov <darksab0r at gmail com>
# Contributor: Michael Thalmeier <michael@thalmeier.at>

pkgname=curecoind-git
pkgver=v2.0.0.2.r21.g8cd2c3b
pkgrel=1
pkgdesc="Headless daemon for CureCoin cryptocurrency"
arch=('x86_64' 'i686')
url="https://curecoin.net/"
license=('MIT')
provides=('curecoind')
conflicts=('curecoind')
depends=('miniupnpc' 'boost-libs' 'openssl-1.0')
makedepends=('boost' 'db' 'git')
source=("git+https://github.com/cygnusxi/CurecoinSource.git#branch=master")

sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/CurecoinSource
  set -o pipefail
  git describe --tags --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/CurecoinSource/src"
  make -f makefile.unix OPENSSL_INCLUDE_PATH='/usr/include/openssl-1.0' OPENSSL_LIB_PATH='/usr/lib/openssl-1.0 -lcrypto -lz'
}

package() {
  cd "${srcdir}/CurecoinSource"
  install -Dm755 "${srcdir}/CurecoinSource/src/curecoind" "${pkgdir}/usr/bin/curecoind"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
