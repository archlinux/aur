# Maintainer: Howetuft <howetuft@gmail.com>
# Contributor:


[[ -v CUDA_ARCH ]] && _cuda_capability=(${CUDA_ARCH})

pkgname=cycles-standalone
pkgver=v2.93.0.r7.gacb51a8e
pkgrel=1
pkgdesc="Blender Cycles rendering engine, standalone version"
arch=(x86_64)
url="https://wiki.blender.org/wiki/Source/Render/Cycles/Standalone"
license=(Apache)
depends=(libglvnd openexr glew pugixml freeglut openimageio tbb openvdb embree openimagedenoise opensubdiv openshadinglanguage)
makedepends=(cmake git boost llvm)
optdepends=(cuda optix)
provides=(cycles)
source=("cycles-standalone::git+https://git.blender.org/cycles.git"
        SelectCudaComputeArch.patch
        OpenEXR3.patch
        cycles_wrap.sh)
sha256sums=('SKIP'
            '7abd5530694535db488568cc98d2a7be4cb5ded0f5d8d5d2dad2d08da7008330'
            '9e644ccbfb58f1e9cd4a31ada9abcc5496371fb29195b2a92069a7f8888750e7'
            '00afc4aab5541d147b013c31ab91d78e272654a75cae60b39cf70c23a2612c96')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    if [ ! -v _cuda_capability ] && grep -q nvidia <(lsmod); then
      git -C "$srcdir/$pkgname" apply -v "${srcdir}"/SelectCudaComputeArch.patch
    fi
    git -C "$srcdir/$pkgname" apply -v "${srcdir}"/OpenEXR3.patch
    rm "$srcdir/$pkgname"/src/cmake/Modules/FindClang.cmake  # Rely on system FindClang
}

build() {
    # Determine whether we can precompile CUDA kernels
    # (credits to blender-2.90-git package)
    _CUDA_PKG=$(pacman -Qq cuda 2>/dev/null) || true
    if [ "$_CUDA_PKG" != "" ] && ! ((DISABLE_CUDA)) ; then
      _CMAKE_FLAGS+=( -DWITH_CYCLES_CUDA_BINARIES=ON
                    -DCUDA_TOOLKIT_ROOT_DIR=/opt/cuda )
      ((DISABLE_OPTIX)) || _CMAKE_FLAGS+=( -DOPTIX_ROOT_DIR=/opt/optix )
      if [[ -v _cuda_capability ]]; then
        _CMAKE_FLAGS+=( -DCYCLES_CUDA_BINARIES_ARCH="$(IFS=';'; echo "${_cuda_capability[*]}";)" )
      fi
      [ -f "/usr/lib/ccache/bin/nvcc-ccache" ] && _CMAKE_FLAGS+=( -DCUDA_NVCC_EXECUTABLE=/usr/lib/ccache/bin/nvcc-ccache )
      if _cuda_gcc=$(basename "$(readlink /opt/cuda/bin/gcc)") ; then
        [ -L "/usr/lib/ccache/bin/$_cuda_gcc" ] && _CMAKE_FLAGS+=( -DCUDA_HOST_COMPILER=/usr/lib/ccache/bin/"$_cuda_gcc" )
      fi
    fi

    # Make app
    cmake -B build -S "${pkgname}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWITH_CYCLES_STANDALONE_GUI=TRUE \
        -DWITH_CYCLES_OSL=TRUE \
        -DCMAKE_SKIP_INSTALL_RPATH=YES \
        "${_CMAKE_FLAGS[@]}" \
        -Wno-dev

    make -C build
}

package() {
    # Application
    install -D -m755 build/bin/cycles -t "${pkgdir}/usr/lib/cycles"

    # Wrapper script
    install -D -m755 cycles_wrap.sh -T "${pkgdir}/usr/bin/cycles"

    # CUDA binaries (if any)
    if ls build/src/kernel/*.cubin 1> /dev/null 2>&1 ; then
        install -D -m444 build/src/kernel/*.cubin -t "${pkgdir}/usr/lib/cycles/lib"
    fi

    # OSL shaders
    install -D -m444 build/src/kernel/shaders/*.oso -t "${pkgdir}/usr/lib/cycles/shader"

    # License
    install -D -m444 ${pkgname}/LICENSE -t "${pkgdir}/usr/share/doc/cycles/license"
}
