# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="caps-log"
pkgver=1.0.1
pkgrel=2
pkgdesc="A small, terminal-based journaling tool"
arch=('any')
url="https://github.com/NikolaDucak/${pkgname}"
license=('MIT')
makedepends=('cmake' 'boost' 'ftxui')
depends=('glibc' 'gcc-libs' 'boost-libs' 'libgit2' 'openssl' 'fmt')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "${pkgname}_fix_openssl.patch")
sha256sums=('e8424e706146b46fa0f94c73c5834cc2085f692a5b25e1d8a794ef6008d6b3f1'
            'b86336c24292ecbf3a627129a0f6c416d121c16ea93ec5735d2a8049572de1e7')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -p1 -i "${srcdir}/${pkgname}_fix_openssl.patch"
}

build() {
  cd "${srcdir}"
  cmake \
    -G 'Unix Makefiles' \
    -B "${_pkgsrc}/build" \
    -S "${_pkgsrc}" \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DCAPS_LOG_BUILD_TESTS=OFF \
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
