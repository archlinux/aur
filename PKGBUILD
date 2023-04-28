# Maintainer: Ewout van Mansom <ewout@vanmansom.name>

pkgname=libstumpless
_projname=stumpless
pkgver=2.1.0
pkgrel=6
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
            '42a1ddca300bdbbee147dba0eab7e77c839209a7e772b922e4ee60e28169b9a9')

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
  cmake --build "${_projname}-${pkgver}/build" --target check
  ctest --test-dir "${_projname}-${pkgver}/build" --output-on-failure --stop-on-failure -j1
}

package() {
  DESTDIR="${pkgdir}" cmake --install "${_projname}-${pkgver}/build"
}

