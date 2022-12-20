# Maintainer: Vladislav Nepogodin <nepogodin.vlad@gmail.com>

pkgname=contour-git
pkgver=0.3.9.r3331.376b3438
pkgrel=1
pkgdesc="Modern C++ Terminal Emulator"
arch=(x86_64 aarch64)
url="https://github.com/contour-terminal/contour"
license=('Apache-2.0')
depends=('harfbuzz' 'fontconfig' 'yaml-cpp' 'qt5-base' 'qt5-multimedia' 'qt5-x11extras')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'ninja' 'libxml2'
             'python' 'catch2' 'range-v3' 'fmt' 'microsoft-gsl')
source=("${pkgname}::git+https://github.com/contour-terminal/contour.git")
sha512sums=('SKIP')
provides=('contour')
conflicts=('contour')
options=(!strip)

pkgver() {
  cd "${srcdir}/${pkgname}"
  _pkgver="$(xmllint --xpath 'string(/component/releases/release[1]/@version)' metainfo.xml)"

  printf "${_pkgver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  _cpuCount=$(grep -c -w ^processor /proc/cpuinfo)

  CFLAGS=${CFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS}
  CXXFLAGS=${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS}

  PREPARE_ONLY_EMBEDS=ON OS_OVERRIDE=arch ${pkgname}/scripts/install-deps.sh

  cmake -S"${pkgname}" -Bbuild \
        -GNinja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build --parallel $_cpuCount
}

check() {
  cd "${pkgname}"
  ../build/src/contour/contour version
  ../build/src/crispy/crispy_test
  ../build/src/vtbackend/terminal_test
}

package() {
  cd "${srcdir}/build"
  DESTDIR="${pkgdir}" cmake --build . --target install

  cd "${srcdir}/${pkgname}"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=2 et:
