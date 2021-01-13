# Maintainer: Markus Näther <naether.markus@gmail.com>

# Configuration.
_fragment=${FRAGMENT:-#branch=master}
[[ -v CUDA_ARCH ]] && _CUDA_ARCH=(${CUDA_ARCH})

#some extra, unofficially supported stuff goes here:
_CMAKE_FLAGS+=( -DWITH_ALEMBIC_HDF5=ON )

pkgname=bforartists
pkgver=2.6.0
pkgrel=1
pkgdesc="A fully integrated 3D graphics creation suite (development)"
arch=('i686' 'x86_64')
url="https://bforartists.de/"
depends+=('alembic' 'embree' 'libgl' 'python' 'python-numpy' 'openjpeg2'
         'ffmpeg' 'fftw' 'openal' 'freetype2' 'libxi' 'openimageio' 'opencolorio'
         'openvdb' 'opencollada' 'opensubdiv' 'openshadinglanguage' 'libtiff' 'libpng')
optdepends=('cuda: CUDA support in Cycles'
            'optix: OptiX support in Cycles'
            'usd=20.05: USD export Scene'
            'openimagedenoise: Intel Open Image Denoise support in compositing')
makedepends=('git' 'cmake' 'boost' 'mesa' 'ninja' 'llvm')
provides=('bforartists')
conflicts=('bforartists')
license=('GPL')
# NOTE: the source array has to be kept in sync with .gitmodules
# the submodules has to be stored in path ending with git to match
# the path in .gitmodules.
# More info:
#   http://wiki.blender.org/index.php/Dev:Doc/Tools/Git
source=("https://github.com/Bforartists/Bforartists/archive/v$pkgver.tar.gz"
        usd_python.patch #add missing python headers when building against python enabled usd.
        embree.patch #add missing embree link.
        )
sha256sums=('b79f8837b9ebe17b8fe9d07af4b5f8d0265048e073a5779a9bb77785927d2a26'
            '12bd6db5c1fe14244fd7321e3d740941a36aa545ec21b02325e7553c9214778a'
            'dd04c10b6a9c78849608eebfd1f2a5f2a280b7413a24a7f0337d67bceab90cb4')

#pkgver() {
  #blender_version=$(grep -Po "BFORARTISTS_VERSION \K[0-9]{3}" "$srcdir"/Bforartists-2.4.0/source/blender/blenkernel/BKE_blender_version.h)
  #printf "%d.%d.r%s.g%s" \
  #  $((blender_version/100)) \
  #  $((blender_version%100)) \
  #  "$(git -C "$srcdir/Bforartists-2.6.0" rev-list --count HEAD)" \
  #  "$(git -C "$srcdir/Bforartists-2.6.0" rev-parse --short HEAD)"
#}

prepare() {
  cd "$srcdir/Bforartists-$pkgver"
  # update the submodules
  git submodule update --init --recursive --remote
  git apply -v "${srcdir}"/{embree,usd_python}.patch
}

build() {
  _pyver=$(python -c "from sys import version_info; print(\"%d.%d\" % (version_info[0],version_info[1]))")

  # determine whether we can precompile CUDA kernels
  _CUDA_PKG=`pacman -Qq cuda 2>/dev/null` || true
  if [ "$_CUDA_PKG" != "" ]; then
    _CMAKE_FLAGS+=( -DWITH_CYCLES_CUDA_BINARIES=ON
                  -DCUDA_TOOLKIT_ROOT_DIR=/opt/cuda )
    if [[ -v _CUDA_ARCH ]]; then
      _CMAKE_FLAGS+=( -DCYCLES_CUDA_BINARIES_ARCH="$(IFS=';'; echo "${_CUDA_ARCH[*]}";)" )
    fi
  fi

  # check for optix
  _OPTIX_PKG=`pacman -Qq optix 2>/dev/null` || true
  if [ "$_OPTIX_PKG" != "" ]; then
      _CMAKE_FLAGS+=( -DWITH_CYCLES_DEVICE_OPTIX=ON
                      -DOPTIX_ROOT_DIR=/opt/optix )
  fi

  # check for open image denoise
  _OIDN_PKG=`pacman -Qq openimagedenoise 2>/dev/null` || true
  if [ "$_OIDN_PKG" != "" ]; then
      _CMAKE_FLAGS+=( -DWITH_OPENIMAGEDENOISE=ON )
  fi

  # check for universal scene descriptor
  _USD_PKG=`pacman -Qq usd=20.05 2>/dev/null` || true
  if [ "$_USD_PKG" != "" ]; then
    _CMAKE_FLAGS+=( -DWITH_USD=ON
                    -DUSD_ROOT=/usr )
  fi

  cmake -G Ninja -S "$srcdir/Bforartists-$pkgver" -B build \
        -C "${srcdir}/Bforartists-$pkgver/build_files/cmake/config/blender_release.cmake" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DWITH_INSTALL_PORTABLE=OFF \
        -DWITH_SYSTEM_GLEW=ON \
        -DWITH_PYTHON_INSTALL=OFF \
        -DPYTHON_VERSION="${_pyver}" \
        "${_CMAKE_FLAGS[@]}"
  ninja -C "$srcdir/build" ${MAKEFLAGS:--j10}
}

package() {
  _suffix=${pkgver%%.r*}
  DESTDIR="$pkgdir" ninja -C "$srcdir/build" install

  if [[ -e "$pkgdir/usr/share/bforartists/${_suffix}/scripts/addons/cycles/lib/" ]] ; then
    # make sure the cuda kernels are not stripped
    chmod 444 "$pkgdir"/usr/share/bforartists/${_suffix}/scripts/addons/cycles/lib/*
  fi
}
