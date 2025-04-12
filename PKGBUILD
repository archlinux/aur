# Maintainer: robertfoster

pkgname=llama.cpp-sycl-f16-git
pkgver=b5123.r1.bc091a4dc
pkgrel=1
pkgdesc="Port of Facebook's LLaMA model in C/C++ (with Intel SYCL GPU optimizations and F16)"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/ggerganov/llama.cpp"
license=("MIT")
depends=('ggml-sycl-f16-git')
makedepends=(
  'cmake'
  'git'
)
optdepends=(
  'python-gguf: convert_hf_to_gguf python script'
  'python-numpy: convert_hf_to_gguf.py python script'
  'python-pytorch: convert_hf_to_gguf.py python script'
)
conflicts=("${pkgname%%-git}" 'llama.cpp')
conflicts=("${pkgname%%-git}" 'llama.cpp')
source=("${pkgname%%-git}::git+${url}"
  "kompute::git+https://github.com/nomic-ai/kompute.git"
  "llama.cpp.conf"
  "llama.cpp.service"
)

pkgver() {
  cd "${srcdir}/${pkgname%%-git}"

  printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "${srcdir}/${pkgname%%-git}"
  git submodule init
  git config submodule.kompute.url "${srcdir}/kompute"
  git -c protocol.file.allow=always submodule update
}

build() {
  source /opt/intel/oneapi/setvars.sh
  cmake \
    -B "${srcdir}/build" \
    -S "${srcdir}/${pkgname%%-git}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_COMPILER=icx \
    -DCMAKE_CXX_COMPILER=icpx \
    -DLLAMA_BUILD_TESTS=0 \
    -DLLAMA_USE_SYSTEM_GGML=1

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"

  # systemd
  install -D -m644 "${srcdir}/llama.cpp.conf" \
    "${pkgdir}/etc/conf.d/llama.cpp"
  install -D -m644 "${srcdir}/llama.cpp.service" \
    -t "${pkgdir}/usr/lib/systemd/system"

  install -Dm644 "${srcdir}/${pkgname%%-git}/LICENSE" \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

sha256sums=('SKIP'
  'SKIP'
  '53fa70cfe40cb8a3ca432590e4f76561df0f129a31b121c9b4b34af0da7c4d87'
  '1fc9d4f0cfa407404acc3859c26c53a79d14f5e5bc72f21084d87dde04e36f20')
