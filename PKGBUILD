#!/bin/bash
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
pkgver=3.6.r123308.g91a29c9b9af
pkgrel=1
pkgdesc="A fully integrated 3D graphics creation suite (development)"
arch=('i686' 'x86_64')
url="https://blender.org/"
depends+=('alembic' 'embree' 'libgl' 'python' 'python-numpy' 'openjpeg2' 'libharu' 'potrace' 'openxr'
          'ffmpeg' 'fftw' 'openal' 'freetype2' 'libxi' 'openimageio' 'opencolorio'
          'openvdb' 'opencollada' 'opensubdiv' 'openshadinglanguage' 'libtiff' 'libpng'
          'python' 'python-zstandard')
depends+=('libdecor' 'libepoxy')
optdepends=('cuda: CUDA support in Cycles'
            'optix>=7.4.0: OptiX support in Cycles'
            'usd=21.05: USD export Scene'
            'openpgl: Intel Path Guiding library in Cycles'
            'openimagedenoise: Intel Open Image Denoise support in compositing'
            'materialx: MaterialX materials'
            'level-zero-headers: Intel OpenCL FPGA kernels (all four needed)'
            'intel-compute-runtime: Intel OpenCL FPGA kernels (all four needed)'
            'intel-graphics-compiler: Intel OpenCL FPGA kernels (all four needed)'
            'intel-oneapi-basekit: Intel OpenCL FPGA kernels (all four needed)'
            'gcc11: Compile CUDA support in Cycles')
makedepends+=('git' 'cmake' 'boost' 'mesa' 'ninja' 'llvm' 'clang' 'subversion')
makedepends+=('wayland-protocols')
provides=('blender')
conflicts=('blender')
license=('GPL')
source=("blender::git+https://github.com/blender/blender${_fragment}"
        'blender-addons::git+https://github.com/blender/blender-addons'
        'blender/translations::git+https://github.com/blender/blender-translations'
        'blender-addons-contrib::git+https://github.com/blender/blender-addons-contrib'
        'blender/dev_tools::git+https://github.com/blender/blender-dev-tools'
        'blender/assets::svn+https://svn.blender.org/svnroot/bf-blender/trunk/lib/assets'
        'user-blender.slice' #systemd compilation unit
        # Patches...
        '0001-Use-github.com-for-make-update-git.patch'
        '0003-usd_python.patch' #add missing python headers when building against python enabled usd.
        '0002-embree.patch' #add missing embree link.
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '10cf3652cf16f8042437bb511e2b030035433978f71cf1da8028711f49599074'
            '52da80b721efb6a6d579adf531640becfac1955a88857ca46ca16030a52c3b1c'
            'c2db51a83a8d573aa76c760f10e541c84b108d64d05c9647681c4e633b3d0397'
            '1d88d87c97e953b21eb551016e8295954997f18cbb4998c230cd1f596a87b6f2')

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
  mkdir -p blender/scripts/addons
  rm -rf blender/scripts/addons{,/contrib}
  mv blender-addons blender/scripts/addons
  mv blender-addons-contrib blender/scripts/addons/contrib
  cp user-blender.slice user-`id -u`-blender.slice
  cd "blender"
  # update the submodules
  git -c protocol.file.allow=always submodule update --init --recursive --remote
  git apply -v "${srcdir}"/*.patch
}

build() {
  export PATH="/opt/lib:/opt/bin:$PATH"
  _pyver=$(python -c "from sys import version_info; print(\"%d.%d\" % (version_info[0],version_info[1]))")
  msg "python version detected: ${_pyver}"

  # determine whether we can install python modules
  if [ "$_pyver" != "" ]; then
    _CMAKE_FLAGS+=( -DWITH_PYTHON=ON
                    -DWITH_PYTHON_MODULE=OFF
                    -DWITH_PYTHON_INSTALL=ON )
  fi

  export CC=`which clang`
  export CXX=`which clang++`
  export CUDAHOSTCXX="$CC"

  # check for oneapi
  export _ONEAPI_CLANG=/opt/intel/oneapi/compiler/latest/linux/bin-llvm/clang
  export _ONEAPI_CLANGXX=/opt/intel/oneapi/compiler/latest/linux/bin-llvm/clang++
  [[ -f "$_ONEAPI_CLANG" ]] && (
    _CMAKE_FLAGS+=( -DWITH_CYCLES_DEVICE_ONEAPI=ON \
                    -DWITH_CYCLES_ONEAPI_BINARIES=ON \
                    -DWITH_CLANG=ON )
  )
  [[ -f /opt/bin/clang ]] && _CMAKE_FLAGS+=-DLLVM_ROOT_DIR=/opt/lib

  # determine whether we can precompile CUDA kernels
  _CUDA_PKG=$(pacman -Qq cuda 2>/dev/null) || true
  if [ "$_CUDA_PKG" != "" ]; then
    CUDAHOSTCXX=`which gcc-11`
    _CMAKE_FLAGS+=( -DWITH_CYCLES_CUDA_BINARIES=ON
                    # https://wiki.blender.org/wiki/Building_Blender/GPU_Binaries
                    -DWITH_COMPILER_ASAN=OFF
                    -DCMAKE_CUDA_HOST_COMPILER=`which gcc-11`
                    -DCUDA_TOOLKIT_ROOT_DIR=/opt/cuda )
  fi

  # check for materialx
  _MX_PKG=$(pacman -Qq materialx 2>/dev/null) || true
  if [ "$_MX_PKG" != "" ]; then
    _CMAKE_FLAGS+=( -DWITH_MATERIALX=ON )
    PATH="/usr/materialx:$PATH"  
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
  _USD_PKG=$(pacman -Qq usd>=21.02 2>/dev/null) || true
  if [ "$_USD_PKG" != "" ]; then
    _CMAKE_FLAGS+=( -DWITH_USD=ON
                    -DUSD_ROOT=/usr )
  fi

  [ -f "$srcdir/blender/CMakeCache.txt" ] && rm "$srcdir/blender/CMakeCache.txt"
  CUDAHOSTCXX="$CUDAHOSTCXX" cmake -G Ninja -S "$srcdir/blender" -B build --fresh \
        -C "${srcdir}/blender/build_files/cmake/config/blender_release.cmake" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWITH_STATIC_LIBS=OFF \
        -DCMAKE_BUILD_TYPE=Release \
        -DWITH_INSTALL_PORTABLE=OFF \
        -DWITH_LIBS_PRECOMPILED=OFF \
        -DOCLOC_INSTALL_DIR=/usr/bin \
        -DXR_OPENXR_SDK_ROOT_DIR=/usr \
        -DPYTHON_VERSION="${_pyver}" \
        "${_CMAKE_FLAGS[@]}"
        #--trace-expand \
  NINJA_CMD="ninja -C ""$srcdir/build"" ${MAKEFLAGS:--j1}"
  if [[ "x$BLENDER_GIT_USE_SLICE_AUR" == "xy" ]]; then
    killninja() { killall ninja; }
    trap killninja INT
    systemd-run --uid=`whoami` --slice=user-`id -u`-blender.slice -P --working-directory="$PWD" --wait --send-sighup bash -c "$NINJA_CMD"
  else
    warning 'If you use systemd, consider trying `BLENDER_GIT_USE_SLICE_AUR=y`.'
    $NINJA_CMD
  fi
}

package() {
  _suffix=${pkgver%%.r*}
  DESTDIR="$pkgdir" ninja -C "$srcdir/build" install

  if [[ -e "$pkgdir/usr/share/blender/${_suffix}/scripts/addons/cycles/lib/" ]] ; then
    # make sure the cuda kernels are not stripped
    chmod 444 "$pkgdir"/usr/share/blender/${_suffix}/scripts/addons/cycles/lib/*
  fi

  # This prevents an error due to missing file in LD_LIBRARY_PATH when using Intel OpenCL kernels.
  mkdir -p "$pkgdir"/usr/lib
  [ -f "$pkgdir/usr/share/blender/lib/libcycles_kernel_oneapi_jit.so" ] && \
    ln -s "$pkgdir/usr/share/blender/lib/libcycles_kernel_oneapi_jit.so" "$pkgdir/usr/lib/libcycles_kernel_oneapi_jit.so" && \
      chmod 444 "$pkgdir"/usr/lib/libcycles_kernel_oneapi_jit.so || true
}

# vim: et:ts=2:sw=2
