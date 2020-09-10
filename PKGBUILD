# Maintainer: Stefanos Carlström <stefanos.carlstrom@gmail.com>

# This PKGBUILD is based on that for the full application found in the
# main package repo, but customized to compile a standalone Python
# module.

_gittag=v2.90.0
# _gitcommit=rB5b416ffb848e66238d9646a239840499f98121a9

pkgname=blender-as-py-module
pkgver=2.90.0
[[ -n $_gitcommit ]] && pkgver=${pkgver}.git1.${_gitcommit:0:8}
pkgrel=1
pkgdesc="A fully integrated 3D graphics creation suite, to be used as Python module. Useful for programmatic/batch rendering."
arch=('x86_64')
license=('GPL')
url="http://www.blender.org"
depends=('libpng' 'libtiff' 'openexr' 'python' 'desktop-file-utils'
         'python-requests' 'shared-mime-info' 'hicolor-icon-theme'
         'xdg-utils' 'glew' 'openjpeg2' 'python-numpy' 'freetype2'
         'boost-libs' 'openimageio' 'opencolorio'
         'openshadinglanguage' 'libspnav' 'ptex' 'opensubdiv'
         'log4cplus' 'embree')
makedepends=('cmake' 'boost' 'mesa' 'git' 'llvm' 'cuda' 'ninja')
optdepends=('cuda: cycles renderer cuda support')
options=(!strip)
source=("git://git.blender.org/blender-addons.git"
        "git://git.blender.org/blender-addons-contrib.git"
        "git://git.blender.org/blender-translations.git"
        "git://git.blender.org/blender-dev-tools.git"
        https://git.blender.org/gitweb/gitweb.cgi/blender.git/patch/91aeb452ab251b307311fe869e8e14df945ec6bc
        cuda11.patch
        https://developer.download.nvidia.com/redist/optix/v7.0/OptiX-7.0.0-include.zip)
if [[ -n $_gittag ]]; then
    source+=("${pkgname}-${pkgver}::git://git.blender.org/blender.git#tag=${_gittag}")
elif [[ -n $_gitcommit ]]; then
    source+=("${pkgname}-${pkgver}::git://git.blender.org/blender.git#commit=${_gitcommit}")
fi
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '46358fe7dab620eb9a7414baa851e7d28818b7c2845f723f7dd0f4b0f721902583a6b57c9c2d5e153c5057cc958727489d301c5195dfd3befee96cde539d813a'
            '76d55f49cf0475d3050a3ff534da47345aae862fd5ee0e336143c041ef58c5d4ebd6e922eb8a23c01cc35d19537c46698910b0b52a090cdcea4e5f67e4fb5650'
            'b2cff73def3757d4259f4b4d318a8ccfe166bf7c215cbb2124f1c81bd6e742f96207285b24eb4d99b527b7b97dc6d5e8fdf2f16d78d5d1e2684c26d681328491'
            'SKIP')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  git submodule init
  git config submodule."release/scripts/addons".url ${srcdir}/blender-addons
  git config submodule."release/scripts/addons_contrib".url ${srcdir}/blender-addons-contrib
  git config submodule."release/datafiles/locale".url ${srcdir}/blender-translations
  git config submodule."source/tools".url ${srcdir}/blender-dev-tools
  git submodule update

  if [[ -n $_gittag ]]; then
    git submodule foreach git checkout v${pkgver}
  fi
  
  patch -Np1 -i "$srcdir"/91aeb452ab251b307311fe869e8e14df945ec6bc
  patch -Np1 -i "$srcdir"/cuda11.patch

  mkdir -p build
}

build() {
  cd "$srcdir/$pkgname-$pkgver"/build

  cmake -GNinja -C../build_files/cmake/config/bpy_module.cmake .. \
    -DOPTIX_ROOT_DIR="$srcdir"/include \
    -DWITH_CYCLES_EMBREE=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DPYTHON_VERSION=3.8 \
    -DWITH_MEM_JEMALLOC=OFF \
    -DPYTHON_LIBPATH=/usr/lib \
    -DPYTHON_LIBRARY=python3.8 \
    -DPYTHON_INCLUDE_DIRS=/usr/include/python3.8
  ninja -j2
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"

  DESTDIR="${pkgdir}" ninja install
  python -m compileall "${pkgdir}/usr/share/blender"
  python -O -m compileall "${pkgdir}/usr/share/blender"
}
