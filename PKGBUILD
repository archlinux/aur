# Maintainer: taotieren <admin@taotieren.com>

pkgname=kicad-hq
_name=${pkgname%-hq}
# pkgver=8.0.6
# _pkgver=${pkgver}-hq
# _tagname='8.0.6-hq'
pkgver=8.0.7
pkgrel=1
pkgdesc="Electronic schematic and printed circuit board (PCB) design tools"
arch=($CARCH)
url="https://gitlab.com/kicad-hq/kicad"
license=('GPL-3.0-or-later')
depends=(
  'curl'
  'freetype2'
  'fontconfig'
  'gcc-libs'
  'glib2'
  'glibc'
  'glu'
  'gtk3'
  'libglvnd'
  'harfbuzz'
  'hicolor-icon-theme'
  'opencascade'
  'python'
  'python-wxpython'
  'wayland'
  'wxwidgets-gtk3'
  'wxwidgets-common'
  'unixodbc'
  'libgit2'
  'zlib'
  #   'nng'
)
makedepends=(
  'boost-libs'
  'cmake'
  'glew'
  'glm'
  'mesa'
  'boost'
  'swig'
  'ngspice'
  'ninja'
  'protobuf'
)
optdepends=('kicad-library: KiCad symbol, footprint and template libraries'
  'kicad-library: KiCad 3D model libraries')
conflicts=(${pkgname} 'kicad' 'kicad-bzr')
provides=(${pkgname} 'kicad' 'kicad-bzr')
source=("${_name}-${pkgver}.tar.gz::https://gitlab.com/kicad-hq/kicad/-/archive/${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=('a306703b7c5deb23341b71f72a34102175b3f741fe472e152d8fdd9f4c778ef7')

build() {
  cd "${srcdir}/${_name}-${pkgver}"

  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKICAD_USE_OCC=ON \
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
  DESTDIR="$pkgdir" ninja -C ${srcdir}/${_name}-${pkgver}/build install
}
