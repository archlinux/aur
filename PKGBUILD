# Maintainer: Dreieck
# Contributor: Roberto Nobrega <rwnobrega@gmail.com>

_pkgname='gr-rds'
pkgname="${_pkgname}-git"
epoch=1
pkgver=3.8.0+r314.20210721.d43ead6
pkgrel=1
pkgdesc="An FM-RDS Receiver for GNU Radio"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gnuradio>=3.9' 'libvolk')
makedepends=('boost' 'cmake' 'doxygen' 'git' 'pygccxml' 'swig')
optdepends=()
provides=("${_pkgname}" "${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-doc")
url="https://github.com/bastibl/gr-rds"
source=("${_pkgname}::git+git://github.com/bastibl/gr-rds.git")
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
