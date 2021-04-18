#!/hint/bash
# Maintainer: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>

_name=cutter
pkgname=rz-${_name}-git
pkgver=2.0.1.r1.g1f129618
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
source+=("https://github.com/rizinorg/cutter/pull/2664.patch")
sha512sums=('SKIP'
            'SKIP'
            '56126c8b942a0d9574f068b0c7de4c66044a90ff060b67a2aecc2b9b0d839a865923a5bfc9d505f7262fdf7eff16130fdf02c6555f5968432cae5c82841b2368')
b2sums=('SKIP'
        'SKIP'
        '33108b7d50dfc8adef55c8e42d0cb2bfb9d045067c4fcb3f91a347676e451f7d2403b3fac3cf22b5d0677dc89adde7e4e58afa041b08f654167fb0cd6df499db')

pkgver() {
  # Remove 'v' prefix on tags; prefix revision with 'r'; replace all '-' with '.'
  git -C ${_name} describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare() {
  git -C ${_name} config 'submodule.src/translations.url' "${srcdir}/${_name}-translations"
  git -C ${_name} submodule update --init src/translations
  git -C ${_name} apply -v "${srcdir}"/2664.patch
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
