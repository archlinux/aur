# Maintainer: Howetuft <howetuft@gmail.com>
# Contributor:

# You may define CUDA_ARCH to target specific GPU architecture
# for instance: CUDA_ARCH=sm_50
[[ -v CUDA_ARCH ]] && _cuda_capability=(${CUDA_ARCH})

# You may define CUDA_HOST_COMPILER to target specific compiler
# for instance: CUDA_HOST_COMPILER=gcc-9
[[ -v CUDA_HOST_COMPILER ]] && _cuda_host_compiler=(${CUDA_HOST_COMPILER})

pkgname=cycles-standalone
pkgver=3.0.0
pkgrel=2
pkgdesc="Blender Cycles rendering engine, standalone version"
arch=(x86_64)
url="https://github.com/blender/cycles.git"
license=(Apache)
depends=(libglvnd openexr glew pugixml freeglut openimageio tbb openvdb embree openimagedenoise opensubdiv openshadinglanguage alembic sdl2)
makedepends=(cmake git boost llvm)
optdepends=(cuda optix)
provides=(cycles)
source=("git+https://github.com/blender/cycles.git#commit=e801066323feb555ed1d4e2628110d3c0f7241e4"
        0001-SelectCudaComputeArch.patch
        0002-OpenEXR3.patch
        0003-Remove-FindClang.patch
        0004-FindOpenImageIO.patch
        cycles_wrap.sh)
sha256sums=('SKIP'
            '66c02b42e1b5c29aa0755d81fe684ddfd9d1b8f1d576e6873228de276b5d7c36'
            '8e982140e10367fa04f0548b0567014401ada3c1df1385c4478b2bac8509fa23'
            '8023662b9578f535a4094ec47f76c134ebf3472d352759775a60d0590d6e6b27'
            '95a893fa34f2ad40bfc44ee3253408c96bc8ed5ebaa03d4117613d7641489be5'
            '00afc4aab5541d147b013c31ab91d78e272654a75cae60b39cf70c23a2612c96')

prepare() {
    _src_root_dir="$srcdir/cycles"
    if [ ! -v _cuda_capability ] && grep -q nvidia <(lsmod); then
      git -C "$_src_root_dir"  apply -v "${srcdir}"/0001-SelectCudaComputeArch.patch
    fi
    git -C "$_src_root_dir" apply -v "${srcdir}"/0002-OpenEXR3.patch
    git -C "$_src_root_dir" apply -v "${srcdir}"/0003-Remove-FindClang.patch
    git -C "$_src_root_dir" apply -v "${srcdir}"/0004-FindOpenImageIO.patch
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

      if [[ -v _cuda_host_compiler ]]; then
        _CMAKE_FLAGS+=( -DCUDA_HOST_COMPILER="$_cuda_host_compiler" )
      elif _cuda_gcc=$(basename "$(readlink /opt/cuda/bin/gcc)") ; then
        [ -L "/usr/lib/ccache/bin/$_cuda_gcc" ] && _CMAKE_FLAGS+=( -DCUDA_HOST_COMPILER=/usr/lib/ccache/bin/"$_cuda_gcc" )
      fi
    fi

    echo "${_CMAKE_FLAGS[@]}"
    # Make app
    cmake -B build -S "cycles" \
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
    install -D -m444 build/src/kernel/osl/shaders/*.oso -t "${pkgdir}/usr/lib/cycles/shader"

    # License
    install -D -m444 cycles/LICENSE -t "${pkgdir}/usr/share/doc/cycles/license"
}
