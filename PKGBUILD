# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="pybertini"
pkgname="${_pkgname}-git"
pkgver=1.0.alpha5.r38.245ed70
_commit="436c6ec507594b13edf67212256f90d2b83fa121"
pkgrel=1
pkgdesc="Python interface for Bertini2"
arch=('x86_64')
url="https://github.com/bertiniteam/b2"
license=('custom:GPL-3.0-or-later WITH Bertini2-Additional-GPL-Terms')
makedepends=('git' 'cmake>=3.22' 'boost>=1.83' 'eigen>=3.3' 'python-setuptools'
             'python-build' 'python-installer' 'python-wheel')
depends=('glibc' 'gcc-libs' 'bertini2' 'boost-libs>=1.83' 'gmp' 'mpfr' 'libmpc'
         'python' 'python-numpy' 'eigenpy>=3.3')
optdepends=("${_pkgname}-docs: HTML documentation")
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="b2"
source=("${_pkgsrc}::git+${url}.git"
        "${_pkgname}_fix_cmake_targets.patch")
sha256sums=('SKIP'
            'bc474c961e44078114d4429bc711e0e7a09ac153157360dad9a4b3550f21d66d')

pkgver() {
  cd "${_pkgsrc}"
  local rev_count=$(git rev-list --count "${_commit}..HEAD")
  local short_hash=$(git rev-parse --short=7 HEAD)

  cd "${srcdir}/${_pkgsrc}/python"
  local version=$(sed -n 's/AC_INIT(\[pybertini\], \[\([^]]*\)\],.*/\1/p' "configure.ac" | sed 's/-/./')

  printf "%s.r%s.%s" "${version}" "${rev_count}" "${short_hash}"
}

prepare(){
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

  git -C "${srcdir}/${_pkgsrc}" clean -dfx

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
  python -m build --wheel --no-isolation
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   PYTHONPATH="${PWD}/build/lib/${_pkgname}" pytest
# }

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="${pkgdir}" cmake --install "python/build"
  libtool --finish "${pkgdir}${site_packages}"

  cd "python"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  rm -rf "${pkgdir}${site_packages}/test"
}
