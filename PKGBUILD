# Maintainer: dreieck
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=twaindsm
pkgver=2.5.0
pkgrel=2
pkgdesc="TWAIN Data Source Manager"
arch=(
  'i686'
  'x86_64'
)
# url='http://twain.org/'
url='https://github.com/twain/twain-dsm/'
license=('LGPL2.1')
depends=('gcc-libs')
makedepends=('cmake')
source=(
  "twaindsm-${pkgver}.tar.gz::https://github.com/twain/twain-dsm/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
  '89b226f1197c34fc6dff213c5bf656964460045517f886976a45417932de2f10'  # twaindsm-${pkgver}.tar.gz
)
options+=('emptydirs')

prepare() {
  cd "${srcdir}/twain-dsm-${pkgver}/TWAIN_DSM/src"

  # Someone thought it was a good idea to distribute CMake build artifacts
  rm -rf CMakeCache.txt CMakeFiles
}

build() {
  cd "${srcdir}/twain-dsm-${pkgver}/TWAIN_DSM/src"

  test -d build && rm -rf build
  mkdir build
  cd build

  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..

  make
}

package() {
  cd "${srcdir}/twain-dsm-${pkgver}/TWAIN_DSM/src/build"

  make install DESTDIR="${pkgdir}"

  # For some reason the people who made the TWAIN specification thought it was
  # a good idea to put everything in /usr/local on Linux. So in order to comply
  # with the spec while still having everything in Arch's usual filesystem
  # hierarchy, we are going to create a few symlinks.
  install -d -m755 -v "${pkgdir}/usr/lib/twain"
  install -d -m755 -v "${pkgdir}/usr/local/lib"
  for i in "${pkgdir}/usr/lib/libtwaindsm.so"*; do
    ln -s "/usr/lib/$(basename "${i}")" "${pkgdir}/usr/local/lib/$(basename "${i}")"
  done
  ln -s "/usr/lib/twain" "${pkgdir}/usr/local/lib/twain"


  cd "${srcdir}/twain-dsm-${pkgver}/TWAIN_DSM"

  install -D -m644 -v license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license_LGPL2.1.txt"

  for _docfile in ChangeLog.txt README.txt TODO.txt twaindsm.spec; do
    install -D -m644 -v "${_docfile}" "${pkgdir}/usr/share/doc/${pkgname}/${_docfile}"
  done
  install -D -m644 -v "${srcdir}/twain-dsm-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/TWAIN-DSM_REPO-INFO.md"
  install -D -m644 -v "${srcdir}/twain-dsm-${pkgver}/TWAIN DSM Linux Build Procedure.rtf" "${pkgdir}/usr/share/doc/${pkgname}/TWAIN_DSM_Linux_Build_Procedure.rtf"
}
