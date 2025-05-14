# Maintainer: dreieck

_pkgname='gr-scopy'
pkgname="${_pkgname}-git"
epoch=0
_gnuradioversion=3.10
_gnuradionextversion=3.11
pkgver=1.0.0+r11.20220602.a69ccb2
pkgrel=2
pkgdesc="Scopy IIO blocks for GNU Radio."
arch=('i686' 'x86_64')
license=('GPL-3.0-or-later')
url="https://github.com/analogdevicesinc/gr-scopy"
depends=(
  'boost-libs'
  'gcc-libs'
  'glibc'
  'gmp'
  "gnuradio>=${_gnuradioversion}"
  "gnuradio<${_gnuradionextversion}"
  'libfmt.so'
  'libspdlog.so'
  'libvolk.so'
  #'python>=3'
  #'python-pyqt5'
)
makedepends=(
  'bison'
  'boost'
  'cmake'
  'doxygen'
  'flex'
  'fmt'
  'git'
  'libvolk'
  # 'pybind11'
  # 'python-pygccxml'
  'python>=3'
  'spdlog'
  'swig'
)
optdepends=()
provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}-doc=${pkgver}"
  "libgnuradio-scopy.so"
)
conflicts=(
  "${_pkgname}"
  "${_pkgname}-doc"
  "libgnuradio-scopy.so"
)
source=("${_pkgname}::git+${url}.git#branch=3.10")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}"

  mkdir -p build

  cd "${srcdir}/${_pkgname}"
  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  #_ver_major="$(grep -E '^[[:space:]]*set\([[:space:]]*VERSION_INFO_MAJOR_VERSION[[:space:]]+' CMakeLists.txt | sed -E 's|^[[:space:]]*set\([[:space:]]*VERSION_INFO_MAJOR_VERSION[[:space:]]+([^)]*)[[:space:]]*\).*$|\1|')"
  #_ver_minor="$(grep -E '^[[:space:]]*set\([[:space:]]*VERSION_INFO_MINOR_VERSION[[:space:]]+' CMakeLists.txt | sed -E 's|^[[:space:]]*set\([[:space:]]*VERSION_INFO_MINOR_VERSION[[:space:]]+(.*)[[:space:]]*\).*$|\1|')"
  #_ver="${_ver_major}.${_ver_minor}"
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
  cd "${srcdir}"

  cmake \
    -S "${_pkgname}" -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DENABLE_DOXYGEN=ON \
    -DENABLE_GRC=ON \
    -DENABLE_PYTHON=ON \
    -DENABLE_TESTING=ON

  make -C build
}

check() {
  cd "${srcdir}"

  make -C build test
}

package() {
  cd "${srcdir}"

  make -C build DESTDIR="${pkgdir}" install

  ## Do some compatibility symlinks:
  cd "${pkgdir}/usr/lib/cmake/gnuradio-scopy"
  ln -sv gnuradio-scopyTargets.cmake gnuradio-scopyTarget.cmake
  ln -sv gnuradio-scopyTargets-release.cmake gnuradio-scopyTarget-release.cmake

  cd "${srcdir}/${_pkgname}"
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" git.log MANIFEST.md README.md
  install -Dvm644 -t "${pkgdir}/usr/share/${pkgname}" LICENSE
}
