# Maintainer: taotieren <admin@taotieren.com>

pkgname=kicad-hq
_name=${pkgname%-hq}
pkgver=9.0.7
pkgrel=1
pkgdesc="Electronic schematic and printed circuit board (PCB) design tools"
arch=($CARCH)
url="https://gitlab.com/kicad-hq/kicad"
license=('GPL-3.0-or-later')
depends=(
  abseil-cpp
  cairo
  curl
  freetype2
  fontconfig
  gcc-libs
  glib2
  glibc
  glu
  gtk3
  libglvnd
  libgit2
  libsecret
  harfbuzz
  hicolor-icon-theme
  nng
  opencascade
  openssl
  protobuf
  python
  python-wxpython
  wayland
  webkit2gtk-4.1
  wxwidgets-gtk3
  wxwidgets-common
  unixodbc
  zlib
  zstd
)
makedepends=(
  boost-libs
  cmake
  doxygen
  glew
  glm
  git
  ngspice
  mesa
  boost
  swig
  ngspice
  ninja
  pkgconf
)
optdepends=('kicad-library: KiCad symbol, footprint and template libraries'
  'kicad-library: KiCad 3D model libraries')
conflicts=(${pkgname} 'kicad' 'kicad-bzr')
provides=(${pkgname} 'kicad' 'kicad-bzr')
source=("${pkgname}::git+https://gitlab.com/kicad-hq/kicad.git#tag=${pkgver}")
sha256sums=('e0c3512e0c4358f428e8037ed213cc2bdd0ef03b96348885a0bd6b33b1c95a8a')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
  cd "${srcdir}/${pkgname}"

  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKICAD_USE_EGL=ON \
    -DKICAD_SCRIPTING_WXPYTHON=ON \
    -DKICAD_BUILD_I18N=ON \
    -DKICAD_I18N_UNIX_STRICT_PATH=ON \
    -DKICAD_BUILD_QA_TESTS=OFF \
    -DFMT_INSTALL=OFF \
    -Bbuild \
    -GNinja \
    -Wno-dev

  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C ${srcdir}/${pkgname}/build install
}
