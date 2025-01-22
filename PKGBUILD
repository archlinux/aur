# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Alexander Minges <alexander.minges@gmail.com>

pkgname=python-zeroc-ice
pkgver=3.7.10
pkgrel=1
pkgdesc="Python bindings for the Ice RPC framework"
arch=('x86_64')
url="https://zeroc.com"
license=("LicenseRef-GPL-2.0-only-with-ice-exceptions")
depends=('python' 'glibc' 'gcc-libs' 'mcpp' 'zeroc-ice')
checkdepends=('python-passlib' 'python-numpy')
optdepends=('python-numpy: numpy.ndarray sequence mapping')
source=("ice-${pkgver}.tar.gz::https://github.com/zeroc-ice/ice/archive/v${pkgver}.tar.gz"
        "python-3.13-build-fixes.patch")
sha256sums=('b90e9015ca9124a9eadfdfc49c5fba24d3550c547f166f3c9b2b5914c00fb1df'
            '7a5af8590f301fd716f1f37d4593e04a38f727bdfcbbc53e582d4a7273275449')

_make_args=(
  "OPTIMIZE=yes"
  "USR_DIR_INSTALL=yes"
  "prefix=/usr"
  "CONFIGS=shared cpp11-shared"
)

prepare() {
  cd "${srcdir}/ice-${pkgver}"

  # Backported from https://github.com/zeroc-ice/ice/pull/2910
  patch -Np1 < "${srcdir}/python-3.13-build-fixes.patch"
}

build() {
  cd "${srcdir}/ice-${pkgver}"

  make -C cpp "${_make_args[@]}" slice2py
  make -C python "${_make_args[@]}" ICE_BIN_DIST=cpp ice_compilers_dir="${PWD}/cpp"
}

check() {
  cd "${srcdir}/ice-${pkgver}"

  PYTHONPATH="${PWD}/python/python:${PWD}/python/scripts" ICE_BIN_DIST=cpp \
    python python/allTests.py
}

package() {
  cd "${srcdir}/ice-${pkgver}"

  make -C cpp slice2py_install "${_make_args[@]}" DESTDIR="${pkgdir}"
  make -C python install "${_make_args[@]}" ICE_BIN_DIST=cpp ice_compilers_dir="${PWD}/cpp" DESTDIR="${pkgdir}"
  python -m compileall -o 0 -o 1 -d /usr/lib "${pkgdir}/usr/lib"
  
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE ICE_LICENSE
}
