# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="caps-log"
pkgname="${_pkgname}-git"
pkgver=1.0.1.r2.ga6ae873
pkgrel=1
pkgdesc="A small, terminal-based journaling tool"
arch=('any')
url="https://github.com/NikolaDucak/${_pkgname}"
license=('MIT')
makedepends=('git' 'cmake' 'gcc' 'boost' 'libgit2' 'openssl-static')
depends=('glibc' 'gcc-libs' 'boost-libs' 'libgit2' 'fmt')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENCE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
