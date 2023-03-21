#!/bin/hint/bash
# Maintainer: Fredrick Brennan <copypaste@kittens.ph>
# Submitter: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Co-maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

#Configuration:
#Use: makepkg VAR1=0 VAR2=1 to enable(1) disable(0) a feature
#Use: {yay,paru} --mflags=VAR1=0,VAR2=1
#Use: aurutils --margs=VAR1=0,VAR2=1
#Use: VAR1=0 VAR2=1 pamac

# Use FRAGMENT=#{commit,tag,brach}=xxx for bisect build
_fragment="${FRAGMENT:-#branch=main}"

# Use CUDA_ARCH to build for specific GPU architecture
# Supports: single arch (sm_52) and list of archs (sm_52;sm_60)
[[ -v CUDA_ARCH ]] && _CMAKE_FLAGS+=(-DCYCLES_CUDA_BINARIES_ARCH="${CUDA_ARCH}")

#some extra, unofficially supported stuff goes here:
_CMAKE_FLAGS+=( -DWITH_CYCLES_NETWORK=OFF )

pkgname=blender-git
pkgver=3.6.r122604.g0323f8d1d9c
pkgrel=1
pkgdesc="A fully integrated 3D graphics creation suite (development)"
arch=('i686' 'x86_64')
url="https://blender.org/"
depends+=('alembic' 'embree' 'libgl' 'python' 'python-numpy' 'openjpeg2' 'libharu' 'potrace' 'openxr'
          'ffmpeg' 'fftw' 'openal' 'freetype2' 'libxi' 'openimageio' 'opencolorio'
          'openvdb' 'opencollada' 'opensubdiv' 'openshadinglanguage' 'libtiff' 'libpng')
depends+=('libdecor' 'libepoxy')
optdepends=('cuda: CUDA support in Cycles'
            'optix>=7.4.0: OptiX support in Cycles'
            'usd=21.05: USD export Scene'
            'openpgl: Intel Path Guiding library in Cycles'
            'openimagedenoise: Intel Open Image Denoise support in compositing')
makedepends=('git' 'cmake' 'boost' 'mesa' 'ninja' 'llvm')
makedepends+=('wayland-protocols')
provides=('blender')
conflicts=('blender')
license=('GPL')
source=("blender::git+https://github.com/blender/blender${_fragment}"
        'blender-addons::git+https://github.com/blender/blender-addons'
        'blender-addons-contrib::git+https://github.com/blender/blender-addons-contrib'
        'blender-translations::git+https://github.com/blender/blender-translations'
        'blender-dev-tools::git+https://github.com/blender/blender-dev-tools'
        usd_python.patch #add missing python headers when building against python enabled usd.
        embree.patch #add missing embree link.
        user-blender.slice.sh #generate systemd compilation unit
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'c2db51a83a8d573aa76c760f10e541c84b108d64d05c9647681c4e633b3d0397'
            'd587135fd9b815d60e8b7f48976aa835472922fc8f64c256dc397bfcd3c2642a'
            'a62b23567d520984f36d6a3158fd99f463e3187f2ad062ead418c260fac5ea8a')

pkgver() {
  blender_version=$(grep -Po "BLENDER_VERSION \K[0-9]{3}" "$srcdir"/blender/source/blender/blenkernel/BKE_blender_version.h)
  printf "%d.%d.r%s.g%s" \
    $((blender_version/100)) \
    $((blender_version%100)) \
    "$(git -C "$srcdir/blender" rev-list --count HEAD)" \
    "$(git -C "$srcdir/blender" rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir"
  ../user-blender.slice.sh > user-`id -u`-blender.slice
  cd "blender"
  # update the submodules
  git -c protocol.file.allow=always submodule update --init --recursive --remote
  git apply -v "${srcdir}"/{embree,usd_python}.patch
}

build() {
  _pyver=$(python -c "from sys import version_info; print(\"%d.%d\" % (version_info[0],version_info[1]))")
  msg "python version detected: ${_pyver}"

  # determine whether we can precompile CUDA kernels
  _CUDA_PKG=$(pacman -Qq cuda 2>/dev/null) || true
  if [ "$_CUDA_PKG" != "" ]; then
    _CMAKE_FLAGS+=( -DWITH_CYCLES_CUDA_BINARIES=ON
                    -DCUDA_TOOLKIT_ROOT_DIR=/opt/cuda )
  fi

  # check for optix
  _OPTIX_PKG=$(pacman -Qq optix 2>/dev/null) || true
  if [ "$_OPTIX_PKG" != "" ]; then
      _CMAKE_FLAGS+=( -DWITH_CYCLES_DEVICE_OPTIX=ON
                      -DOPTIX_ROOT_DIR=/opt/optix )
  fi

  # check for open image denoise
  _OIDN_PKG=$(pacman -Qq openimagedenoise 2>/dev/null) || true
  if [ "$_OIDN_PKG" != "" ]; then
      _CMAKE_FLAGS+=( -DWITH_OPENIMAGEDENOISE=ON )
  fi

  # check for universal scene descriptor
  _USD_PKG=$(pacman -Qq usd=21.02 2>/dev/null) || true
  if [ "$_USD_PKG" != "" ]; then
    _CMAKE_FLAGS+=( -DWITH_USD=ON
                    -DUSD_ROOT=/usr )
  fi

  cmake -G Ninja -S "$srcdir/blender" -B build \
        -C "${srcdir}/blender/build_files/cmake/config/blender_release.cmake" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DWITH_INSTALL_PORTABLE=OFF \
        -DWITH_SYSTEM_GLEW=OFF \
        -DWITH_PYTHON_INSTALL=OFF \
        -DXR_OPENXR_SDK_ROOT_DIR=/usr \
        -DPYTHON_VERSION="${_pyver}" \
        "${_CMAKE_FLAGS[@]}"
  NINJA_CMD="ninja -C ""$srcdir/build"
  if [[ "x$BLENDER_GIT_USE_SLICE_AUR" == "xy" ]]; then
    killninja() { killall ninja; }
    trap killninja INT
    systemd-run --uid=`whoami` --slice=user-`id -u`-blender.slice -P --working-directory="$PWD" --wait --send-sighup bash -c "$NINJA_CMD"
  else
    warning 'If you use systemd, consider trying `BLENDER_GIT_USE_SLICE_AUR=y`.'
    $NINJA_CMD ${MAKEFLAGS:--j1}
  fi
}

package() {
  _suffix=${pkgver%%.r*}
  DESTDIR="$pkgdir" ninja -C "$srcdir/build" install

  if [[ -e "$pkgdir/usr/share/blender/${_suffix}/scripts/addons/cycles/lib/" ]] ; then
    # make sure the cuda kernels are not stripped
    chmod 444 "$pkgdir"/usr/share/blender/${_suffix}/scripts/addons/cycles/lib/*
  fi
}

# vim: et:ts=2:sw=2
