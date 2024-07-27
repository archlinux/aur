# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="paper-soccer"
pkgname="${_pkgname}-git"
pkgver=1.0.1.r0.gdcaeb4e
pkgrel=3
pkgdesc="A networked version of paper soccer game in modern console"
arch=('any')
url="https://github.com/MateuszJanda/${_pkgname}"
license=('MIT')
makedepends=('git' 'cmake' 'make' 'gcc' 'protobuf' 'boost' 'ncurses')
depends=('glibc' 'gcc-libs' 'protobuf' 'boost-libs' 'ncurses')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git"
        "googletest::git+https://github.com/google/googletest.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  git submodule init
  git config submodule.lib/googletest.url "${srcdir}/googletest"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${srcdir}"
  cmake \
    -G 'Unix Makefiles' \
    -B "${_pkgsrc}/build" \
    -S "${_pkgsrc}" \
    -DCMAKE_BUILD_TYPE:STRING='Release' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -Wno-dev
  cmake --build "${_pkgsrc}/build"
}

check() {
  cd "${srcdir}/${_pkgsrc}/build"
  make runTests
  ./runTests || exit 1
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
