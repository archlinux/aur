# Maintainer: Rumato Estorsky <@rumatoest at x.com>

pkgname=llama-prism-cuda-git
pkgrel=1
pkgver="0.0.0_b12128_d7b2896"
_tag="prism-b10831-9d9efea"
pkgdesc='llama.cpp PrismML fork for Ternary Bonsai LLM models. With CUDA support.'
arch=(x86_64)
url=https://github.com/PrismML-Eng/llama.cpp
license=(MIT)
depends=(
  cuda
  glibc
  libgcc
  libstdc++
  openssl
)
conflicts=(llama-cpp)
provides=(llama-cpp)
replaces=(
  llama-cpp-rocm
  llama-cpp-vulkan
)
makedepends=(
  cmake
  git
  ninja
  npm
)

# Git repo size is huge.
# Need to download only exact commit but AUR tools are not allowing me to do that.
# This is a workaround to clone with depth=1
DLAGENTS=("shallow_git::/usr/bin/git clone --depth 1 --single-branch --branch ${_tag} https://github.com/PrismML-Eng/llama.cpp.git")

source=( "shallow_git://llama.cpp" llama-server-system.service llama-server-user.service)

sha256sums=(
    'SKIP'
    'fe37e0856db64877ace4164a51880e643776cdb8e43cc279bf500f42258dbc2a'
    '4a68f8a040532adb222fb0eeb8046fc553df7879200b6f6bd0cbe5cd3635accf'
)

prepare() {
  # The custom DLAGENT leave a folder literally named "shallow_git:"
  # (trailing colon) instead of the expected "llama.cpp".
  # echo "PREPARE ${srcdir}"
  # pwd
  if [[ -d "${startdir}/shallow_git:" ]]; then
    rm -rf "${srcdir}/llama.cpp" 
    mv "${startdir}/shallow_git:/llama.cpp" "${srcdir}"
    rmdir "${startdir}/shallow_git:"
  fi
}

build() {
  pushd "./llama.cpp/tools/ui"
  npm ci --ignore-scripts
  npm run build
  popd

  cmake -S ./llama.cpp -B build -G Ninja \
      -DCMAKE_BUILD_TYPE=None \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DLLAMA_BUILD_APP=OFF \
      -DLLAMA_BUILD_EXAMPLES=ON \
      -DLLAMA_BUILD_SERVER=ON \
      -DLLAMA_BUILD_TESTS=OFF \
      -DLLAMA_BUILD_TOOLS=ON \
      -DLLAMA_BUILD_UI=ON \
      -DGGML_CUDA=ON 
      # -DGGML_CUDA=ON -DCMAKE_CUDA_ARCHITECTURES=75 #for rtx 20 series
      # -DGGML_CUDA=ON -DCMAKE_CUDA_ARCHITECTURES=86 #for rtx 30 series
      # -DGGML_CUDA=ON -DCMAKE_CUDA_ARCHITECTURES=89 #for rtx 40 series
      # -DGGML_CUDA=ON -DCMAKE_CUDA_ARCHITECTURES="130;140" #for rtx 60 series

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm 644 llama.cpp/LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
  install -Dm 644 llama-server-system.service "${pkgdir}"/usr/lib/systemd/system/llama-server.service
  install -Dm 644 llama-server-user.service "${pkgdir}"/usr/lib/systemd/user/llama-server.service
  sed -i "s/%PKGVER%/$pkgver/g" "${pkgdir}"/usr/lib/systemd/*/llama-server.service
  mkdir -p "${pkgdir}"/usr/share/llama/models
}
