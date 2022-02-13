# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=kicad-rc
_pkgver="6.0.2"
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
kicad-library
)
makedepends=(
cmake
git
zlib
mesa
boost
swig
ninja  
)
optdepends=(
  kicad-library-3d
)
conflicts=('kicad' 'kicad-git' 'kicad-scripting-git' 'kicad-bzr')
provides=('kicad')
source=("${pkgname}:${pkgver}.tar.gz::https://gitlab.com/kicad/code/kicad/-/archive/${_pkgver}/kicad-${_pkgver}.tar.gz")
sha256sums=('65870877d27379bee6362d0b0a1dd635cd989687e0b473a0cc3421a4fae612c3')

prepare() {
  cd kicad-${_pkgver}
}

build() {
  cd kicad-${_pkgver}
  cmake -W no-dev \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D KICAD_USE_OCC=ON \
    -D KICAD_USE_EGL=OFF \
    -D KICAD_DRC_PROTO=OFF \
    -D KICAD_BUILD_PNS_DEBUG_TOOL=OFF \
    -D KICAD_STEP_EXPORT_LIB=OFF \
    -D KICAD_VERSION_EXTRA="AUR-kicad-rc" \
    -D wxWidgets_CONFIG_EXECUTABLE="$(which wx-config-gtk3)" \
    -D USE_WX_GRAPHICS_CONTEXT=ON \
    -G Ninja \
    -B build_dir \
    -S .

  cmake --build build_dir
}

package() {
  cd kicad-${_pkgver}
  DESTDIR="${pkgdir}" cmake --build build_dir -- install 
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE.*
}
