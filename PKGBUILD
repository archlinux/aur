# Maintainer: Vladislav Nepogodin <nepogodin.vlad@gmail.com>

pkgname=contour-git
pkgver=0.4.0.r4186.6df0a2f9
pkgrel=1
pkgdesc="Modern C++ Terminal Emulator"
arch=(x86_64 aarch64)
url="https://github.com/contour-terminal/contour"
license=('Apache-2.0')
depends=('harfbuzz' 'fontconfig' 'yaml-cpp' 'qt6-base' 'qt6-declarative' 'qt6-multimedia'
         'qt6-shadertools' 'qt6-wayland' 'qt6-5compat' 'libutempter')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'ninja' 'libxml2'
             'python' 'range-v3' 'fmt' 'microsoft-gsl')
source=("${pkgname}::git+https://github.com/contour-terminal/contour.git"
        embed-catch2.patch)
sha512sums=('SKIP'
            '653e6381240f4682157e9ddcd64f0577e31ab6d14e41368b74b4eb7caac1769040247b549f2b2d2d5e0c3b3f3badc99f6228d1f53b8d549cb2fb35c23a1c51e9')
provides=('contour')
conflicts=('contour')
options=(!strip)

pkgver() {
  cd "${srcdir}/${pkgname}"
  _pkgver="$(xmllint --xpath 'string(/component/releases/release[1]/@version)' metainfo.xml)"

  printf "${_pkgver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"

  # embed catch2, due to outdated version in arch repos.
  patch -Np1 -i ../embed-catch2.patch
}

build() {
  _cpuCount=$(grep -c -w ^processor /proc/cpuinfo)

  CFLAGS=${CFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS}
  CXXFLAGS=${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS}

  PREPARE_ONLY_EMBEDS=ON OS_OVERRIDE=arch ${pkgname}/scripts/install-deps.sh

  cmake -S"${pkgname}" -Bbuild \
        -GNinja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCONTOUR_QT_VERSION=6 \
        -DCONTOUR_TESTING=ON
  cmake --build build --parallel $_cpuCount
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

  cd "${srcdir}/${pkgname}"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=2 et:
