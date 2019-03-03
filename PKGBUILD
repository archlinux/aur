# Maintainer: Fredrick Brennan <copypaste@kittens.ph>
# Submitter: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=blender-oidn-git
pkgver=85418.65a3fe46b50
pkgrel=1
pkgdesc="A fully integrated 3D graphics creation suite (development)"
arch=('i686' 'x86_64')
url="http://blender.org/"
depends=('libgl' 'python' 'desktop-file-utils' 'hicolor-icon-theme'
         'ffmpeg' 'fftw' 'openal' 'freetype2' 'libxi' 'openimageio' 'opencolorio'
         'openshadinglanguage' 'libtiff' 'libpng' 'python-numpy' 'oidn')
optdepends=('cuda: CUDA support in Cycles')
makedepends=('git' 'cmake' 'boost' 'mesa')
provides=('blender')
conflicts=('blender' 'blender-git')
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
        'blender-dev-tools.git::git://git.blender.org/blender-dev-tools.git' \
        'blender.desktop' \
        'D4304.diff')
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
         '47e5bbe93fc221066882947211ff7812'
         '77f1e909583a438205044d6b13114085')

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
  git add -A
  git reset --hard
  patch -p0 --fuzz 3 < ../../D4304.diff
}

build() {
  mkdir -p "$srcdir/blender-build"
  cd "$srcdir/blender-build"

  cmake "$srcdir/blender" \
        -DPYTHON_NUMPY_PATH=/usr/lib/python3.7/site-packages \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWITH_INSTALL_PORTABLE=OFF \
        -DWITH_GAMEENGINE=ON \
        -DWITH_PLAYER=ON \
        -DWITH_OPENCOLORIO=ON \
        -DWITH_FFTW3=ON \
        -DWITH_SYSTEM_GLEW=ON \
        -DWITH_CODEC_FFMPEG=ON \
        -DWITH_PYTHON_INSTALL=OFF \
        -DPYTHON_VERSION=3.7m \
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
