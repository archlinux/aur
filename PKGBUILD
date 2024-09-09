# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="crosstypes"
pkgname="${_pkgname}-svn"
pkgver=0.1.0.r0
_revision="r10"
pkgrel=1
pkgdesc="Cross-platform library of PODT (plain old data types) in C/C++"
arch=('any')
url="https://${_pkgname}.sourceforge.net"
license=('BSD-3-Clause')
makedepends=('cmake>=2.4.2' 'subversion')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::svn+https://svn.code.sf.net/p/${_pkgname}/code/work")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  local rev_count=$(( $(svn info --show-item revision) - ${_revision#r} ))

  cd "${srcdir}/${_pkgsrc}"
  local version=$(sed -n 's/SET( CROSS_TYPES_VERSION_\(MAJOR\|MINOR\|PATCH\) \([0-9]\+\) )/\2/p' CMakeLists.txt | paste -sd'.')

  printf "%s.r%s" "${version}" "${rev_count}"
}

build() {
  cd "${srcdir}"
  cmake \
    -G 'Unix Makefiles' \
    -B "${_pkgsrc}/build" \
    -S "${_pkgsrc}" \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -Wno-dev
  cmake --build "${_pkgsrc}/build"
}

check() {
  cd "${srcdir}"
  ctest --test-dir "${_pkgsrc}/build" --output-on-failure --stop-on-failure
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "AUTHORS" "${pkgdir}/usr/share/licenses/${_pkgname}/AUTHORS"
}
