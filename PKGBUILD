# Maintainer: Wilken Gottwalt <wilken dot gottwalt at posteo dot net>

pkgname=ollama-rocm-git
pkgver=0.5.13.git+bebb6823
pkgrel=1
pkgdesc='Create, run and share large language models (LLMs) with ROCm'
arch=(x86_64)
url='https://github.com/ollama/ollama'
license=(MIT)
provides=(ollama)
conflicts=(ollama)
depends=(comgr gcc-libs "hip-runtime-amd>=6.2.4" hipblas hsa-rocr libdrm libelf numactl rocblas rocsolver rocsparse)
optdepends=('rocm-smi-lib: monitor GPU usage with rocm-smi')
makedepends=(git gcc-libs "go>=1.23" "hip-runtime-amd>=6.2.4" hipblas hsa-rocr libdrm libelf numactl rocblas rocm-hip-sdk rocm-opencl-sdk rocsolver rocsparse)
source=(git+$url#branch=main
        ollama.service
        sysusers.conf
        tmpfiles.d)
b2sums=('SKIP'
        'e8e2e91d59d1aed0e2e8627cbca86969549578cdfde60be658e79ff42923f4b9784b4628a83ad810178abda4086be3fffb7495b91f94838e52e5f94772024363'
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

  sed -i 's/check_language(CUDA)//g' CMakeLists.txt
}

build() {
  export CMAKE_CUDA_COMPILER=/tmp

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
  install -Dm755 ollama/build/lib/ollama/* ${pkgdir}/usr/lib/ollama
  install -Dm644 ollama.service ${pkgdir}/usr/lib/systemd/system/ollama.service
  install -Dm644 sysusers.conf ${pkgdir}/usr/lib/sysusers.d/ollama.conf
  install -Dm644 tmpfiles.d ${pkgdir}/usr/lib/tmpfiles.d/ollama.conf

  ln -s /var/lib/ollama ${pkgdir}/usr/share/ollama
}
