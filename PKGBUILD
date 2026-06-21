# Maintainer: graysky <therealgraysky AT proton DOT me>

# Export the variable matching your GPU, then run makepkg:
#   CUDA_ARCH=120 makepkg -si
#
# Architecture      Compute Cap.  GPUs
# ─────────────────────────────────────────────────────────────────────────────
# 121            12.1          GB10 (DGX Spark)
# 120            12.0          GeForce RTX 5090/5080/5070/5060/5050,
#                                 RTX PRO 6000/5000/4500/4000/2000 Blackwell
# 103            10.3          GB300, B300 (data center)
# 100            10.0          GB200, B200 (data center)
# 90             9.0           H100, H200, GH200 (data center)
# 89             8.9           GeForce RTX 4090/4080/4070/4060/4050,
#                                 RTX 6000/5000/4500/4000 Ada, L4, L40, L40S
# 87             8.7           Jetson AGX Orin, Orin NX, Orin Nano
# 86             8.6           GeForce RTX 3090/3080/3070/3060/3050,
#                                 RTX A6000/A5000/A4000/A3000/A2000, A40, A10
# 80             8.0           A100, A30 (data center)
# 75             7.5           GeForce RTX 2080/2070/2060, GTX 1650 Ti, T4
#
# Reference: https://developer.nvidia.com/cuda-gpus
_cuda_arch="${CUDA_ARCH:-75;86;89;120}"

# Build a library variant for each enabled x86-64 microarchitecture level.
# The lowest enabled level installs to the normal /usr/lib (the universal
# fallback); higher levels install to /usr/lib/glibc-hwcaps/<level>/ and the
# dynamic loader auto-selects the best one the running CPU supports.
# Enable only what you want built; at least one must be true.
: ${_build_x86_64=false}
: ${_build_x86_64_v2=false}
: ${_build_x86_64_v3=true}
: ${_build_x86_64_v4=false}

pkgname=libggml-cuda
pkgver=0.15.2
pkgrel=1
pkgdesc="Tensor library for machine learning"
url="https://github.com/ggml-org/ggml"
license=(MIT)
arch=(x86_64)

depends=(openblas vulkan-icd-loader)
makedepends=(cmake cuda git ninja shaderc spirv-headers vulkan-headers)

provides=("libggml=${pkgver%.*}")
conflicts=(libggml)

_pkgsrc="ggml-$pkgver"
source=("$_pkgsrc.tar.gz"::"$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('298e958817a126c44bb8e97c97d5d53d00bd15eca22bebf805f278223fe29e07')

# Lowest enabled level; this is the one installed to the default /usr/lib.
_primary_arch() {
  local _arch _var
  for _arch in x86-64 x86-64-v2 x86-64-v3 x86-64-v4; do
    _var="_build_${_arch//-/_}"
    if [[ "${!_var}" == t* ]]; then
      echo "$_arch"
      return
    fi
  done
}

prepare() {
  cd "$_pkgsrc"

  # ignore cpu feature flags; allow global microarchitecture level
  sed -E -e '/(set|APPEND).ARCH_FLAGS/d' -i src/ggml-cpu/CMakeLists.txt

  if [[ -z "$_cuda_arch" ]]; then
    cat <<EOF

ERROR: CUDA_ARCH is not set. You must specify your GPU architecture.
       Set it before running makepkg, for example:

       CUDA_ARCH=120 makepkg -si

  121  → GB10 (DGX Spark)
  120  → GeForce RTX 5090/5080/5070/5060/5050, RTX PRO Blackwell
  103  → GB300, B300 (data center)
  100  → GB200, B200 (data center)
  90   → H100, H200, GH200
  89   → GeForce RTX 4090/4080/4070/4060/4050, Ada, L4, L40S
  87   → Jetson AGX Orin, Orin NX, Orin Nano
  86   → GeForce RTX 3090/3080/3070/3060/3050, RTX A-series, A40
  80   → A100, A30 (data center)
  75   → GeForce RTX 2080/2070/2060, GTX 1650 Ti, T4

  See: https://developer.nvidia.com/cuda-gpus

EOF
    return 1
  fi
}

build() {
  local _cmake_common=(
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX="/usr"
    -DGGML_NATIVE=ON # will follow standard flags; march=native removed in prepare
    -DGGML_LTO=ON
    -DGGML_RPC=ON
    -DGGML_ALL_WARNINGS=OFF
    -DGGML_ALL_WARNINGS_3RD_PARTY=OFF
    -DGGML_BLAS=ON
    -DGGML_BLAS_VENDOR=OpenBLAS
    -DGGML_CUDA=ON
    -DGGML_CUDA_F16=ON
    -DGGML_VULKAN=ON
    -DGGML_STATIC=OFF
    -DBUILD_SHARED_LIBS=ON
    -Wno-dev
  )

  local _cflags=($(sed -E -e 's&-(march|mtune)=\S+\b&&g' -e 's&-O[0-9]+\b&&g' <<< "${CFLAGS}"))
  local _cxxflags=($(sed -E -e 's&-(march|mtune)=\S+\b&&g' -e 's&-O[0-9]+\b&&g' <<< "${CXXFLAGS}"))

  local _primary
  _primary="$(_primary_arch)"
  if [[ -z "$_primary" ]]; then
    echo "ERROR: no microarchitecture level enabled; set at least one _build_x86_64* to true" >&2
    return 1
  fi

  export CUDAToolkit_ROOT=/opt/cuda
  echo "set(CMAKE_CUDA_ARCHITECTURES ${_cuda_arch})" > /tmp/voxtype-cuda-arch.cmake
  export CMAKE_TOOLCHAIN_FILE=/tmp/voxtype-cuda-arch.cmake

  local _arch _var
  for _arch in x86-64 x86-64-v2 x86-64-v3 x86-64-v4; do
    _var="_build_${_arch//-/_}"
    [[ "${!_var}" == t* ]] || continue

    echo "Building with OpenBLAS + Vulkan + ${_arch} support..."
    CFLAGS="${_cflags[@]} -march=${_arch} -O3"
    CXXFLAGS="${_cxxflags[@]} -march=${_arch} -O3"

    if [[ "$_arch" == "$_primary" ]]; then
      # lowest level: installed straight into /usr/lib during package()
      cmake -B "build_${_arch}" "${_cmake_common[@]}" -DCMAKE_INSTALL_LIBDIR="lib"
      cmake --build "build_${_arch}"
    else
      # higher levels: glibc-hwcaps overlays the loader picks automatically
      cmake -B "build_${_arch}" "${_cmake_common[@]}" -DCMAKE_INSTALL_LIBDIR="lib/glibc-hwcaps/$_arch"
      cmake --build "build_${_arch}"
      DESTDIR="fakeinstall_${_arch}" cmake --install "build_${_arch}"
    fi
  done

  echo "Deleting unwanted files..."
  rm -rf fakeinstall_*/usr/lib/glibc-hwcaps/*/cmake
}

check() {
  ctest --test-dir "build_$(_primary_arch)" --output-on-failure --verbose --timeout 900 || :
}

package() {
  pkgdesc+=" with OpenBLAS + Vulkan + CUDA optimizations"
  depends+=(nvidia-utils vulkan-driver)

  # primary level: full install (libs in /usr/lib, headers, binaries, cmake, ...)
  DESTDIR="$pkgdir" cmake --install "build_$(_primary_arch)"

  # higher levels: only their glibc-hwcaps libraries
  for i in fakeinstall_*/usr/lib/glibc-hwcaps; do
    if [ -e "$i" ]; then
      mkdir -pm755 "$pkgdir/usr/lib/glibc-hwcaps/"
      cp -a "$i"/* "$pkgdir/usr/lib/glibc-hwcaps/"
    fi
  done

  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
