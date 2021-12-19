# Maintainer: dreieck
# Contributor: Phaotee
# Contributor: Lucas Rooyakkers <lucas dot rooyakkers at queensu at ca>

_pkgname='gr-foo'
pkgname="${_pkgname}-git"
epoch=0
pkgver=1.1.0.git+r169.20210805.cc8bfc6
pkgrel=2
pkgdesc="gnuradio custom blocks by bastibl. Latest git checkout."
arch=(
  'i686'
  'x86_64'
)
url="https://github.com/bastibl/gr-foo"
license=(
  'GPL3'
)
depends=(
  'boost-libs'
  'gnuradio>=3.9'
  'gnuradio<3.10'
  'libuhd'
  'libvolk'
  'libsndfile'
  'log4cpp'
  'pybind11'
)
makedepends=(
  'boost'
  'cmake>=3.8'
  'doxygen'
  'git'
  'swig'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
source=("${_pkgname}::git+https://github.com/bastibl/gr-foo#branch=maint-3.9")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p build
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver_major="$( grep -E '^[[:space:]]*set\(VERSION_MAJOR' CMakeLists.txt | tail -n1 | awk '{print $2}' | sed 's|).*||' )"
  _ver_api="$(   grep -E '^[[:space:]]*set\(VERSION_API'   CMakeLists.txt | tail -n1 | awk '{print $2}' | sed 's|).*||' )"
  _ver_abi="$(   grep -E '^[[:space:]]*set\(VERSION_ABI'   CMakeLists.txt | tail -n1 | awk '{print $2}' | sed 's|).*||' )"
  _ver_patch="$( grep -E '^[[:space:]]*set\(VERSION_PATCH' CMakeLists.txt | tail -n1 | awk '{print $2}' | sed 's|).*||' )"

  _ver="${_ver_major}.${_ver_api}.${_ver_abi}"
  if [ -n "${_ver_patch}" ]; then
    _ver+=".${_ver_patch}"
  fi

  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}+r${_rev}.${_date}.${_hash}"
  fi

}

build() {
  cd "${srcdir}/${_pkgname}"
  cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_DOXYGEN=ON \
    -DENABLE_GRC=ON \
    -DENABLE_PYTHON=ON \
    -DENABLE_TESTING=ON \
    -DVOLK_FOUND=ON \
    ..
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  for _docfile in README.md; do
    install -v -D -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done

  cd build
  make DESTDIR="${pkgdir}" install
}
