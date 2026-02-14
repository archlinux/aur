# Maintainer: pierspad <pierpaolospadafora@proton.me>
pkgname=clingo
pkgver=5.8.0
pkgrel=2
pkgdesc='Grounding tools for (disjunctive) logic programs'
arch=('i686' 'x86_64' 'pentium4')
url='https://potassco.org/'
license=('MIT')
depends=('lua' 'python')
makedepends=('clang' 'cmake' 'git' 'ninja' 're2c')
conflicts=('clasp')
options=('!lto')
source=("git+https://github.com/potassco/clingo#tag=v${pkgver}"
        "fix-re2c-4.3-compat.patch")
sha256sums=('eb06af702e54d4bd7aefda2776b469e78dc5728a41b0f3867515c599625a0909'
            'e4f1e150eb1bfaf9def1a315caa6297149f21e5ec0a8e68213a69426de45831c')

prepare() {
  cd ${srcdir}/${pkgname}
  # Upstream fix for re2c >= 4.3 compatibility (commit 92d7f44)
  patch -Np1 -i "${srcdir}/fix-re2c-4.3-compat.patch"
}

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
