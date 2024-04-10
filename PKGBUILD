# Maintainer: Cross Nastasi <cross@dill.moe>
pkgname=llama.cpp-cuda-git-fast
pkgver=r2645.4f407a0a3
pkgrel=1
pkgdesc="llama.cpp main and server binaries with cuda support compiled from source. It builds with all available cores + 1 for optimal performance."
arch=('x86_64')
url="https://github.com/ggerganov/llama.cpp"
license=('GPL')
depends=('cuda' 'mingw-w64-binutils' 'gcc' 'make' 'git')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/llama.cpp"
  printf "r%s.%s-%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" "$pkgrel"
}

build() {
  cd "${srcdir}/llama.cpp"
  env -i PATH="$PATH" LD_LIBRARY_PATH="$LD_LIBRARY_PATH" CUDA_PATH="$CUDA_PATH" CUDA_HOME="$CUDA_HOME" make main server -j$(( $(nproc) + 1 )) LLAMA_CUDA=1
}

package() {
  cd "${srcdir}/llama.cpp"
  install -D -m755 main "${pkgdir}/usr/bin/lcpp-main"
  install -D -m755 server "${pkgdir}/usr/bin/lcpp-server"
}
