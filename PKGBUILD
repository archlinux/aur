# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="paper-soccer"
pkgname="${_pkgname}-git"
pkgver=1.0.1.r0.gdcaeb4e
pkgrel=4
pkgdesc="A networked version of paper soccer game in modern console"
arch=('x86_64')
url="https://github.com/MateuszJanda/${_pkgname}"
license=('MIT')
makedepends=('boost' 'cmake>=3.18' 'git')
checkdepends=('gtest' 'gmock')
depends=('boost-libs' 'gcc-libs' 'glibc' 'ncurses' 'protobuf')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  sed -i '/^add_subdirectory(lib\/googletest EXCLUDE_FROM_ALL)$/s/^/# /' CMakeLists.txt
}

build() {
  cd "${srcdir}"
  cmake \
    -G 'Unix Makefiles' \
    -B "${_pkgsrc}/build" \
    -S "${_pkgsrc}" \
    -DCMAKE_BUILD_TYPE:STRING='Release' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DGTEST_INCLUDE_DIR:PATH='/usr/include/gtest' \
    -DGMOCK_INCLUDE_DIR:PATH='/usr/include/gmock' \
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
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
