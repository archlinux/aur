# Maintainer: Stefanos Carlström <stefanos.carlstrom@gmail.com>

# This PKGBUILD is based on that for the full application found in the
# main package repo, but customized to compile a standalone Python
# module.

pkgname=blender-as-py-module
pkgver=2.93.1
pkgrel=1
pkgdesc="A fully integrated 3D graphics creation suite, to be used as Python module. Useful for programmatic/batch rendering."
arch=('x86_64')
license=('GPL')
url="https://www.blender.org"
depends=('libpng' 'libtiff' 'openexr' 'python' 'desktop-file-utils' 'python-requests' 'potrace'
         'shared-mime-info' 'hicolor-icon-theme' 'xdg-utils' 'glew' 'openjpeg2' 'python-numpy'
         'freetype2' 'openal' 'ffmpeg' 'fftw' 'boost-libs' 'opencollada' 'alembic' 'openxr'
         'openimageio' 'libsndfile' 'jack' 'opencolorio' 'openshadinglanguage' 'openimagedenoise'
         'jemalloc' 'libspnav' 'ptex' 'opensubdiv' 'openvdb' 'log4cplus' 'sdl2' 'embree')
makedepends=('cmake' 'boost' 'mesa' 'git' 'llvm' 'cuda' 'ninja')
optdepends=('cuda: cycles renderer cuda support')
options=(!strip)
source=("${pkgname}-${pkgver}::git+https://git.blender.org/blender.git#tag=v$pkgver"
        "git+https://git.blender.org/blender-addons.git"
        "git+https://git.blender.org/blender-addons-contrib.git"
        "git+https://git.blender.org/blender-translations.git"
        "git+https://git.blender.org/blender-dev-tools.git"
        https://developer.download.nvidia.com/redist/optix/v7.0/OptiX-7.0.0-include.zip
        blender-openexr3.patch)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'b2cff73def3757d4259f4b4d318a8ccfe166bf7c215cbb2124f1c81bd6e742f96207285b24eb4d99b527b7b97dc6d5e8fdf2f16d78d5d1e2684c26d681328491'
            'e2dd7210d26b70445e9ae8e33dea35111ad0b0aca9d3b4ded3df560d0fcc8dc044868f729e0f090a04b6f316f083b5505a7056ce088e8702065add87b9b457e5')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  git submodule init
  git config submodule."release/scripts/addons".url "${srcdir}/blender-addons"
  git config submodule."release/scripts/addons_contrib".url "${srcdir}/blender-addons-contrib"
  git config submodule."release/datafiles/locale".url "${srcdir}/blender-translations"
  git config submodule."source/tools".url "${srcdir}/blender-dev-tools"
  git submodule update
  git submodule foreach git checkout v${pkgver}

  patch -p1 < "$srcdir"/blender-openexr3.patch # Fix build with OpenEXR 3
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  local PYTHON_VER=3.9
  export PYTHONHASHSEED=0

  cmake . \
    -Bbuild \
    -GNinja \
    -Cbuild_files/cmake/config/bpy_module.cmake .. \
    -DOPTIX_ROOT_DIR="$srcdir"/include \
    -DWITH_CYCLES_EMBREE=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DWITH_INSTALL_PORTABLE=OFF \
    -DWITH_PYTHON_INSTALL=OFF \
    -DPYTHON_VERSION=$PYTHON_VER \
    -DPYTHON_LIBPATH=/usr/lib \
    -DPYTHON_LIBRARY=python$PYTHON_VER \
    -DPYTHON_INCLUDE_DIRS=/usr/include/python$PYTHON_VER \
    -DCMAKE_CXX_FLAGS="-I /usr/include/python$PYTHON_VER"
  ninja -C build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  DESTDIR="${pkgdir}" ninja -C build install
  python -m compileall "${pkgdir}/usr/share/blender"
  python -O -m compileall "${pkgdir}/usr/share/blender"
}
