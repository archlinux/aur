# Contributor: Michele Mocciola <mimocciola@yahoo.com>
_base=tfel-mfront
_upstream=tfel
pkgname=${_base}-git
pkgver=20240222.r2684.9d61feca8
pkgrel=1
pkgdesc="TFEL/MFront introduce DSLs based on C++ to handle material knowledge"
arch=(x86_64)
url="https://github.com/thelfer/${_upstream}"
license=(GPL3)
depends=(gcc-libs gnuplot boost boost-libs)
provides=(tfel mfront)
makedepends=(cmake gcc-fortran python python-numpy)
source=(${_base}::git+${url}#branch=master)
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}"/"${_base}"
  printf "%s.r%s.%s" \
         "$(git log -1 --format=%cs | tr -d '-')" \
         "$(git rev-list --count HEAD)" \
         "$(git rev-parse --short HEAD)"
}

prepare() {
  git -C "${srcdir}"/"${_base}" clean -dfx
}

build() {
  CONFOPTS=(
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr
    -Denable-python=ON
    -Denable-python-bindings=ON
    -Denable-numpy-support=ON
    -Dinstall-system-libraries=ON
    -Denable-fortran=ON
    -Denable-aster=OFF
    -Denable-abaqus=OFF
    -Denable-ansys=OFF
    -Denable-europlexus=OFF
    -Denable-zmat=OFF
    -Denable-cyrano=OFF
    -Denable-calculix=ON
    -Denable-comsol=OFF
    -Denable-diana-fea=OFF
    -Denable-lsdyna=OFF
    -Denable-cxx-17=ON
    -Denable-reference-doc=OFF
    -Denable-doxygen-doc=OFF
    # -Denable-mfront-quantity-tests=ON
    -Denable-mfront-quantity-tests=OFF
    # -Denable-testing=ON
    -Denable-testing=OFF
    # -Denable-sanitize-options=ON
    -Denable-sanitize-options=OFF
    -Wno-dev
    -S "${srcdir}"/"${_base}"
    -B "${srcdir}"/build
  )
  cmake ${CONFOPTS[@]}
  make -C "${srcdir}"/build
}

check() {
  LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${srcdir}/build/lib/" make -C "${srcdir}"/build check
}

package() {
  # DESTDIR="${pkgdir}" cmake --build "${srcdir}"/"${_base}"/build --target install
  make -C "${srcdir}"/"${_base}"/build DESTDIR="${pkgdir}" install
  install -Dm 644 ${_base}/LICENCE-GNU-GPL -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
