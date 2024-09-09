# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="crosstypes"
pkgver=0.1.0
_revision="r10"
pkgrel=1
pkgdesc="Cross-platform library of PODT (plain old data types) in C/C++"
arch=('any')
url="https://${pkgname}.sourceforge.net"
license=('BSD-3-Clause')
makedepends=('cmake>=2.4.2')
_pkgsrc="${pkgname}-code-${_revision}"
source=("${_pkgsrc}.zip::https://sourceforge.net/code-snapshots/svn/${pkgname::1}/${pkgname::2}/${pkgname}/code/${pkgname}-code-${_revision}.zip")
sha256sums=('6068387fb2ac4b7208664dc68079fbba3eb4c4e781c359c566f265c77955c48d')

pkgver() {
  cd "${srcdir}/${_pkgsrc}/work"
  sed -n 's/SET( CROSS_TYPES_VERSION_\(MAJOR\|MINOR\|PATCH\) \([0-9]\+\) )/\2/p' CMakeLists.txt | paste -sd'.'
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  cmake \
    -G 'Unix Makefiles' \
    -B "work/build" \
    -S "work" \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -Wno-dev
  cmake --build "work/build"
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  ctest --test-dir "work/build" --output-on-failure --stop-on-failure
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="${pkgdir}" cmake --install "work/build"

  cd "work"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "AUTHORS" "${pkgdir}/usr/share/licenses/${pkgname}/AUTHORS"
}
