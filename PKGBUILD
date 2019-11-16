# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=clingo
pkgver=5.4.0
pkgrel=1
pkgdesc='Grounding tools for (disjunctive) logic programs'
arch=('i686' 'x86_64' 'pentium4')
url='https://potassco.org/'
license=('MIT')
depends=('lua' 'python')
makedepends=('clang' 'cmake' 'git' 'ninja' 're2c')
conflicts=('clasp')
source=("git+https://github.com/potassco/clingo#tag=v${pkgver}"
        "python38-fix.patch")
sha256sums=('SKIP'
            '782d9fa710e59cba36bc3bfb922d52de0469cd3d0c5c591308f8e459139bd72f')

prepare() {
  sed '/#include <xlocale.h>/d' -i "${srcdir}"/clingo/clasp/libpotassco/src/string_convert.cpp

  cd "${srcdir}/${pkgname}"
  # Upstream patch
  patch -Np1 -i "${srcdir}/python38-fix.patch"
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
