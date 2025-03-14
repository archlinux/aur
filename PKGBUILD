# Maintainer: pika02
# Contributor: Wilken Gottwalt <wilken dot gottwalt at posteo dot net>

pkgname=ollama-for-amd-git
pkgver=0.6.0.git+4cd0c734
pkgrel=1
pkgdesc='Create, run and share large language models (LLMs) with ROCm, patched for AMD GPUs'
arch=(aarch64 x86_64)
url='https://github.com/likelovewant/ollama-for-amd'
license=(MIT)
provides=(ollama)
conflicts=(ollama)
depends=(gcc-libs)
makedepends=(git gcc-libs "go>=1.23")
source=(ollama::git+$url#branch=main
        ollama.service
        sysusers.conf
        tmpfiles.d)
b2sums=('SKIP'
        '45ae4a8607a3e3d3f6b72c13485eed2a5d6e8f72664cd209e4e0c0befe825c7c56f27d45a1f799e3c6c18a7acbe7120ac55bf10cf48827b107721b4fbc0b99e2'
        '3aabf135c4f18e1ad745ae8800db782b25b15305dfeaaa031b4501408ab7e7d01f66e8ebb5be59fc813cfbff6788d08d2e48dcf24ecc480a40ec9db8dbce9fec'
        'e8f2b19e2474f30a4f984b45787950012668bf0acb5ad1ebb25cd9776925ab4a6aa927f8131ed53e35b1c71b32c504c700fe5b5145ecd25c7a8284373bb951ed')

pkgver() {
  cd ollama
  local _tag="$(git describe --tags --abbrev=0)"
  local _hash="$(git rev-parse --short HEAD)"
  _tag="${_tag%-*}"
  echo "${_tag##v}.git+${_hash}"
}

prepare() {
  cd ollama

#   patch -Np1 -i ${srcdir}/0001-llama-mmap-fix-missing-include.patch
  sed -i 's/check_language(CUDA)//g' CMakeLists.txt
  sed -i 's/check_language(HIP)//g' CMakeLists.txt
}

build() {
  export CMAKE_CUDA_COMPILER=/tmp
  export CMAKE_HIP_COMPILER=/tmp

  cd ollama

  cmake -B build
  cmake --build build --config Release
  go build .
}

package() {
  install -dm755 ${pkgdir}/var/lib/ollama
  install -dm755 ${pkgdir}/usr/{bin,lib/ollama}
  install -Dm644 ollama/LICENSE ${pkgdir}/usr/share/licenses/ollama/LICENSE
  install -Dm755 ollama/ollama ${pkgdir}/usr/bin/ollama
  if [ "$CARCH" = "aarch64" ]; then
    install -Dm755 ollama/build/lib/ollama/*base* ${pkgdir}/usr/lib/ollama
  else
    install -Dm755 ollama/build/lib/ollama/* ${pkgdir}/usr/lib/ollama
  fi
  install -Dm644 ollama.service ${pkgdir}/usr/lib/systemd/system/ollama.service
  install -Dm644 sysusers.conf ${pkgdir}/usr/lib/sysusers.d/ollama.conf
  install -Dm644 tmpfiles.d ${pkgdir}/usr/lib/tmpfiles.d/ollama.conf

  ln -s /var/lib/ollama ${pkgdir}/usr/share/ollama
}
