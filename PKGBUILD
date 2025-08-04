# Maintainer:

: ${_build_x86_64_v2=false}
: ${_build_x86_64_v3=true}
: ${_build_x86_64_v4=false}

_pkgname="libggml"
pkgname="$_pkgname-cuda-git"
pkgver=r2404.7dee1d6
pkgrel=1
pkgdesc="Tensor library for machine learning"
url="https://github.com/ggml-org/ggml"
license=('MIT')
arch=('x86_64')

depends=(
  'openblas'
  'vulkan-icd-loader'
)
makedepends=(
  'cmake'
  'cuda'
  'git'
  'ninja'
  'shaderc'
  'vulkan-headers'
)

provides=("$_pkgname=${pkgver%.*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgname"::"git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgsrc"

  # ignore cpu feature flags; allow global microarchitecture level
  sed -E -e '/(set|APPEND).ARCH_FLAGS/d' -i src/ggml-cpu/CMakeLists.txt
}

pkgver() {
  cd "$_pkgsrc"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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
    -DGGML_STATIC=OFF
    -DGGML_VULKAN=ON
    -DBUILD_SHARED_LIBS=ON
    -Wno-dev
  )

  local _cflags=($(sed -E -e 's&-(march|mtune)=\S+\b&&g' -e 's&-O[0-9]+\b&&g' <<< "${CFLAGS}"))
  local _cxxflags=($(sed -E -e 's&-(march|mtune)=\S+\b&&g' -e 's&-O[0-9]+\b&&g' <<< "${CXXFLAGS}"))

  local _check _arch="x86-64"
  echo "Building with OpenBLAS + Vulkan + ${_arch} support..."
  CFLAGS="${_cflags[@]} -march=${_arch} -O3"
  CXXFLAGS="${_cxxflags[@]}  -march=${_arch} -O3"
  cmake -B "build_${_arch}" "${_cmake_common[@]}" -DCMAKE_INSTALL_LIBDIR="lib"
  cmake --build "build_${_arch}"

  for _arch in x86-64-v2 x86-64-v3 x86-64-v4; do
    _check="_build_${_arch//-/_}"
    if [[ "${!_check::1}" == "t" ]]; then
      echo "Building with OpenBLAS + Vulkan + ${_arch} support..."
      CFLAGS="${_cflags[@]} -march=${_arch} -O3"
      CXXFLAGS="${_cxxflags[@]}  -march=${_arch} -O3"
      cmake -B "build_${_arch}" "${_cmake_common[@]}" -DCMAKE_INSTALL_LIBDIR="lib/glibc-hwcaps/$_arch"
      cmake --build "build_${_arch}"
      DESTDIR="fakeinstall_${_arch}" cmake --install "build_${_arch}"
    fi
  done

  echo "Deleting unwanted files..."
  rm -rf fakeinstall_*/usr/lib/glibc-hwcaps/*/cmake
}

check() {
  ctest --test-dir build_x86-64 --output-on-failure --verbose --timeout 900 || :
}

package() {
  pkgdesc+=" with OpenBLAS + Vulkan + CUDA optimizations"
  depends+=(
    'nvidia-utils'
    'vulkan-driver'
  )

  for i in fakeinstall_*/usr/lib/glibc-hwcaps; do
    if [ -e "$i" ]; then
      mkdir -pm755 "$pkgdir/usr/lib/glibc-hwcaps/"
      cp -a "$i"/* "$pkgdir/usr/lib/glibc-hwcaps/"
    fi
  done

  DESTDIR="$pkgdir" cmake --install build_x86-64

  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
