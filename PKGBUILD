# Maintainer: Javier Tia <javier dot tia at gmail dot com>
# Old Maintainer: Manuel Mendez <mmendez534@gmail.com>

pkgname=include-what-you-use
pkgver=0.24
pkgrel=1
_clang_major=20
_clang_minor=1
_clang_ver="${_clang_major}.${_clang_minor}"
pkgdesc="A tool for use with clang to analyze #includes in C and C++ source files"
url="https://include-what-you-use.org"
license=('LicenseRef-LLVM-Release-License')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('62d26a0e646cb6d94d5dee8d672009b938fdcfe64c5c6086693295e90d858754d9a6706b063ddc2cfe5660181df2722a4becfb56285b8cfc6d60f88f729924b7')
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
