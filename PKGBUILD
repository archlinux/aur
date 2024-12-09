# Maintainer: taotieren <admin@taotieren.com>

pkgname=kicad-hq
_name=${pkgname%-hq}
# pkgver=8.0.6
# _pkgver=${pkgver}-hq
_tagname='8.0.6-hq'
pkgver=20241208
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
source=("${_name}-${_tagname}.tar.gz::https://gitlab.com/kicad-hq/kicad/-/archive/${_tagname}/${_name}-${_tagname}.tar.gz")
sha256sums=('60dda38272ef78c6d996c0d91ad95b1ae0693ad90d17e4864f5aa1c6f8a13cf6')

build() {
  cd "${srcdir}/${_name}-${_tagname}"

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
  DESTDIR="$pkgdir" ninja -C ${srcdir}/${_name}-${_tagname}/build install
}
