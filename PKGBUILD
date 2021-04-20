# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Alexander F. Rødseth <xyproto at archlinux dot org>
# Contributor: Vincent Bernardoff <vb at luminar dot eu dot org>

pkgname=clingo
pkgver=5.5.0
pkgrel=1
pkgdesc='Grounding tools for (disjunctive) logic programs'
arch=('i686' 'x86_64' 'pentium4')
url='https://potassco.org/'
license=('MIT')
depends=('lua' 'python')
makedepends=('clang' 'cmake' 'git' 'ninja' 're2c')
conflicts=('clasp')
source=("git+https://github.com/potassco/clingo#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  sed '/#include <xlocale.h>/d' -i "${srcdir}"/clingo/clasp/libpotassco/src/string_convert.cpp
}

build() {
  mkdir -p ${srcdir}/build
  cd ${srcdir}/build
  export CXXFLAGS="${CXXFLAGS//-fvar-tracking-assignments/}"
  cmake "../${pkgname}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCLINGO_REQUIRE_PYTHON=ON \
    -DCLINGO_BUILD_PY_SHARED=ON \
    -DPYCLINGO_USER_INSTALL=OFF \
    -DCLINGO_REQUIRE_LUA=ON \
    -DCLINGO_BUILD_LUA_SHARED=ON \
    -DCMAKE_CXX_COMPILER=clang++ \
    -G Ninja
  ninja
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 "${srcdir}/${pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

# vim: ts=2 sw=2 et:
