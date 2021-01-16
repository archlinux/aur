# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=kicad-rc
_pkgver="5.1.9"
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Official KiCad release candidates and dev snapshots"
arch=(x86_64)
url="http://kicad.org/"
license=(GPL3 AGPL3 BOOST ISC MIT CC-BY-SA)
depends=(
  glew
  wxgtk3
  desktop-file-utils
  boost-libs
  python
  glm
  curl
  swig
  python-wxpython
  opencascade
  ngspice
  libcloudproviders
)
makedepends=(
  cmake
  git
  zlib
  mesa
  boost
  swig
)
optdepends=(
  kicad-symbols
  kicad-packages3d
  kicad-footprints
  kicad-templates
)
conflicts=('kicad' 'kicad-git' 'kicad-scripting-git' 'kicad-bzr')
provides=('kicad')
source=("${pkgname}:${pkgver}.tar.gz::https://gitlab.com/kicad/code/kicad/-/archive/${_pkgver}/kicad-${_pkgver}.tar.gz")
sha256sums=('841be864b9dc5c761193c3ee9cbdbed6729952d7b38451aa8e1977bdfdb6081b')

prepare() {
  cd kicad-${_pkgver}
}

build() {
  cd kicad-${_pkgver}
  cmake \
    -W no-dev \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D KICAD_USE_OCC=ON \
    -D KICAD_USE_OCE=OFF \
    -D KICAD_SCRIPTING_WXPYTHON_PHOENIX=ON \
    -D KICAD_SCRIPTING_PYTHON3=ON \
    -D wxWidgets_CONFIG_EXECUTABLE="$(which wx-config-gtk3)" \
    -D USE_WX_GRAPHICS_CONTEXT=ON \
    -D USE_WX_OVERLAY=ON \
    -G Ninja \
    -B build_dir \
    -S .

  cmake --build build_dir
}

package() {
  cd kicad-${_pkgver}
  DESTDIR="${pkgdir}" cmake --build build_dir -- install 
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE.{AGPLv3,GPLv3,README,BOOSTv1_0,ISC,CC-BY-SA-4.0,MIT}
}
