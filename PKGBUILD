# Maintainer: Stefan Biereigel <stefan@biereigel.de>

## options
: ${_build_python:=true}

_pkgtype="-git"

_pkgname="csxcad"
pkgbase="$_pkgname${_pkgtype:-}"
pkgver=0.6.3.r37.g3314deb
pkgrel=1
pkgdesc="A C++ library to describe geometrical objects and their properties"
url="https://github.com/thliebig/CSXCAD"
license=('LGPL-3.0-or-later')
arch=('i686' 'x86_64')

_depends_csxcad=(
  'fmt'
  'fparser' # aur/fparser-git
  'hdf5'
  'tinyxml'
  'verdict'
  'vtk'
)
_depends_python=(
  'python'
  'python-matplotlib'
  'python-numpy'
)
_makedeps_python=(
  'cython'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

depends=(
  ${_depends_csxcad[@]}
)
makedepends=(
  'cgal'
  'cmake'
  'fast_float'
  'git'
  'ninja'
  'nlohmann-json'
)

if [[ "${_build_python::1}" == "t" ]]; then
  depends+=(${_depends_python[@]})
  makedepends+=(${_makedeps_python[@]})
fi

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

_build_csxcad() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -DENABLE_RPATH=OFF
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
  DESTDIR="$srcdir/deps" cmake --install build
}

_build_python-csxcad() (
  [ "${_build_python::1}" != "t" ] && return

  export CXXFLAGS LDFLAGS
  CXXFLAGS="${CXXFLAGS//_FORTIFY_SOURCE=?/_FORTIFY_SOURCE=2}"
  CXXFLAGS+=" -I${srcdir@Q}/deps/usr/include"
  LDFLAGS+=" -L${srcdir@Q}/deps/usr/lib"

  cd "$_pkgsrc/python"
  python -m build --no-isolation --wheel --skip-dependency-check
)

build() {
  _build_csxcad
  _build_python-csxcad
}

_package_csxcad() {
  provides=('csxcad')
  conflicts=('csxcad')

  depends=(
    ${_depends_csxcad[@]}
  )

  DESTDIR="$pkgdir" cmake --install build
}

_package_python-csxcad() {
  pkgdesc+=" - python module"

  depends=(
    ${_depends_python[@]}
    'csxcad'
  )

  provides=('python-csxcad')
  conflicts=('python-csxcad')

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
