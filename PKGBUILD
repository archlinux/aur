# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="matlab-dipimage"
pkgver=3.6.0
pkgrel=1
pkgdesc="Quantitative Image Analysis in C++, MATLAB, and Python (MATLAB bindings)"
arch=(
  'x86_64'
)
url="https://diplib.org/DIPimage.html"
_url="https://github.com/DIPlib/diplib"
license=(
  'Apache-2.0'
)
depends=(
  "diplib>=${pkgver}"
  'glibc'
  'libgcc'
  'libstdc++'
  'matlab'
)
makedepends=(
  'cmake>=3.12'
)
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "${_url}/archive/refs/tags/${pkgver}/${_pkgsrc}.tar.gz"
)
sha256sums=('c9c5ef0c1590dbc428d7f198fecc008b1b3ea54853663a2c33d97e04022af456')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  rm -vf "tools/FindMatlab.cmake"
}

build() {
  local cmake_options=(
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -G 'Unix Makefiles'
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D OpenGL_GL_PREFERENCE=GLVND
    -D DIP_BUILD_JAVAIO:BOOL=OFF
    -D DIP_BUILD_DIPVIEWER:BOOL=OFF
    -D DIP_BUILD_PYDIP:BOOL=OFF
  )
  
  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${cmake_options[1]}"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build/dipimage"

  install -vd "${pkgdir}/usr/share/licenses"
  ln -vsf "diplib" "${pkgdir}/usr/share/licenses/${pkgname}"
}
