# Maintainer: Stefan Biereigel <stefan@biereigel.de>

## options
: ${_build_python:=false}

_pkgtype="-git"

# basic info
_pkgname="openems"
pkgbase="$_pkgname${_pkgtype:-}"
pkgver=0.0.36.r46.gfaec0f2
pkgrel=1
pkgdesc="A free and open source EC-FDTD solver"
url="https://github.com/thliebig/openEMS"
license=('GPL-3.0-or-later')
arch=('i686' 'x86_64')

_depends_openems=(
  'boost-libs'
  'fmt'
  'hdf5'
  'libpng'
  'tinyxml'
  'verdict'
  'vtk'

  # AUR
  'csxcad'
  'fparser'
)
_depends_python=(
  'python'
  'python-h5py'
  'python-matplotlib'
  'python-numpy'

  # AUR
  'python-csxcad'
)
_makedeps_python=(
  'cython'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

depends=(${_depends_openems[@]})
makedepends=(
  'boost'
  'cmake'
  'fast_float'
  'git'
  'ninja'
  'nlohmann-json'
  'openmpi'
)

if [[ "${_build_python::1}" == "t" ]]; then
  depends+=(${_depends_python[@]})
  makedepends+=(${_makedeps_python[@]})
fi

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+https://github.com/thliebig/openEMS")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

_build_openems() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
  DESTDIR="$srcdir/fakeinstall" cmake --install build
}

_build_python-openems() (
  [ "${_build_python::1}" != "t" ] && return

  cd "$_pkgsrc/python"

  export CFLAGS CXXFLAGS LDFLAGS
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

  CFLAGS+=" -I'$srcdir/fakeinstall/usr/include'"
  LDFLAGS+=" -L'$srcdir/fakeinstall/usr/lib'"

  python -m build --no-isolation --wheel --skip-dependency-check
)

build() {
  _build_openems
  _build_python-openems
}

_package_openems() {
  provides=('openems')
  conflicts=('openems')

  depends=(
    ${_depends_openems[@]}
  )

  mv "$srcdir"/fakeinstall/* "$pkgdir/"
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}

_package_python-openems() {
  pkgdesc+=" - python module"

  depends=(
    ${_depends_python_openems[@]}
    'openems'
  )

  provides=('python-openems')
  conflicts=('python-openems')

  cd "$_pkgsrc/python"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

pkgname=("$_pkgname${_pkgtype:-}")
[[ "${_build_python::1}" == "t" ]] && pkgname+=("python-$_pkgname${_pkgtype:-}")

for _p in "${pkgname[@]}"; do
  _q="${_p%${_pkgtype:-}}"
  eval "package_$_p() {
    $(declare -f _package_$_q)
    _package_$_q
  }"
done
