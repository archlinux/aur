# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="pybertini"
pkgname="python-${_name}"
_commit="436c6ec507594b13edf67212256f90d2b83fa121" # 1.0alpha5
pkgver=1.0alpha5
pkgrel=1
pkgdesc="Python interface for Bertini2"
arch=('x86_64')
url="https://github.com/bertiniteam/b2"
license=('custom:GPL-3.0-or-later WITH Bertini2-Additional-GPL-Terms')
depends=('bertini2' 'boost-libs>=1.83' 'eigenpy>=3.3' 'gcc-libs' 'glibc' 'gmp'
         'mpfr' 'python' 'python-numpy')
makedepends=('boost>=1.83' 'eigen>=3.3' 'python-build' 'python-installer'
             'python-setuptools' 'python-wheel')
_pkgsrc="b2-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('b9b34a27a53924d2e4556c4646a791b6c918f7dc306450daae585d60177a9656')

pkgver() {
  cd "${srcdir}/${_pkgsrc}/python"
  sed -nE "s/.*version='([^']+)'.*/\1/p" "setup.py" | sed -E 's/\.?(alpha|beta)/\1/'
}

build() {
  cd "${srcdir}/${_pkgsrc}/python"
  libtoolize
  autoreconf -vfi
  ./configure \
    --prefix='/usr'
  make

  python -m build --wheel --no-isolation
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   PYTHONPATH="${PWD}/build/lib/${_name}" pytest
# }

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  # make DESTDIR="${pkgdir}" install

  cd "${srcdir}/${_pkgsrc}/python"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  find "examples" -type f -exec install -vDm644 "{}" "${pkgdir}/usr/share/doc/${pkgname}/{}" \;

  cd "${srcdir}/${_pkgsrc}/python/include"
  find . -name "*.hpp" -type f -exec install -vDm644 "{}" "${pkgdir}/usr/include/${_name}/{}" \;

  cd "${srcdir}/${_pkgsrc}/python/.libs"
  install -vDm644 "_${_name}.so" "${pkgdir}${site_packages}/pybertini/_${_name}.so"

  cd "${pkgdir}${site_packages}"
  rm -rf "test"
}
