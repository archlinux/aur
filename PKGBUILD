pkgname=llama-cpp-x64v3
pkgver=0.6.0
pkgrel=1
pkgdesc='LLM inference in C/C++ (x86-64-v3 optimized)'
arch=(x86_64)
url=https://github.com/ggml-org/llama.cpp
license=(MIT)
depends=(
  ggml
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
source=(git+https://github.com/ggml-org/llama.cpp.git#tag=v${pkgver}
        llama-server-system.service
        llama-server-user.service)
b2sums=('e62f131cbf9fbaa223ba86753a80b1212d912d839ee5cf62970f7696f769f687b2fc0319da4e8b74e60348dcfac3a0ef700f4ac62901f053b6b6a176e4af13ef'
        'd9bada4b57b8d748030617465946841dfd966caee8e20b25af072de51e223ceacc6a3aca2dbfab7d513a03b2e70674a3b115885796f9feb8d3676bd1585df40d'
        '0d9f7e1e645eda76683f6da67a4ddcb43e8fc7d0b892c548783239525e635f8f168d758024060e32fcf816892875311bf53342ad33038917c0139281a1f6fef6')

build() {
  export CFLAGS="${CFLAGS} -march=x86-64-v3"
  export CXXFLAGS="${CXXFLAGS} -march=x86-64-v3"

  pushd "./llama.cpp/tools/ui"
  npm ci --ignore-scripts
  npm run build
  popd

  cmake -S llama.cpp -B build -G Ninja \
      -DCMAKE_BUILD_TYPE=None \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_C_FLAGS="${CFLAGS}" \
      -DCMAKE_CXX_FLAGS="${CXXFLAGS}" \
      -DLLAMA_BUILD_APP=OFF \
      -DLLAMA_BUILD_EXAMPLES=ON \
      -DLLAMA_BUILD_SERVER=ON \
      -DLLAMA_BUILD_TESTS=OFF \
      -DLLAMA_BUILD_TOOLS=ON \
      -DLLAMA_BUILD_UI=ON \
      -DLLAMA_USE_SYSTEM_GGML=ON
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
