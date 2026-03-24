# Maintainer: taotieren <admin@taotieren.com>

pkgname=kicad-hq
_name=${pkgname%-hq}
pkgver=10.0.0
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
  glib2
  glibc
  glm
  glu
  gtk3
  libgcc
  libglvnd
  libgit2
  libspnav
  libsecret
  libstdc++
  harfbuzz
  hicolor-icon-theme
  ngspice
  nng
  opencascade
  openssl
  protobuf
  poppler-glib
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
  git
  mesa
  boost
  swig
  ninja
  pkgconf
)
optdepends=('kicad-library: KiCad symbol, footprint and template libraries'
  'kicad-library: KiCad 3D model libraries')
conflicts=(${pkgname} 'kicad' 'kicad-bzr')
provides=(${pkgname} 'kicad' 'kicad-bzr')
source=("${pkgname}::git+https://gitlab.com/kicad-hq/kicad.git#tag=${pkgver}")
sha256sums=('da5d31702acdbdb4f65d64c730d6cc596f99d35ef34f00f4649e1b35ca2ee0ab')

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
