# Maintainer: Ulysses R. Ribeiro <ulyssesrr@gmail.com>

pkgname=llama-cpp-rocm-git
pkgver=r1110.423db74
pkgrel=1
pkgdesc="Port of Facebook's LLaMA model in C/C++ (with ROCm) (PR#1087)"
arch=('x86_64')
url="https://github.com/ggerganov/llama.cpp"
_reponame="llama.cpp"
license=("MIT")
depends=('hipblas')
makedepends=('git' 'rocm-llvm')
conflicts=('llama.cpp' 'llama-cpp')
provides=('llama.cpp' 'llama-cpp')
source=("$_reponame::git+${url}")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$_reponame"
  git fetch origin pull/1087/head:hipblas
  git checkout hipblas
}

pkgver() {
  cd "$srcdir/$_reponame"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$_reponame"
  
  # Compile source code for supported GPU archs in parallel
  export HIPCC_COMPILE_FLAGS_APPEND="-parallel-jobs=$(nproc)"
  export HIPCC_LINK_FLAGS_APPEND="-parallel-jobs=$(nproc)"
  # -fcf-protection is not supported by HIP, see
  # https://rocm.docs.amd.com/en/latest/reference/rocmcc/rocmcc.html#support-status-of-other-clang-options
  PATH="/opt/rocm/llvm/bin:/opt/rocm/bin:${PATH}" \
  CXXFLAGS="${CXXFLAGS} -fcf-protection=none" \

  export CC=/opt/rocm/llvm/bin/clang
  export CXX=/opt/rocm/llvm/bin/clang++
  
  cmake -B ./build \
    -Wno-dev \
    -S . \
    -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLAMA_HIPBLAS=ON \
    -DAMDGPU_TARGETS="$(/opt/rocm/llvm/bin/amdgpu-arch)"

  cmake --build ./build
}

package() {
  cd "$srcdir/$_reponame"

  cmake --install ./build

  cd "${pkgdir}/usr/bin/"
  for filename in *; do
    mv "$filename" "$_reponame-${filename}"
  done
  
  mv "${pkgdir}/usr/bin/$_reponame-main" \
    "${pkgdir}/usr/bin/$_reponame"
}
