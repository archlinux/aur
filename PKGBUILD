# Maintainer: Clar Fon <them@lightdark.xyz>

_pkgname=uap-cpp
pkgname=$_pkgname-git
pkgver=r98.8701a85
pkgrel=1
pkgdesc="C++ implementation of ua-parser"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/ua-parser/uap-cpp'
license=('MIT')
provides=('uap-cpp')
conflicts=('uap-cpp')
makedepends=('git' 'boost')
depends=('yaml-cpp' 'boost-libs' 'uap-core')
source=(git+https://github.com/ua-parser/uap-cpp.git)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  git submodule update --init
}

build() {
  cd "${srcdir}/${_pkgname}"
  make libuaparser_cpp.a libuaparser_cpp.so
}

check() {
  cd "${srcdir}/${_pkgname}"
  cp /usr/share/uap-core/regexes.yaml uap-core
  # tests are broken
  # make test
}

package() {
  install -Dm755 "${srcdir}/${_pkgname}/libuaparser_cpp.so" "${pkgdir}/usr/lib/libuaparser_cpp.so"
  install -Dm644 "${srcdir}/${_pkgname}/libuaparser_cpp.a" "${pkgdir}/usr/lib/libuaparser_cpp.a"
  install -Dm644 "${srcdir}/${_pkgname}/UaParser.h" "${pkgdir}/usr/include/uap-cpp/UaParser.h"
}
