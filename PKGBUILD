# Maintainer: taotieren <admin@taotieren.com>

pkgname=kicad-hq
_name=${pkgname%-hq}
pkgver=10.0.6
pkgrel=1
pkgdesc="Electronic schematic and printed circuit board (PCB) design tools"
arch=($CARCH)
url="https://gitlab.com/kicad-hq/kicad"
license=('GPL-3.0-or-later')
depends=(
  abseil-cpp
  boost-libs
  glib2
  glm
  glu
  libcairo.so
  libcurl.so
  libgcc_s.so
  libgtk-3.so
  libstdc++.so
  libfreetype.so
  libfontconfig.so
  libglvnd
  libgit2
  libharfbuzz.so
  libcrypto.so
  libssl.so
  libspnav
  libsecret
  libodbc.so
  libprotobuf.so
  libpoppler-glib.so
  libwebkit2gtk-4.1.so
  libz.so
  libzstd.so
  hicolor-icon-theme
  ngspice
  nng
  opencascade
  python
  python-wxpython
  wayland
  wxwidgets-gtk3
  wxwidgets-common
)
makedepends=(
  boost
  cmake
  doxygen
  glew
  git
  mesa
  swig
  ninja
  pkgconf
)
optdepends=(
  'kicad-demos: Demo projects for KiCad'
  'kicad-library: KiCad symbol, footprint and template libraries'
  'kicad-library-3d: KiCad 3D model libraries'
)
conflicts=(${pkgname} 'kicad' 'kicad-bzr')
provides=(${pkgname} 'kicad' 'kicad-bzr')
source=("${pkgname}::git+https://gitlab.com/kicad-hq/kicad.git#tag=${pkgver}")
sha256sums=('e3ac77feb5ff9f99e4784804ce21f206316c9acb17274bb4f899f516ba7d4fc1')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
  cd "${srcdir}/${pkgname}"

  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKICAD_BUILD_I18N=ON \
    -DKICAD_I18N_UNIX_STRICT_PATH=ON \
    -DKICAD_BUILD_QA_TESTS=OFF \
    -DKICAD_USE_CMAKE_FINDPROTOBUF=OFF \
    -DKICAD_UPDATE_CHECK=OFF \
    -Wno-author \
    -Bbuild \
    -GNinja

  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C ${srcdir}/${pkgname}/build install
}
