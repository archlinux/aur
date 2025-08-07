# Maintainer: pierspad <pierpaolospadafora@proton.me>
pkgname=clingo
pkgver=5.8.0
pkgrel=1
pkgdesc='Grounding tools for (disjunctive) logic programs'
arch=('i686' 'x86_64' 'pentium4')
url='https://potassco.org/'
license=('MIT')
depends=('lua' 'python')
makedepends=('clang' 'cmake' 'git' 'ninja' 're2c')
conflicts=('clasp')
options=('!lto')
source=("git+https://github.com/potassco/clingo#tag=v${pkgver}")
sha256sums=('eb06af702e54d4bd7aefda2776b469e78dc5728a41b0f3867515c599625a0909')

build() {
  mkdir -p ${srcdir}/build
  cd ${srcdir}/build
  export CXXFLAGS="${CXXFLAGS//-fvar-tracking-assignments/}"
  cmake "../${pkgname}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCLINGO_BUILD_WITH_PYTHON=ON \
    -DCLINGO_BUILD_WITH_LUA=ON \
    -DCLINGO_BUILD_LUA_SHARED=ON \
    -DCMAKE_CXX_COMPILER=clang++ \
    -G Ninja
  ninja
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 "${srcdir}/${pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
