# Maintainer: Clar Fon <them@lightdark.xyz>

_pkgname=uap-cpp
pkgname=$_pkgname-git
pkgver=r71.87fe432
pkgrel=2
pkgdesc="C++ implementation of ua-parser"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/ua-parser/uap-cpp'
license=('MIT')
provides=('uap-cpp')
conflicts=('uap-cpp')
makedepends=('git' 'boost')
depends=('yaml-cpp' 'boost-libs' 'uap-core')
source=(
  git+https://github.com/ua-parser/uap-cpp.git
  cxxflags.patch
)
sha256sums=(
  'SKIP'
  'aad58cf62a9fea7276b452d99954d86896e096749911efae431edb7bc96f672a'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  git submodule init
  git submodule update
}

build() {
  cd "${srcdir}/${_pkgname}"
  patch < "../cxxflags.patch"
  make libuaparser_cpp.a libuaparser_cpp.so
}

check() {
  cd "${srcdir}/${_pkgname}"
  cp /usr/share/uap-core/regexes.yaml uap-core
  make test
}

package() {
  install -Dm755 "${srcdir}/${_pkgname}/libuaparser_cpp.so" "${pkgdir}/usr/lib/libuaparser_cpp.so"
  install -Dm644 "${srcdir}/${_pkgname}/libuaparser_cpp.a" "${pkgdir}/usr/lib/libuaparser_cpp.a"
  install -Dm644 "${srcdir}/${_pkgname}/UaParser.h" "${pkgdir}/usr/include/uap-cpp/UaParser.h"
}
