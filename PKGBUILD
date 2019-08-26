_gittag=v2.80
# _gitcommit=054dbb833e15275e0e991e2c15e754a3e7583716

pkgname=blender-as-py-module
pkgver=2.80
[[ -n $_gitcommit ]] && pkgver=${pkgver}.git1.${_gitcommit:0:8}
pkgrel=1
pkgdesc="A fully integrated 3D graphics creation suite, to be used as Python module. Useful for programmatic/batch rendering."
arch=('x86_64')
license=('GPL')
url="http://www.blender.org"
depends=('libpng' 'libtiff' 'openexr' 'python' 'desktop-file-utils'
         'python-requests' 'shared-mime-info' 'hicolor-icon-theme'
         'xdg-utils' 'glew' 'openjpeg' 'python-numpy' 'freetype2'
         'boost-libs' 'openimageio' 'opencolorio'
         'openshadinglanguage' 'libspnav' 'ptex' 'opensubdiv'
         'log4cplus')
makedepends=('cmake' 'boost' 'mesa' 'git' 'llvm' 'cuda' 'ninja')
optdepends=('cuda: cycles renderer cuda support')
options=(!strip)
source=("git://git.blender.org/blender-addons.git"
        "git://git.blender.org/blender-addons-contrib.git"
        "git://git.blender.org/blender-translations.git"
        "git://git.blender.org/blender-dev-tools.git")
if [[ -n $_gittag ]]; then
    source+=("${pkgname}-${pkgver}::git://git.blender.org/blender.git#tag=${_gittag}")
elif [[ -n $_gitcommit ]]; then
    source+=("${pkgname}-${pkgver}::git://git.blender.org/blender.git#commit=${_gitcommit}")
fi
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  git submodule init
  git config submodule."release/scripts/addons".url ${srcdir}/blender-addons
  git config submodule."release/scripts/addons_contrib".url ${srcdir}/blender-addons-contrib
  git config submodule."release/datafiles/locale".url ${srcdir}/blender-translations
  git config submodule."source/tools".url ${srcdir}/blender-dev-tools
  git submodule update

  mkdir -p build
}

build() {
  cd "$srcdir/$pkgname-$pkgver"/build

  cmake -GNinja -C../build_files/cmake/config/bpy_module.cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DPYTHON_VERSION=3.7 \
    -DWITH_MEM_JEMALLOC=OFF \
    -DPYTHON_LIBPATH=/usr/lib \
    -DPYTHON_LIBRARY=python3.7m \
    -DPYTHON_INCLUDE_DIRS=/usr/include/python3.7m
  ninja -j2
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"

  DESTDIR="${pkgdir}" ninja install
  python -m compileall "${pkgdir}/usr/share/blender"
  python -O -m compileall "${pkgdir}/usr/share/blender"
}
