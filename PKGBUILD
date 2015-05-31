# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=blender-git
pkgver=56696.3b95179
pkgrel=1
pkgdesc="Development version of Blender"
arch=('i686' 'x86_64')
url="http://blender.org/"
depends=('libgl' 'python' 'desktop-file-utils' 'hicolor-icon-theme'
         'ffmpeg' 'fftw' 'openal' 'freetype2' 'libxi' 'openimageio' 'opencolorio'
         'openshadinglanguage' 'libtiff' 'libpng')
optdepends=('cuda: CUDA support in Cycles')
makedepends=('git' 'cmake' 'boost' 'mesa')
provides=('blender')
conflicts=('blender')
license=('GPL')
install=blender.install
# NOTE: the source array has to be kept in sync with .gitmodules
# the submodules has to be stored in path ending with git to match
# the path in .gitmodules.
# More info:
#   http://wiki.blender.org/index.php/Dev:Doc/Tools/Git
source=('git://git.blender.org/blender.git' \
        'blender-addons.git::git://git.blender.org/blender-addons.git' \
        'blender-addons-contrib.git::git://git.blender.org/blender-addons-contrib.git' \
        'blender-translations.git::git://git.blender.org/blender-translations.git' \
        'scons.git::git://git.blender.org/scons.git' \
        blender.desktop)
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
         'e9c26e370839fd902eb76c98fe3b9589')
# NOTE: add submodules to the noextract
noextract=('blender-addons.git' 'blender-addons-contrib.git'
           'blender-translations.git' 'scons.git')

# determine whether we can precompile CUDA kernels
_CUDA_PKG=`pacman -Qq cuda 2>/dev/null` || true
if [ "$_CUDA_PKG" != "" ]; then
    _EXTRAOPTS="-DWITH_CYCLES_CUDA_BINARIES=ON \
                -DCUDA_TOOLKIT_ROOT_DIR=/opt/cuda"
fi

pkgver() {
  cd "$srcdir/blender"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/blender"
  # update the submodules
  git submodule update --init --recursive
  git submodule foreach git checkout master
  git submodule foreach git pull --rebase origin master
}

build() {
  mkdir -p "$srcdir/blender-build"
  cd "$srcdir/blender-build"

  cmake "$srcdir/blender" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWITH_INSTALL_PORTABLE=OFF \
        -DWITH_GAMEENGINE=ON \
        -DWITH_PLAYER=ON \
        -DWITH_OPENCOLORIO=ON \
        -DWITH_FFTW3=ON \
        -DWITH_SYSTEM_GLEW=ON \
        -DWITH_CODEC_FFMPEG=ON \
        -DWITH_PYTHON_INSTALL=OFF \
        -DPYTHON_VERSION=3.4m \
        -DWITH_MOD_OCEANSIM=ON \
        $_EXTRAOPTS
  make
}

package() {
  cd "$srcdir/blender-build"
  make DESTDIR="$pkgdir" install
  install -D -m644 "$srcdir"/blender.desktop \
    "$pkgdir"/usr/share/applications/blender.desktop

  if [ -e "$pkgdir"/usr/share/blender/*/scripts/addons/cycles/lib/ ] ; then
    # make sure the cuda kernels are not stripped
    chmod 444 "$pkgdir"/usr/share/blender/*/scripts/addons/cycles/lib/*
  fi
}
