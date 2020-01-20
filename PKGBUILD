# Maintainer: Dmitry Kharitonov <darksab0r at gmail com>
# Contributor: Michael Thalmeier <michael@thalmeier.at>

pkgname=curecoind-git
pkgver=v2.0.0.2.r5.gf9d54f9
pkgrel=1
pkgdesc="Headless daemon for CureCoin cryptocurrency"
arch=('x86_64' 'i686')
url="https://curecoin.net/"
license=('MIT')
provides=('curecoind')
conflicts=('curecoind')
depends=('miniupnpc' 'boost1.69-libs' 'openssl-1.0')
makedepends=('boost1.69' 'db' 'git')
source=("git+https://github.com/cygnusxi/CurecoinSource.git#branch=master"
        "boost.patch")

sha256sums=('SKIP'
            'd5911e88da183e9eb30fda5c1eec7e18ba15dc7907359257d9c1bc78ca390dc1')

pkgver() {
  cd ${srcdir}/CurecoinSource
  set -o pipefail
  git describe --tags --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/CurecoinSource"
  # Fix compilation error with miniupnpc v 1.9 and new boost
  patch -p1 <"${srcdir}/boost.patch"
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
