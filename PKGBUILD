# Maintainer: dreieck
# Contributor: Phaotee
# Contributor: Lucas Rooyakkers <lucas dot rooyakkers at queensu at ca>

_pkgname='gr-foo'
pkgname="${_pkgname}-git"
epoch=0
pkgver=r169.cc8bfc6
pkgrel=1
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
  'spdlog'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
source=("${_pkgname}::git+https://github.com/bastibl/gr-foo#branch=maint-3.10")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p build
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
