# Maintainer: robertfoster

pkgname=llama.cpp-hipblas-git
pkgver=b4730
pkgrel=1
pkgdesc="Port of Facebook's LLaMA model in C/C++ (with AMD ROCm optimizations)"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/ggerganov/llama.cpp"
license=("MIT")
depends=('hipblas')
makedepends=(
  'clblast'
  'cmake'
  'git'
  'rocm-hip-sdk'
)
conflicts=("llama.cpp")
provides=("llama.cpp")
source=("llama.cpp::git+${url}"
  "kompute::git+https://github.com/nomic-ai/kompute.git"
  "llama.cpp.conf"
  "llama.cpp.service"
)

pkgver() {
  cd "${srcdir}/llama.cpp"

  printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "${srcdir}/llama.cpp"
  git submodule init
  git config submodule.kompute.url "${srcdir}/kompute"
  git -c protocol.file.allow=always submodule update
}

build() {
  local _cmake_args=(
    -B build
    -S .
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_BUILD_TYPE=Release
    -DGGML_HIP=ON
  )

  cd "${srcdir}/llama.cpp"
  export CXXFLAGS+="$CXXFLAGS -fcf-protection=none"
  CC=/opt/rocm/llvm/bin/clang CXX=/opt/rocm/llvm/bin/clang++ \
    cmake "${_cmake_args[@]}"
  cmake --build build
}

package() {
  cd "${srcdir}/llama.cpp"
  DESTDIR="${pkgdir}" cmake --install build

  # systemd
  install -D -m644 "${srcdir}/llama.cpp.conf" \
    "${pkgdir}/etc/conf.d/llama.cpp"
  install -D -m644 "${srcdir}/llama.cpp.service" \
    -t "${pkgdir}/usr/lib/systemd/system"

  rm "${pkgdir}/usr/include/"ggml*
}

sha256sums=('SKIP'
  'SKIP'
  '53fa70cfe40cb8a3ca432590e4f76561df0f129a31b121c9b4b34af0da7c4d87'
  '1fc9d4f0cfa407404acc3859c26c53a79d14f5e5bc72f21084d87dde04e36f20')
