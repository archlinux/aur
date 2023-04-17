# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Frank Siegert <frank dot siegert at googlemail dot com>

pkgbase=hepmc
pkgname=("${pkgbase}" "${pkgbase}-docs")
_pkgname=HepMC3
pkgver=3.2.6
pkgrel=1
pkgdesc="A particle physics package for storing collision events from Monte Carlo generators"
arch=('x86_64')
url="http://hepmc.web.cern.ch/"
license=('GPL3')
makedepends=('cmake' 'doxygen' 'gcc-fortran' 'graphviz' 'hepmc2' 'pythia8' 'python' 'root')
source=("${pkgbase}-${pkgver}.tar.gz::http://hepmc.web.cern.ch/${pkgbase}/releases/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('248f3b5b36dd773844cbe73d51f60891458334b986b259754c59dbf4bbf1d525')

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D HEPMC3_BUILD_DOCS=ON
    -D HEPMC3_BUILD_EXAMPLES=ON
    -D HEPMC3_ENABLE_TEST=ON
    -D HEPMC3_INSTALL_INTERFACES=ON
    -D HEPMC3_PYTHON_VERSIONS='3.X'
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
