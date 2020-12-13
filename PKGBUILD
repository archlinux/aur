#!/hint/bash
# Maintainer: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>

_name=cutter
pkgname=${_name}-git
pkgver=1.10.3.pre.r188.geefaabd3
pkgrel=1
pkgdesc="A Qt and C++ GUI for radare2 reverse engineering framework (originally named Iaito)"
url="https://github.com/radareorg/cutter"
arch=('i686' 'x86_64')
license=('GPL')
depends=('python' 'qt5-base' 'qt5-svg' 'qt5-webengine' 'icu' 'pyside2' 'graphviz' 'syntax-highlighting' 'qt5-tools')
makedepends=('git' 'cmake' 'shiboken2' 'meson' 'ninja')
depends+=('rizin')
optdepends=()
provides=('cutter')
backup=()
source=("${_name}::git://github.com/radareorg/cutter.git"
        "git://github.com/rizinorg/cutter-translations.git")
sha256sums=('SKIP'
            'SKIP')
b2sums=('SKIP'
        'SKIP')

prepare() {
  git -C ${_name} config 'submodule.src/translations.url' "${srcdir}/${_name}-translations"
  git -C ${_name} submodule update --init src/translations
}

pkgver() {
  # Remove 'v' prefix on tags; prefix revision with 'r'; replace all '-' with '.'
  git -C ${_name} describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  _CMAKE_FLAGS=(
    -DCMAKE_BUILD_TYPE=Release \
    -DCUTTER_ENABLE_PYTHON:BOOL=ON \
    -DCUTTER_ENABLE_PYTHON_BINDINGS:BOOL=ON \
    -DCUTTER_USE_BUNDLED_RIZIN:BOOL=OFF \
    -DCUTTER_ENABLE_CRASH_REPORTS:BOOL=OFF \
    -DCUTTER_ENABLE_GRAPHVIZ:BOOL=ON
  )
  cmake -S ${_name} -B build -G Ninja "${_CMAKE_FLAGS[@]}" # --debug-find
# shellcheck disable=SC2086 # allow MAKEFLAGS to carry multiple flags
  ninja -C build ${MAKEFLAGS:--j1}
}

package() {
  install -DTm755 build/Cutter "${pkgdir}/usr/bin/Cutter"
  install -DTm644 ${_name}/src/org.radare.Cutter.desktop "${pkgdir}/usr/share/applications/cutter.desktop"
  install -DTm644 ${_name}/src/img/cutter.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/cutter.svg"
  install -DTm644 ${_name}/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -dm755 ${_name}/docs/ "${pkgdir}/usr/share/doc/${pkgname}/"
  cp -a ${_name}/docs/* "${pkgdir}/usr/share/doc/${pkgname}/"
}
