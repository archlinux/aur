# Maintainer: Vladislav Nepogodin <nepogodin.vlad@gmail.com>

pkgname=contour-git
pkgver=0.5.2.r4735.632de57f
pkgrel=1
pkgdesc="Modern C++ Terminal Emulator"
arch=(x86_64 aarch64)
url="https://github.com/contour-terminal/contour"
license=('Apache-2.0')
depends=(
  fontconfig
  harfbuzz
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
source=("${pkgname}::git+https://github.com/contour-terminal/contour.git")
sha512sums=('SKIP')
provides=('contour')
conflicts=('contour')

pkgver() {
  cd "${srcdir}/${pkgname}"
  _pkgver="$(xmllint --xpath 'string(/component/releases/release[1]/@version)' metainfo.xml)"

  printf "${_pkgver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # fixes issue where it cannot create directories for crashreporting
  export XDG_STATE_HOME="$PWD"

  PREPARE_ONLY_EMBEDS=ON OS_OVERRIDE=arch ${pkgname}/scripts/install-deps.sh

  cmake -S"${pkgname}" -Bbuild \
        -GNinja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCONTOUR_QT_VERSION=6 \
        -DCONTOUR_TESTING=ON
  cmake --build build
}

check() {
  # for running tests, it is (currently) expected to be executed
  # from within the source code's project root directory, in order to
  # access some test files.
  cd "${srcdir}/${pkgname}"

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

  cd "${srcdir}/${pkgname}"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=2 et:
