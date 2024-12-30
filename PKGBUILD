# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="crosstypes"
_revision="r10" # 0.1.0
pkgver=0.1.0
pkgrel=2
pkgdesc="Cross-platform library of PODT (plain old data types) in C/C++"
arch=('any')
url="https://${pkgname}.sourceforge.net"
license=('BSD-3-Clause')
makedepends=('cmake>=2.4.2' 'svn')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}::svn+https://svn.code.sf.net/p/${pkgname}/code#revision=${_revision}")
sha256sums=('SKIP')

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
  install -vDm644 "AUTHORS" "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
