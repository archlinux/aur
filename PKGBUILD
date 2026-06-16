# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Doron Behar <doron.behar@gmail.com>

## GPG key: https://github.com/jedbrown.gpg

_pkgname=libceed
pkgname=${_pkgname}-git
pkgver=0.12.0.r1392.gd05a68c
pkgrel=1
pkgdesc="Code for Efficient Extensible Discretizations"
arch=('x86_64')
license=('LicenseRef-BSD-2-clause')
url="https://github.com/ceed/${_pkgname}"
depends=(
  "libgomp"
  "libgcc"
  "glibc"
)
makedepends=(
  "git"
  "gcc-fortran"
  "python-build"
  "python-installer"
  "python-setuptools"
  "python-wheel"
)
optdepends=(
  "python: If using the Python API"
  "python-cffi: If using the Python API"
  "python-numpy: If using the Python API"
  "python-pytest: If running the Python tests"
  "python-setuptools: If running the Python tests"
)
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${_pkgname}::git+${url}")
b2sums=('SKIP')
validpgpkeys=('BA543CE09D732BE604D53F6FCA6D4A3B32D335A0') # Jed Brown <jed@jedbrown.org>
options=()

pkgver() {
  cd "${_pkgname}"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${_pkgname}
  # don't compile CEED twice for python-ceed
  sed -i '/always-make/d' setup.py
}

build() {
  (
    # NOTE: Export build options to environment variables
    # otherwise python will build with a different set of variables
    export OPENMP=1
    # Add -fPIC
    local CFLAGS="${CFLAGS} -fPIC"
    local CXXFLAGS="${CXXFLAGS} -fPIC"

    cd "${_pkgname}"
    # build: first show info and then build the lib(s)
    make for_install=1 prefix=/usr DESTDIR=${pkgdir} info lib

    # Build Python package
    python -m build --wheel --no-isolation

  )
}

# check() {
#   export OPENMP=1
#   local CFLAGS="${CFLAGS} -fPIC"
#   local CXXFLAGS="${CXXFLAGS} -fPIC"
#   cd ${_pkgname}
#   make test
# }

package() {
  cd ${_pkgname}
  make install DESTDIR="$pkgdir" prefix="/usr"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}/"

  # Install Python package
  python -m installer --destdir="$pkgdir/" dist/*.whl
}
