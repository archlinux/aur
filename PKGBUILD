# Maintainer: Stefanos Carlström <stefanos.carlstrom@gmail.com>
# Based off of main Blender PKGBUILD by
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: John Sowiak <john@archlinux.org>
# Contributor: tobias <tobias@archlinux.org>

# See
# https://wiki.blender.org/index.php/User%3aIdeasman42/BlenderAsPyModule
# for details.

# Comment from main PKGBUILD:
# Sometimes blender.org takes some time to release patch releases and because Arch users
# are impatient, we sometimes need to build from git directly.
# Update because I get so many queries on this:
# Due to our other rolling deps, it's sometimes not possible to build Blender stable releases.
# More often than not, a new openshadinglanguage breaks it and I could either backport fixes
# or simply roll with a new version. I usually choose the latter when the former seems
# unreasonable.

#_gittag=v2.78
_gitcommit=e8299c81006aba1e4b926c24276ce09d70435371

pkgname=blender-as-py-module
pkgver=2.78.a
#[[ -n $_gitcommit ]] && pkgver=${pkgver}.git1.${_gitcommit}
pkgrel=1
pkgdesc="A fully integrated 3D graphics creation suite, to be used as Python module. Useful for programmatic/batch rendering."
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.blender.org"
depends=('libpng' 'libtiff' 'openexr' 'python' 'desktop-file-utils' 'python-requests'
         'shared-mime-info' 'hicolor-icon-theme' 'xdg-utils' 'glew' 'openjpeg'
         'freetype2' 'fftw' 'boost-libs' 'opencollada'
         'openimageio' 'opencolorio' 'openshadinglanguage'
         'jemalloc' 'libspnav' 'ptex' 'opensubdiv' 'openvdb' 'log4cplus')
makedepends=('cmake' 'boost' 'mesa' 'git' 'llvm35')
makedepends_x86_64=('cuda')
optdepends=('cuda: cycles renderer cuda support')
options=(!strip)
source=("git://git.blender.org/blender-addons.git"
        "git://git.blender.org/blender-addons-contrib.git"
        "git://git.blender.org/blender-translations.git"
        "git://git.blender.org/blender-dev-tools.git"
        "git://git.blender.org/scons.git")
if [[ -n $_gittag ]]; then
    source+=("${pkgname}-${pkgver}::git://git.blender.org/blender.git#tag=${_gittag}")
elif [[ -n $_gitcommit ]]; then
    source+=("${pkgname}-${pkgver}::git://git.blender.org/blender.git#commit=${_gitcommit}")
fi
md5sums=('SKIP'
         'SKIP'
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
  git config submodule."scons".url ${srcdir}/scons
  git submodule update
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir build && cd build

  [[ $CARCH == i686 ]] && BUILDCUDA="OFF" || BUILDCUDA="ON"

  cmake -C../build_files/cmake/config/blender_full.cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DWITH_INSTALL_PORTABLE=OFF \
    -DWITH_PYTHON_INSTALL=OFF \
    -DWITH_PYTHON_MODULE=ON \
    -DWITH_PLAYER=OFF \
    -DWITH_GAMEENGINE=OFF \
    -DWITH_OPENAL=OFF \
    -DWITH_SDL=OFF \
    -DWITH_JACK=OFF \
    -DWITH_CODEC_AVI=OFF \
    -DWITH_CODEC_FFMPEG=OFF \
    -DWITH_CODEC_SNDFILE=OFF \
    -DOPENIMAGEIO_ROOT_DIR=/usr \
    -DWITH_LLVM=ON \
    -DWITH_SYSTEM_OPENJPEG=ON \
    -DWITH_GL_PROFILE_CORE=OFF \
    -DWITH_GL_PROFILE_ES20=OFF \
    -DLLVM_VERSION=3.5 \
    -DLLVM_STATIC=ON \
    -DWITH_CYCLES_CUDA_BINARIES=$BUILDCUDA \
    -DWITH_CYCLES_OSL=ON \
    -DWITH_CYCLES_PTEX=OFF \
    -DWITH_OPENSUBDIV=ON \
    -DPYTHON_VERSION=3.5 \
    -DPYTHON_LIBPATH=/usr/lib \
    -DPYTHON_LIBRARY=python3.5m \
    -DPYTHON_INCLUDE_DIRS=/usr/include/python3.5m
  make # -j5 needs 48 GB of RAM while -j9 needs 64 GB

  # PTEX is currently broken and experimental in blender anyway
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"

  make DESTDIR="${pkgdir}" install
  python -m compileall "${pkgdir}/usr/share/blender"
  python -O -m compileall "${pkgdir}/usr/share/blender"
}
