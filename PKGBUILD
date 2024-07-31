# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="caps-log"
pkgver=1.0.1
pkgrel=1
pkgdesc="A small, terminal-based journaling tool"
arch=('any')
url="https://github.com/NikolaDucak/${pkgname}"
license=('MIT')
makedepends=('cmake' 'gcc' 'boost' 'libgit2' 'openssl-static')
depends=('glibc' 'gcc-libs' 'boost-libs' 'libgit2' 'fmt')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('e8424e706146b46fa0f94c73c5834cc2085f692a5b25e1d8a794ef6008d6b3f1')

build() {
  cd "${srcdir}"
  cmake \
    -G 'Unix Makefiles' \
    -B "${_pkgsrc}/build" \
    -S "${_pkgsrc}" \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DCAPS_LOG_BUILD_TESTS=ON \
    -Wno-dev
  cmake --build "${_pkgsrc}/build"
}

check() {
  cd "${srcdir}"
  ctest --test-dir "${_pkgsrc}/build" --output-on-failure --stop-on-failure
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENCE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
