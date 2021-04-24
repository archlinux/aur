#!/hint/bash
# Maintainer: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>

_name=cutter
pkgname=rz-${_name}-git
pkgver=2.0.2.rc1.r0.g8d4c8606
pkgrel=1
pkgdesc="A Qt and C++ GUI for rizin reverse engineering framework (originally named Iaito)"
url="https://cutter.re/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('rizin' 'capstone' 'qt5-base' 'qt5-svg' 'qt5-webengine' 'icu' 'python' 'jupyter'
         'pyside2' 'python-shiboken2' 'graphviz' 'gcc-libs' 'syntax-highlighting')
makedepends=('git' 'cmake' 'ninja' 'shiboken2' 'qt5-tools' 'meson')
provides=('rz-cutter')
conflicts=('rz-cutter')
optdepends=('rz-ghidra: ghidra decompiler plugin')
source=("${_name}::git://github.com/rizinorg/cutter.git"
        "git://github.com/rizinorg/cutter-translations.git")
sha512sums=('SKIP'
            'SKIP')
b2sums=('SKIP'
        'SKIP')

pkgver() {
  # Remove 'v' prefix on tags; prefix revision with 'r'; replace all '-' with '.'
  git -C ${_name} describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare() {
  git -C ${_name} config 'submodule.src/translations.url' "${srcdir}/${_name}-translations"
  git -C ${_name} submodule update --init src/translations
}


build() {
  _CMAKE_FLAGS=(
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCUTTER_ENABLE_PYTHON:BOOL=ON \
    -DCUTTER_ENABLE_PYTHON_BINDINGS:BOOL=ON \
    -DCUTTER_USE_BUNDLED_RIZIN:BOOL=OFF \
    -DCUTTER_USE_ADDITIONAL_RIZIN_PATHS:BOOL=OFF \
    -DCUTTER_ENABLE_CRASH_REPORTS:BOOL=OFF \
    -DCUTTER_ENABLE_GRAPHVIZ:BOOL=ON
  )
  cmake -S ${_name} -B build -G Ninja "${_CMAKE_FLAGS[@]}" # --debug-find
# shellcheck disable=SC2086 # allow MAKEFLAGS to carry multiple flags
  ninja -C build ${MAKEFLAGS:--j1}
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -a "${srcdir}"/${_name}/docs/* "${pkgdir}/usr/share/doc/${pkgname}"
}
