# Maintainer: Javier Tia <floss@jetm.me>
# Old Maintainer: Manuel Mendez <mmendez534@gmail.com>

pkgname=include-what-you-use
pkgver=0.26
pkgrel=1
_clang_major=22
_clang_minor=1
_clang_ver="${_clang_major}.${_clang_minor}"
pkgdesc="A tool for use with clang to analyze #includes in C and C++ source files"
url="https://include-what-you-use.org"
license=('LicenseRef-LLVM-Release-License')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('dc7cd155d69bf5604de9560bd38b755b4f3194dc7ed358f36d0cb71015489b50f4743a85e8590bf016351442841c7f0dc7707d3db45f5949f3ad83d3395256d7')
arch=('x86_64')
_min="${_clang_ver}"
_max=$((_clang_major + 1)).0
depends=("clang>=${_min}" "clang<${_max}" python3 gcc-libs glibc llvm-libs)
makedepends=("cmake" "llvm>=${_min}" "llvm<${_max}" "ninja")
install=iwyu.install

build() {
  rm -rf build
  cmake -Wno-dev -GNinja -S"${pkgname}-${pkgver}" -Bbuild --install-prefix /usr
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  mv -v "${pkgdir}/usr/bin"/{fix_includes.py,iwyu-fix-includes}
  mv -v "${pkgdir}/usr/bin"/{iwyu_tool.py,iwyu-tool}
}

# vim:set ts=2 sw=2 et:
