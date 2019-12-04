# Maintainer: Fredrick Brennan <copypaste@kittens.ph>
# Submitter: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=blender-git
pkgver=2.81.r91063.ab519b91b2c
pkgrel=1
pkgdesc="A fully integrated 3D graphics creation suite (development)"
arch=('i686' 'x86_64')
url="http://blender.org/"
depends=('alembic' 'libgl' 'python' 'desktop-file-utils' 'hicolor-icon-theme' 'openjpeg'
         'ffmpeg' 'fftw' 'openal' 'freetype2' 'libxi' 'openimageio' 'opencolorio'
         'openvdb' 'opencollada' 'opensubdiv' 'openshadinglanguage' 'libtiff' 'libpng' 'python-numpy')
optdepends=('cuda: CUDA support in Cycles'
            'optix: OptiX support in Cycles'
            'openimagedenoise: Intel Open Image Denoise support in compositing')
makedepends=('git' 'cmake' 'boost' 'mesa' 'llvm')
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
        'blender-dev-tools.git::git://git.blender.org/blender-dev-tools.git' \
        blender.desktop)
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         '47e5bbe93fc221066882947211ff7812')

pkgver() {
  cd "$srcdir/blender"
  printf "%s.r%s.%s" "$(grep -Po "BLENDER_VERSION \K[0-9]{3}" source/blender/blenkernel/BKE_blender_version.h|sed 's/./&./1')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

 _pyver=$(python -c "from sys import version_info; print(\"%d.%d\" % (version_info[0],version_info[1]))")

# determine whether we can precompile CUDA kernels
_CUDA_PKG=`pacman -Qq cuda 2>/dev/null` || true
if [ "$_CUDA_PKG" != "" ]; then
    _EXTRAOPTS="-DWITH_CYCLES_CUDA_BINARIES=ON \
                -DCUDA_TOOLKIT_ROOT_DIR=/opt/cuda"
fi

# check for optix
_OPTIX_PKG=`pacman -Qq optix 2>/dev/null` || true
if [ "$_OPTIX_PKG" != "" ]; then
    _EXTRAOPTS="$_EXTRAOPTS \
    -DWITH_CYCLES_DEVICE_OPTIX=ON \
    -DOPTIX_ROOT_DIR=/opt/optix"
fi

# check for open image denoise
_OIDN_PKG=`pacman -Qq openimagedenoise 2>/dev/null` || true
if [ "$_OIDN_PKG" != "" ]; then
    _EXTRAOPTS="$_EXTRAOPTS \
    -DWITH_OPENIMAGEDENOISE=ON"
fi

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
        -C${srcdir}/blender/build_files/cmake/config/blender_release.cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DWITH_INSTALL_PORTABLE=OFF \
        -DWITH_OPENCOLORIO=ON \
        -DWITH_FFTW3=ON \
        -DWITH_SYSTEM_GLEW=ON \
        -DWITH_CODEC_FFMPEG=ON \
        -DWITH_PYTHON_INSTALL=OFF \
        -DPYTHON_VERSION=${_pyver} \
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
