# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Frank Siegert <frank dot siegert at googlemail dot com>

pkgbase=hepmc
pkgname=("${pkgbase}" "${pkgbase}-docs")
_pkgname=HepMC3
pkgver=3.3.1
pkgrel=7
pkgdesc="A particle physics package for storing collision events from Monte Carlo generators"
arch=('x86_64')
url="https://hepmc.web.cern.ch/"
license=('GPL3')
makedepends=('cmake' 'doxygen' 'gcc-fortran' 'graphviz' 'hepmc2' 'pythia8' 'python' 'root' 'protobuf' 'cern-vdt')
source=("${pkgbase}-${pkgver}.tar.gz::https://hepmc.web.cern.ch/${pkgbase}/releases/${_pkgname}-${pkgver}.tar.gz"
        0001-HepMC3ViewerFrame.cc-fix-build-with-recent-Graphviz.patch)
sha256sums=('08240160b0f28dc3293aa4d61ce65e2d67cd597acf6faca439f2e46625f7e793'
            'a6eb8fb1d440826598500e327757054032a74d439bd64d6461e4a74816a127ac')

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

prepare() {
  cd "${_pkgname}-${pkgver}"
  patch -p1 -i ../0001-HepMC3ViewerFrame.cc-fix-build-with-recent-Graphviz.patch
}

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
    -D HEPMC3_CXX_STANDARD=17
    -D HEPMC3_BUILD_DOCS=ON
    -D HEPMC3_BUILD_EXAMPLES=ON
    -D HEPMC3_ENABLE_TEST=ON
    -D HEPMC3_INSTALL_INTERFACES=ON
    -D HEPMC3_PYTHON_VERSIONS='3.X'
    -D HEPMC3_ENABLE_PROTOBUFIO=ON
    -D USE_INTERFACE_FROM_PYTHIA8=ON
    -D PYTHIA8_XMLDOC_DIR=/usr/share/pythia8/xmldoc
    -S $_pkgname-$pkgver
    -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  ctest --test-dir build --output-on-failure
}

package_hepmc() {
  depends=(
    bash
    gcc-libs
    glibc
  )
  optdepends=(
    'hpmc-docs: for documentation'
    'pythia8: Pythia support'
    'python: Python interface'
    'root: ROOT I/O'
    'protobuf: Protocol Buffers I/O'
  )

  DESTDIR="$pkgdir" cmake --install build

  # fix CMake
  # TODO: report upstream and have them fix this!
  install -vd "${pkgdir}/usr/lib/cmake"
  mv -v "${pkgdir}/usr/share/HepMC3/cmake" "${pkgdir}/usr/lib/cmake/${_pkgname}"
  sed -i 's@${CMAKE_CURRENT_LIST_DIR}/../../../@/usr@' \
    "${pkgdir}/usr/lib/cmake/${_pkgname}/${_pkgname}Config.cmake"

  (
    cd "$pkgdir"
    _pick $pkgbase-docs usr/share/doc
  )
}

package_hepmc-docs() {
  pkgdesc+=" - documentation"

  mv -v $pkgname/* "$pkgdir"
}
