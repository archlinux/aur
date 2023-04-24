# Maintainer: Ewout van Mansom <ewout@vanmansom.name>

pkgname=libstumpless
_projname=stumpless
pkgver=2.1.0
pkgrel=3
pkgdesc='C logging library built for high performance and a rich feature set.'
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/goatshriek/stumpless'
license=('Apache')
depends=('glibc' 'systemd-libs')
makedepends=('git' 'cmake')
checkdepends=('gtest')
provides=('libstumpless' 'libstumpless.so')
source=("${_projname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        'pr340.patch::https://patch-diff.githubusercontent.com/raw/goatshriek/stumpless/pull/340.patch')
sha256sums=('f3eff944d81fdf82ffe5c0df6a8c692224140c9c322ffc3ba709218a66dc07ec'
            '788ff6e578cea13cb39965e1309ec5cf050fead0b2834d5ed5b7aa81f6b54e15')

prepare() {
    cd "${_projname}-${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/pr340.patch"
}

build() {
  cmake \
    -B "${_projname}-${pkgver}/build" \
    -S "${_projname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -Wno-dev
  cmake --build "${_projname}-${pkgver}/build"
}

check() {
  cd "${_projname}-${pkgver}"
  ctest --test-dir build --output-on-failure --stop-on-failure -j1
}

package() {
  DESTDIR="${pkgdir}" cmake --install "${_projname}-${pkgver}/build"
}

