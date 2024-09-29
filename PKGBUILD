#!/bin/bash
# Maintainer: Xavier Cho <mysticfallband@gmail.com>
# Adapted from blender-git AUR package.

#Configuration:
#Use: makepkg VAR1=0 VAR2=1 to enable(1) disable(0) a feature
#Use: {yay,paru} --mflags=VAR1=0,VAR2=1
#Use: aurutils --margs=VAR1=0,VAR2=1
#Use: VAR1=0 VAR2=1 pamac

# Use FRAGMENT=#{commit,tag,brach}=xxx for bisect build
_fragment="${FRAGMENT:-#branch=master}"

pkgname=upbge-git
pkgver=148024.f9aaa040f02
pkgrel=1
pkgdesc="Uchronia Project Blender Game Engine fork of Blender Game Engine"
arch=('i686' 'x86_64')
url="https://upbge.org/"
depends+=('alembic' 'embree' 'libgl' 'python' 'python-numpy' 'openjpeg2' 'libharu' 'potrace' 'openxr'
          'ffmpeg' 'fftw' 'openal' 'freetype2' 'libxi' 'openimageio' 'opencolorio' 'sdl2'
          'openvdb' 'opencollada' 'opensubdiv' 'openshadinglanguage' 'libtiff' 'libpng'
          'python' 'python-zstandard' 'ccache')
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
            'makepkg-cg: Control resources during compilation')
makedepends+=('git' 'cmake' 'boost' 'mesa' 'llvm' 'clang' 'subversion')
makedepends+=('wayland-protocols')
makedepends+=('cython')
provides=('blender')
conflicts=('blender' 'blender-git' 'blender-4.2-bin')
license=('GPL')
source=("upbge::git+https://github.com/UPBGE/upbge${_fragment}"
        'blender/translations::git+https://github.com/blender/blender-translations'
        'blender/dev_tools::git+https://github.com/blender/blender-dev-tools'
        'blender/assets::svn+https://svn.blender.org/svnroot/bf-blender/trunk/lib/assets'
        # Patches...
        '0001-use-github.com-for-make-update-git.patch'
        '0002-ffmpeg7.patch'
        '0003-ffmpeg7-audaspace.patch'
        '0004-numpy.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '0bb8ac4cba0ac00999790087c51e601d185b78a96081f08a7c7afb8c0f4b0d7c'
            '6c92c8e725962a3518ca061f2bf6c08ab6c1c0512b2508fa9dc59c10f3cfa513'
            '847ffe878ede6ecae505d29a5feba9a998e8857fe99895ed4c2da5aaab813aa8'
            'd8fb694a41ea1848f0d75250e5a3b7bdd84f82f1af9fcb68659cd4075cc818b3')

pkgver() {
	cd "$srcdir/upbge"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/upbge"

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
                    -DWITH_PYTHON_INSTALL=OFF \
                    -DWITH_PYTHON_SAFETY=OFF )
  fi

  export CUDAHOSTCXX="$CC"

  _CMAKE_FLAGS+=( -DWITH_CLANG=ON \
                  -DWITH_CYCLES=ON \
                  -DCMAKE_LINKER_TYPE=BFD )

  # Use CUDA_ARCH to build for specific GPU architecture
  # Supports: single arch (sm_52) and list of archs (sm_52;sm_60)
  [[ -v CUDA_ARCH ]] && _CMAKE_FLAGS+=(-DCYCLES_CUDA_BINARIES_ARCH="${CUDA_ARCH}")


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
    # https://wiki.blender.org/wiki/Building_Blender/GPU_Binaries
    _CMAKE_FLAGS+=( -DWITH_CYCLES_CUDA_BINARIES=ON \
                    -DWITH_COMPILER_ASAN=OFF )
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

  if [[ -f "$srcdir/upbge/CMakeCache.txt" && -z "$KEEP_CMAKE_CACHE" ]]; then
    rm "$srcdir/upbge/CMakeCache.txt"
  fi

  export CFLAGS="$CFLAGS -fno-lto"
  export CXXFLAGS="$CXXFLAGS -fno-lto"
  # Who even knows why this is needed
  export CFLAGS="$CFLAGS -lSPIRV -lSPIRV-Tools -lSPIRV-Tools-opt -lSPIRV-Tools-link -lSPIRV-Tools-reduce -lSPIRV-Tools-shared -lglslang"
  export CXXFLAGS="$CXXFLAGS -lSPIRV -lSPIRV-Tools -lSPIRV-Tools-opt -lSPIRV-Tools-link -lSPIRV-Tools-reduce -lSPIRV-Tools-shared -lglslang"
  _CMAKE_FLAGS+=( -DCMAKE_C_FLAGS="$CFLAGS" );
  _CMAKE_FLAGS+=( -DCMAKE_CXX_FLAGS="$CXXFLAGS" );

  CMAKE_CMD=(CUDAHOSTCXX="$CUDAHOSTCXX" cmake -B "$srcdir/build" --fresh
                -C "${srcdir}/upbge/build_files/cmake/config/blender_release.cmake"
                -GUnix\ Makefiles
                -DCMAKE_INSTALL_PREFIX=/usr
                -DCMAKE_INSTALL_PREFIX_WITH_CONFIG="${pkgdir}/usr"
                -DCMAKE_SKIP_INSTALL_RPATH=ON
                -DCMAKE_SKIP_BUILD_RPATH=ON
                -DCMAKE_BUILD_TYPE=Release
                -DWITH_GAMEENGINE=ON
                -DWITH_PLAYER=ON
                -DWITH_SDL=ON
                -DWITH_SDL_DYNLOAD=OFF
                -DWITH_CODEC_FFMPEG=ON
                -DWITH_MOD_OCEANSIM=ON
                -DWITH_INSTALL_PORTABLE=OFF
                -DWITH_LIBS_PRECOMPILED=OFF
                -DWITH_STATIC_LIBS=OFF
                -DXR_OPENXR_SDK_ROOT_DIR=/usr
                -DSDL2_ROOT_DIR=/usr
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
  
  cd upbge
  env "${CMAKE_CMD[@]}"
  cd ../build
  env CFLAGS="$CFLAGS" CXXFLAGS="$CXXFLAGS" $MAKE_CMD
}

package() {
  _suffix=$(grep -Po "(?<=#define UPBGE_VERSION )\d+" "$srcdir"/upbge/source/blender/blenkernel/BKE_blender_version.h | sed "s/^\(.\)\(.\)$/\1.\2/")

  cd "$srcdir/build"
  sed -ie 's/\(file(INSTALL\)\(.*blender\.1"\))/#\1\2)/' source/creator/cmake_install.cmake
  BLENDER_SYSTEM_RESOURCES="${pkgdir}/usr/share/upbge/${_suffix}" make DESTDIR="$pkgdir" install

  if [[ -e "$pkgdir/usr/share/upbge/${_suffix}/scripts/addons_core/cycles/lib/" ]] ; then
    # make sure the cuda kernels are not stripped
    chmod 444 "$pkgdir"/usr/share/upbge/${_suffix}/scripts/addons_core/cycles/lib/*
  fi

  install -D -m755 "$srcdir"/build/bin/blenderplayer "$pkgdir"/usr/bin/blenderplayer
  install -D -m644 "$srcdir"/upbge/release/freedesktop/org.upbge.UPBGE.desktop "$pkgdir"/usr/share/applications/org.upbge.UPBGE.desktop
  install -D -m644 "$srcdir"/upbge/release/freedesktop/icons/scalable/apps/org.upbge.UPBGE.svg \
    "$pkgdir"/usr/share/icons/hicolor/scalable/apps/org.upbge.UPBGE.svg
}

# vim: syntax=bash:et:ts=2:sw=2
