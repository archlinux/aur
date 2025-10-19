# Maintainer: dreieck
# Contributor: Roberto Nobrega <rwnobrega@gmail.com>

_pkgname='gr-rds'
pkgname="${_pkgname}-git"
epoch=1
pkgver=3.10+r357.20251017.1b8aee1
pkgrel=1
pkgdesc="An FM-RDS Receiver for GNU Radio"
arch=('i686' 'x86_64')
license=('GPL-3.0-or-later')
depends=('boost-libs' 'gcc-libs' 'glibc' 'gnuradio>=3.9' 'python>=3' 'python-pyqt5')
makedepends=('boost' 'cmake' 'doxygen' 'fmt' 'git' 'libvolk' 'pybind11' 'python-pygccxml' 'spdlog' 'swig')
optdepends=()
provides=("${_pkgname}-doc=${pkgver}" "${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-doc")
url="https://github.com/bastibl/gr-rds"
source=("${_pkgname}::git+https://github.com/bastibl/gr-rds.git")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p build
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | awk -F- '{print $1}' | sed -E 's|^v||')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -n "${_ver}" ]; then
    printf "%s" "${_ver}+r${_rev}.${_date}.${_hash}"
  else
    error "${FUNCNAME[0]}: Could not determin version. Aborting."
    return 1
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"
  cd 'build'

  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DENABLE_DOXYGEN=ON \
    -DENABLE_GRC=ON \
    -DENABLE_PYTHON=ON \
    -DENABLE_TESTING=ON \
    ..

  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  cd 'build'

  make DESTDIR="${pkgdir}" install

  cd "${srcdir}/${_pkgname}"
  for _docfile in MANIFEST.md README.md; do
    install -v -D -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${pkgname}/${_docfile}"
  done
}
