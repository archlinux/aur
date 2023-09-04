#!/bin/hint/bash
# Maintainer: Xavier Cho <mysticfallband@gmail.com>
#shellcheck disable=SC2015

pkgname=upbge-git
pkgver=129501.11ca6b54643
pkgrel=1
pkgdesc="Uchronia Project Blender Game Engine fork of Blender Game Engine"
arch=("i686" "x86_64")
url="https://upbge.org/"
depends=("alembic" "embree" "libgl" "python" "python-numpy" "openjpeg2" "libharu" "potrace" "openxr"
         "ffmpeg" "fftw" "openal" "freetype2" "libxi" "openimageio" "opencolorio" "libdecor" "openexr"
         "openvdb" "opencollada" "opensubdiv" "openshadinglanguage" "libtiff" "libpng" "openimagedenoise")
optdepends=("cuda: CUDA support in Cycles"
         "optix>=7.1.0: OptiX support in Cycles"
         "openpgl: Path guiding support in Cycles"
         "materialx: MaterialX materials"
         "level-zero-headers: Intel OpenCL FPGA kernels (all four needed)"
         "intel-compute-runtime: Intel OpenCL FPGA kernels (all four needed)"
         "intel-graphics-compiler: Intel OpenCL FPGA kernels (all four needed)"
         "intel-oneapi-basekit: Intel OpenCL FPGA kernels (all four needed)"
         "gcc12: Compile CUDA support in Cycles"
         "gcc12-libs: Compile CUDA support in Cycles"
         "makepkg-cg: Control resources during compilation"
         "usd: USD export Scene")
makedepends=("git" "subversion" "cmake" "clang" "boost" "mesa" "llvm" wayland{,-protocols} 
         "libxkbcommon")
provides=("blender")
conflicts=("blender")
license=("GPL")
install=upbge.install

# NOTE: the source array has to be kept in sync with .gitmodules
# the submodules has to be stored in path ending with git to match
# the path in .gitmodules.
# More info:
#   http://wiki.blender.org/index.php/Dev:Doc/Tools/Git
source=(
  "upbge::git+https://github.com/UPBGE/upbge.git"
  "blender-addons.git::git+https://github.com/UPBGE/blender-addons.git"
  "blender-addons-contrib.git::git+https://projects.blender.org/blender/blender-addons-contrib.git"
  "blender-translations.git::git+https://projects.blender.org/blender/blender-translations.git"
  "blender-dev-tools.git::git+https://projects.blender.org/blender/blender-dev-tools.git"
  upbge.desktop
  python11.patch
  usd_python.patch
  SelectCudaComputeArch.patch
  embree.patch)
sha256sums=(
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
  "b5c9bf4fa265389db4b3f23e96d74cc86c51d908b8943eb80967614d8af1ea1a"
  "ae81c77dd41736bbcf65e31fa77477979b214004be3423e10eddef7af3f12dff"
  "5b98624ec2ce39fdb33836527343d026edbb63c948850b20c1c20c019d24f434"
  "155c04f971d3f45618a89fa73d91e21ba493ae24029475e18192c49c3fcd8cb4"
  "e34fa6034ca065cdddc380ef7fb1ab094349203dc6d63b2526cdf4740b1eaf02")

pkgver() {
	cd "$srcdir/upbge"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  make -C "$srcdir/upbge" update

  if grep -q nvidia <(lsmod); then
    git -C "$srcdir/upbge" apply -v "${srcdir}"/SelectCudaComputeArch.patch
  fi
  ((DISABLE_USD)) || git -C "$srcdir/upbge" apply -v "${srcdir}"/usd_python.patch
  git -C "$srcdir/upbge" apply -v "${srcdir}"/embree.patch
  git -C "$srcdir/upbge" apply -v "${srcdir}"/python11.patch
}

build() {
  _pyver=$(python -c "from sys import version_info; print(\"%d.%d\" % (version_info[0],version_info[1]))")
  msg "Python version detected: ${_pyver}"

  # determine whether we can install python modules
  if [[ -n "$_pyver" ]]; then
    _CMAKE_FLAGS+=( -DWITH_PYTHON=$_pyver \
                    -DWITH_PYTHON_MODULE=OFF \
                    -DWITH_PYTHON_INSTALL=ON \
                    -DWITH_PYTHON_SAFETY=ON )
  fi

  export CC=`which gcc-12`
  export CXX=`which g++-12`
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
    CUDAHOSTCXX=`which gcc-12`
    # https://wiki.blender.org/wiki/Building_Blender/GPU_Binaries
    _CMAKE_FLAGS+=( -DWITH_CYCLES_CUDA_BINARIES=ON \
                    -DWITH_COMPILER_ASAN=OFF \
                    -DCMAKE_CUDA_HOST_COMPILER=`which gcc-12` )
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

  # check for universal scene descriptor
  _USD_PKG=$(pacman -Qq usd=21.02 2>/dev/null) || true
  if [ "$_USD_PKG" != "" ]; then
    _CMAKE_FLAGS+=( -DWITH_USD=ON
                    -DUSD_ROOT=/usr )
  fi

  (2>&1 CUDAHOSTCXX="$CUDAHOSTCXX" cmake -S "$srcdir/upbge" -B build --fresh \
        -C "${srcdir}/upbge/build_files/cmake/config/blender_release.cmake" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DWITH_STATIC_LIBS=OFF \
        -DWITH_INSTALL_PORTABLE=OFF \
        -DWITH_LIBS_PRECOMPILED=OFF \
        -DWITH_GAMEENGINE=ON \
        -DWITH_PLAYER=ON \
        -DWITH_PYTHON_INSTALL=OFF \
        -DWITH_FFTW3=ON \
        -DWITH_CODEC_FFMPEG=ON \
        -DWITH_MOD_OCEANSIM=ON \
        -DXR_OPENXR_SDK_ROOT_DIR=/usr \
        -DPYTHON_VERSION="${_pyver}" \
        ${_CMAKE_FLAGS[@]}) #> "$srcdir/../cmake_out"
        #--trace-expand \

  cd build

  MAKE_CMD="make ${MAKEFLAGS:--j1}"

  USING_MAKEPKG_CG="$(systemctl --user -t slice | grep -o makepkg-cg-`id -u`-'[[:digit:]]\+'.slice'[[:space:]]\+'loaded'[[:space:]]\+'active)" || true
  MAKEPKG_CG_WARNING=$(
    cat << 'EOF'
If you use systemd, consider trying `makepkg-cg`.
This build is otherwise very likely to use more RAM than
the system has, especially with a high `-j`!
EOF
  )
  [[ -z "$USING_MAKEPKG_CG" ]] && warning "$MAKEPKG_CG_WARNING"
  
  $MAKE_CMD
}

package() {
  export DESTDIR="$pkgdir"

  make -C "$srcdir/build" install

  #undo rpath clean in cmake_install ( faster than patching CMakeLists.txt)
  cp "$srcdir/build/bin/blender" "$pkgdir/usr/bin/blender"

  install -D -m755 "$srcdir"/build/bin/blenderplayer "$pkgdir"/usr/bin/blenderplayer
  install -D -m644 "$srcdir"/upbge.desktop "$pkgdir"/usr/share/applications/upbge.desktop
  install -D -m644 "$srcdir"/upbge/release/freedesktop/icons/scalable/apps/upbge.svg \
    "$pkgdir"/usr/share/icons/hicolor/scalable/apps/upbge.svg

  if [ -e "$pkgdir"/usr/share/upbge/*/scripts/addons/cycles/lib/ ] ; then
    # make sure the cuda kernels are not stripped
    chmod 444 "$pkgdir"/usr/share/upbge/*/scripts/addons/cycles/lib/*
  fi
}
# vim:set sw=2 ts=2 et:
