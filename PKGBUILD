# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname=paper-soccer
pkgname=${_pkgname}-git
pkgver=1.0.1.r0.dcaeb4e
pkgrel=2
pkgdesc="A networked version of paper soccer game in modern console"
arch=('any')
url="https://github.com/MateuszJanda/paper-soccer"
license=('MIT')
depends=('protobuf' 'boost-libs' 'ncurses')
makedepends=('git' 'cmake' 'gcc' 'protobuf' 'boost' 'ncurses')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver%%.r*}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git"
        "googletest::git+https://github.com/google/googletest.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  git submodule init
  git config submodule.lib/googletest.url "${srcdir}/googletest"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
  cmake --build build
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
