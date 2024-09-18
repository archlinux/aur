# Maintainer: Peter Jung  <ptr1337@cachyos.org>
# Maintainer: Vladislav Nepogodin <nepogodin.vlad@gmail.com>

pkgname=contour
pkgver=0.5.0.7168
pkgrel=1
pkgdesc="Modern C++ Terminal Emulator"
arch=(x86_64 aarch64)
url="https://github.com/contour-terminal/contour"
license=('Apache-2.0')
depends=(
  fontconfig
  harfbuzz
  libunicode
  libutempter
  qt6-5compat
  qt6-base
  qt6-declarative
  qt6-multimedia
  qt6-shadertools
  qt6-wayland
  yaml-cpp
)
makedepends=(
  boxed-cpp
  catch2
  cmake
  extra-cmake-modules
  fmt
  git
  libxml2
  microsoft-gsl
  ninja
  python
  range-v3
)
optdepends=('ncurses: for contour terminfo database')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('6b2ce583b6a10e0dd475a0675147305980323c65099097dfcfc5d1b865583c19785c2d149bdb02e1eb963750b9964ec6e61e0ccfea9f625a196ef23b88cad8a2')

build() {

  cmake -S"${pkgname}-${pkgver}" -Bbuild \
        -GNinja \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCONTOUR_QT_VERSION=6 \
        -DCONTOUR_TESTING=ON
  cmake --build build
}

check() {
  # for running tests, it is (currently) expected to be executed
  # from within the source code's project root directory, in order to
  # access some test files.
  cd "${srcdir}/${pkgname}-${pkgver}"

  "${srcdir}"/build/src/contour/contour version
  "${srcdir}"/build/src/crispy/crispy_test
  "${srcdir}"/build/src/vtparser/vtparser_test
  "${srcdir}"/build/src/vtbackend/vtbackend_test
}

package() {
  cd "${srcdir}/build"
  DESTDIR="${pkgdir}" cmake --build . --target install

  # provided by ncurses now
  rm -rf "${pkgdir}/usr/share/terminfo"

  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=2 et:
