# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="pybertini"
_pkgname="python-${_name}"
pkgname="${_pkgname}-git"
pkgver=1.0alpha5.r1715.735bd7f
pkgrel=2
pkgdesc="Python interface for Bertini2"
arch=('x86_64')
url="https://github.com/bertiniteam/b2"
license=('custom:GPL-3.0-or-later WITH Bertini2-Additional-GPL-Terms')
depends=('bertini2' 'boost-libs>=1.83' 'eigenpy>=3.3' 'gcc-libs' 'glibc' 'gmp'
         'libmpc' 'mpfr' 'python' 'python-numpy')
makedepends=('boost>=1.83' 'cmake>=3.22' 'eigen>=3.3' 'git' 'python-build'
             'python-installer' 'python-setuptools' 'python-wheel')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
replaces=("${_name}")
_pkgsrc="b2"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  local rev_count=$(git rev-list --count HEAD)
  local short_hash=$(git rev-parse --short=7 HEAD)

  cd "python"
  local version=$(sed -nE "s/.*version='([^']+)'.*/\1/p" "setup.py" | sed -E 's/\.?(alpha|beta)/\1/')

  printf "%s.r%s.%s" "${version}" "${rev_count}" "${short_hash}"
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  git clean -dfx
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
#   PYTHONPATH="${PWD}/build/lib/${_name}" pytest
# }

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  # DESTDIR="${pkgdir}" cmake --install "python/build"

  cd "${srcdir}/${_pkgsrc}/python"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  find "examples" -type f -exec install -vDm644 "{}" "${pkgdir}/usr/share/doc/${_pkgname}/{}" \;

  cd "${srcdir}/${_pkgsrc}/python/include"
  find . -type f -exec install -vDm644 "{}" "${pkgdir}/usr/include/${_name}/{}" \;

  cd "${srcdir}/${_pkgsrc}/python/build"
  install -vDm644 "_${_name}.so" "${pkgdir}${site_packages}/pybertini/_${_name}.so"

  cd "${pkgdir}${site_packages}"
  rm -rf "test"
}
