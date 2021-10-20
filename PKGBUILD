# Maintainer: Forest Crossman <cyrozap at gmail dot com>
# Modified from gr-osmosdr-git PKGBUILD

_pkgname='gr-cc1111'
pkgname="${_pkgname}-git"
epoch=1
pkgver=r10.20141005.e6b5eb0
pkgrel=1
pkgdesc="CC1111 packet encoder/decoder for GNU Radio"
arch=('i686' 'x86_64')
url="https://github.com/funoverip/gr-cc1111"
license=('GPL3')
depends=(
  'gnuradio'
  'libvolk'
  'swig'
)
makedepends=(
  'cmake'
  'boost'
  'git'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+git://github.com/funoverip/gr-cc1111.git")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgname}"

  mkdir -p build
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_rev}" ]; then
    error "Git commit count could not be determined."
    return 1
  else
    printf '%s' "r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}/build"

  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_GRC=ON \
    -DENABLE_PYTHON=ON \
    -DENABLE_TESTING=ON \
    -DPYTHON_EXECUTABLE="$(which python2)" \
    -DPYTHON_INCLUDE_DIR="$(echo /usr/include/python2*)" \
    -DPYTHON_LIBRARY="$(echo /usr/lib/libpython2.*.so)" \
    ../src/gr-cc1111
  make
}

package() {
  cd cd "${srcdir}/${_pkgname}/build"

  make DESTDIR="${pkgdir}" install
}
