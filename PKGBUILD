# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="pybertini"
pkgname="${_pkgname}-git"
pkgver=r1703.220a4c0
pkgrel=1
pkgdesc="Python interface for Bertini2"
arch=('any')
# We'll use a fork created by one of the maintainers with CMake build support until it is merged
# url="https://github.com/bertiniteam/b2"
url="https://github.com/ThisIsNotANamepng/b2"
license=('custom:GPL-3.0-or-later WITH Bertini2-Additional-GPL-Terms')
makedepends=('git' 'cmake>=3.22' 'boost>=1.82' 'eigen>=3.3' 'python-setuptools')
depends=('glibc' 'gcc-libs' 'bertini2' 'boost-libs>=1.65' 'gmp' 'mpfr' 'libmpc'
         'python' 'python-numpy' 'eigenpy>=3.3')
optdepends=('pybertini-docs: HTML documentation')
provides=("${_pkgname}" '_pybertini.so')
conflicts=("${_pkgname}")
_pkgsrc="b2"
source=("${_pkgsrc}::git+${url}.git"
        "${_pkgname}_fix_cmake_targets.patch")
sha256sums=('SKIP'
            'bc474c961e44078114d4429bc711e0e7a09ac153157360dad9a4b3550f21d66d')

pkgver() {
  cd "${_pkgsrc}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare(){
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

  cd "${srcdir}/${_pkgsrc}/python"
  sed -i "s/python311/python${python_version//./}/g" CMakeLists.txt
  patch -p1 -i "${srcdir}/${_pkgname}_fix_cmake_targets.patch"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  cmake \
    -G 'Unix Makefiles' \
    -B "python/build" \
    -S "python" \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DCMAKE_CXX_FLAGS:STRING="${CPPFLAGS} -I/usr/include/bertini2" \
    -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS} -L/usr/lib/bertini2" \
    -DBertini2_INCLUDE_DIR:PATH='/usr/include/bertini2' \
    -Wno-dev
  cmake --build "python/build"

  cd "python"
  python setup.py build
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

  DESTDIR="${pkgdir}" cmake --install "python/build"
  libtool --finish "${pkgdir}${site_packages}"

  cd "python"
  # install -Dm644 "NEWS"    "${pkgdir}/usr/share/doc/${_pkgname}/NEWS"
  install -Dm644 "AUTHORS" "${pkgdir}/usr/share/licenses/${_pkgname}/AUTHORS"

  python setup.py install --root="${pkgdir}" --optimize=1
  rm -rf "${pkgdir}${site_packages}/test"

  cd "${srcdir}/${_pkgsrc}/licenses"
  install -Dm644 "GNU GENERAL PUBLIC LICENSE"    "${pkgdir}/usr/share/licenses/${_pkgname}/GPL-3.0-or-later"
  install -Dm644 "BERTINI2_ADDITIONAL_GPL_TERMS" "${pkgdir}/usr/share/licenses/${_pkgname}/Bertini2-Additional-GPL-Terms"
}
