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

pkgname=blender-git
pkgver=4.2.r132676.g4196cbd175e
pkgrel=1
pkgdesc="A fully integrated 3D graphics creation suite (development)"
arch=('i686' 'x86_64')
url="https://blender.org/"
depends+=('alembic' 'embree' 'libgl' 'python' 'python-numpy' 'openjpeg2' 'libharu' 'potrace' 'openxr'
          'ffmpeg' 'fftw' 'openal' 'freetype2' 'libxi' 'openimageio' 'opencolorio'
          'openvdb' 'opencollada' 'opensubdiv' 'openshadinglanguage' 'libtiff' 'libpng'
          'python' 'python-zstandard' 'ccache')
depends+=('libdecor' 'libepoxy')
optdepends=('cuda: CUDA support in Cycles'
            'optix>=7.4.0: OptiX support in Cycles'
            'usd: USD export Scene'
            'openpgl: Intel Path Guiding library in Cycles'
            'openimagedenoise: Intel Open Image Denoise support in compositing'
            'materialx: MaterialX materials'
            'level-zero-headers: Intel OpenCL FPGA kernels (all four needed)'
            'intel-compute-runtime: Intel OpenCL FPGA kernels (all four needed)'
            'intel-graphics-compiler: Intel OpenCL FPGA kernels (all four needed)'
            'intel-oneapi-basekit: Intel OpenCL FPGA kernels (all four needed)'
            'gcc11: Compile CUDA support in Cycles'
            'makepkg-cg: Control resources during compilation')
makedepends+=('git' 'cmake' 'boost' 'mesa' 'llvm' 'clang' 'subversion')
makedepends+=('wayland-protocols')
makedepends+=('cython')
makedepends+=('vulkan-headers')
provides=('blender')
conflicts=('blender' 'blender-4.1-bin')
license=('GPL')
source=("blender::git+https://github.com/blender/blender${_fragment}"
        'blender-addons::git+https://github.com/blender/blender-addons'
        'blender/translations::git+https://github.com/blender/blender-translations'
        'blender-addons-contrib::git+https://github.com/blender/blender-addons-contrib'
        'blender/dev_tools::git+https://github.com/blender/blender-dev-tools'
        'blender/assets::svn+https://svn.blender.org/svnroot/bf-blender/trunk/lib/assets'
        # Patches...
        '0001-Use-github.com-for-make-update-git.patch'
        '0004-fix-opencollada-pcre.patch' #fix broken search for opencollada pcre
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '52da80b721efb6a6d579adf531640becfac1955a88857ca46ca16030a52c3b1c'
            '6beedc541e33288a282f57cd2bd09860f333154027b6175e9f61cce49b8db5df')

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
  cd "blender"
  # update the submodules
  git -c protocol.file.allow=always submodule update --init --recursive --remote
  git apply -v "${srcdir}"/*.patch
}

build() {
  export PATH="/opt/lib:/opt/bin:$PATH"
  _pyver=$(python -c "from sys import version_info; print(\"%d.%d\" % (version_info[0],version_info[1]))")
  msg "python version detected: ${_pyver}"

  declare -a -g _CMAKE_FLAGS
  # determine whether we can install python modules
  if [[ -n "$_pyver" ]]; then
    export PYTHON_LIBRARY=/usr/lib/libpython${_pyver}.so
    export PYTHON_VERSION=${_pyver}
    _CMAKE_FLAGS+=( -DPYTHON_VERSION=$_pyver \
                    -DPYTHON_LIBRARY=/usr/lib/libpython${_pyver}.so \
                    -DWITH_PYTHON_INSTALL=ON \
                    -DWITH_PYTHON_SAFETY=OFF )
  fi

  export CUDAHOSTCXX="$CC"

  _CMAKE_FLAGS+=( -DWITH_CLANG=ON \
                  -DWITH_CYCLES=ON )

  # check for oneapi
  export _ONEAPI_CLANG=/opt/intel/oneapi/compiler/latest/linux/bin-llvm/clang
  export _ONEAPI_CLANGXX=/opt/intel/oneapi/compiler/latest/linux/bin-llvm/clang++
  [[ -f "$_ONEAPI_CLANG" ]] && (
    _CMAKE_FLAGS+=( -DWITH_CYCLES_DEVICE_ONEAPI=ON \
                    -DWITH_CYCLES_ONEAPI_BINARIES=ON \
                    -DWITH_CLANG=ON )
  )
  [[ -f /opt/bin/clang ]] && _CMAKE_FLAGS+=( -DLLVM_ROOT_DIR=/opt/lib )

  # determine whether we can precompile CUDA kernels
  _CUDA_PKG=$(pacman -Qq cuda 2>/dev/null) || true
  if [ "$_CUDA_PKG" != "" ]; then
    CUDAHOSTCXX=`which gcc-11`
    PATH="/usr/lib/gcc/x86_64-pc-linux-gnu/11.3.0/:$PATH"
    # https://wiki.blender.org/wiki/Building_Blender/GPU_Binaries
    _CMAKE_FLAGS+=( -DWITH_CYCLES_CUDA_BINARIES=ON \
                    -DWITH_COMPILER_ASAN=OFF \
                    -DCMAKE_CUDA_HOST_COMPILER=`which gcc-11` )
  fi

  # check for materialx
  _MX_PKG=$(pacman -Qq materialx 2>/dev/null) || true
  if [ "$_MX_PKG" != "" ]; then
    _CMAKE_FLAGS+=( -DWITH_MATERIALX=ON )
    PATH="/usr/materialx:$PATH"  
  fi

  _USD_PKG=$(pacman -Qq usd 2>/dev/null) || true
  if [ "$_USD_PKG" != "" ]; then
    _CMAKE_FLAGS+=( -DWITH_USD=ON )
    PATH="/usr/share/usd:$PATH"  
  fi

  # check for optix
  _OPTIX_PKG=$(pacman -Qq optix 2>/dev/null) || true
  if [ "$_OPTIX_PKG" != "" ]; then
      _CMAKE_FLAGS+=( -DWITH_CYCLES_DEVICE_OPTIX=ON \
                      -DOPTIX_ROOT_DIR=/opt/optix )
  fi

  # check for open image denoise
  _OIDN_PKG=$(pacman -Qq openimagedenoise 2>/dev/null) || true
  if [ "$_OIDN_PKG" != "" ]; then
      _CMAKE_FLAGS+=( -DWITH_OPENIMAGEDENOISE=ON )
  fi

  if [ -d /opt/rocm/bin ]; then
      _CMAKE_FLAGS+=( -DWITH_CYCLES_HIP_BINARIES=ON
                      -DWITH_CYCLES_HYDRA_RENDER_DELEGATE:BOOL=FALSE
                    )
  fi

  if [[ -f "$srcdir/blender/CMakeCache.txt" && -z "$KEEP_CMAKE_CACHE" ]]; then
    rm "$srcdir/blender/CMakeCache.txt"
  fi

  NUMPY_PY_INCLUDE=/usr/lib/python3.11/site-packages/numpy/core/include/
  [[ -d "$NUMPY_PY_INCLUDE" ]] && (
    _CMAKE_FLAGS+=( -DNUMPY_INCLUDE_DIR="$NUMPY_PY_INCLUDE" );
    __CFLAGS="$CFLAGS -I$NUMPY_PY_INCLUDE"
    __CXXFLAGS="$CXXFLAGS -I$NUMPY_PY_INCLUDE"
    export CFLAGS="$__CFLAGS"
    export CXXFLAGS="$__CXXFLAGS"
  )

  export CFLAGS="$CFLAGS -fno-lto"
  export CXXFLAGS="$CXXFLAGS -fno-lto"
  # Who even knows why this is needed
  export CFLAGS="$CFLAGS -lSPIRV -lSPIRV-Tools -lSPIRV-Tools-opt -lSPIRV-Tools-link -lSPIRV-Tools-reduce -lSPIRV-Tools-shared -lglslang"
  export CXXFLAGS="$CXXFLAGS -lSPIRV -lSPIRV-Tools -lSPIRV-Tools-opt -lSPIRV-Tools-link -lSPIRV-Tools-reduce -lSPIRV-Tools-shared -lglslang"
  _CMAKE_FLAGS+=( -DCMAKE_C_FLAGS="$CFLAGS" );
  _CMAKE_FLAGS+=( -DCMAKE_CXX_FLAGS="$CXXFLAGS" );

  CMAKE_CMD=(CUDAHOSTCXX="$CUDAHOSTCXX" cmake -B "$srcdir/build" --fresh
                -C "${srcdir}/blender/build_files/cmake/config/blender_release.cmake"
                -GUnix\ Makefiles
                -DCMAKE_INSTALL_PREFIX=/usr
                -DCMAKE_INSTALL_PREFIX_WITH_CONFIG="${pkgdir}/usr"
                -DCMAKE_SKIP_INSTALL_RPATH=ON
                -DCMAKE_SKIP_BUILD_RPATH=ON
                -DCMAKE_BUILD_TYPE=Release
                -DWITH_INSTALL_PORTABLE=OFF
                -DWITH_LIBS_PRECOMPILED=OFF
                -DWITH_STATIC_LIBS=OFF
                -DXR_OPENXR_SDK_ROOT_DIR=/usr
                -DPYTHON_VERSION="${_pyver}"
                "${_CMAKE_FLAGS[@]}"
  ) #> "$srcdir/../cmake_out"
                #--trace-expand \

  MAKE_CMD="make ${MAKEFLAGS:--j1} blender"

  USING_MAKEPKG_CG="$(systemctl --user -t slice | grep -o makepkg-cg-`id -u`-'[[:digit:]]\+'.slice'[[:space:]]\+'loaded'[[:space:]]\+'active)" || true
  MAKEPKG_CG_WARNING=$(
    cat << 'EOF'
If you use systemd, consider trying `makepkg-cg`.
This build is otherwise very likely to use more RAM than
the system has, especially with a high `-j`!
EOF
  )
  [[ -z "$USING_MAKEPKG_CG" ]] && warning "$MAKEPKG_CG_WARNING"
  
  cd blender
  env "${CMAKE_CMD[@]}"
  cd ../build
  env CFLAGS="$CFLAGS" CXXFLAGS="$CXXFLAGS" $MAKE_CMD
}

package() {
  _suffix=${pkgver%%.r*}
  cd "$srcdir/build"
  sed -ie 's/\(file(INSTALL\)\(.*blender\.1"\))/#\1\2)/' source/creator/cmake_install.cmake
  BLENDER_SYSTEM_RESOURCES="${pkgdir}/usr/share/blender/${_suffix}" make DESTDIR="$pkgdir" install
  #find . -name 'cmake_install.cmake' -exec sed -i -e 's|/usr/lib64/|'"$pkgdir"'/usr/lib/|g' {} \;
  #cmake --install . --prefix "$pkgdir/usr"

  if [[ -e "$pkgdir/usr/share/blender/${_suffix}/scripts/addons/cycles/lib/" ]] ; then
    # make sure the cuda kernels are not stripped
    chmod 444 "$pkgdir"/usr/share/blender/${_suffix}/scripts/addons/cycles/lib/*
  fi
}

# vim: syntax=bash:et:ts=2:sw=2
