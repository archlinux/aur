# Maintainer: Wilken Gottwalt <wilken dot gottwalt at posteo dot net>

pkgname=ollama-rocm-git
pkgver=0.11.6.r3.g4ae4f47b16fd
pkgrel=1
pkgdesc='Create, run and share large language models (LLMs) with ROCm'
arch=(x86_64)
url='https://github.com/ollama/ollama'
license=(MIT)
conflicts=(ollama)
provides=("ollama=${pkgver%%.r*}")
depends=(comgr gcc-libs "hip-runtime-amd>=6.3.2" hipblas hsa-rocr libdrm libelf numactl rocblas rocsolver rocsparse)
optdepends=('rocm-smi-lib: monitor GPU usage with rocm-smi' 'amdgpu_top: tool that shows AMD GPU utilization')
makedepends=(cmake git gcc-libs "go>=1.23" "hip-runtime-amd>=6.3.2" hipblas hipblas-common hsa-rocr libdrm libelf numactl rocblas rocm-hip-sdk rocm-opencl-sdk rocsolver rocsparse)
options=(!distcc !debug strip lto)
source=(git+$url#branch=main
        ollama.service
        sysusers.conf
        tmpfiles.d)
b2sums=('SKIP'
        'b2567ca9222da664aa52d290bfdea34bec7f03ea0553888a849aad582fc340c17176ede35abd366ca159615af32617fcc23279f3ce1566422ba22f0e46783cf8'
        '3aabf135c4f18e1ad745ae8800db782b25b15305dfeaaa031b4501408ab7e7d01f66e8ebb5be59fc813cfbff6788d08d2e48dcf24ecc480a40ec9db8dbce9fec'
        'e8f2b19e2474f30a4f984b45787950012668bf0acb5ad1ebb25cd9776925ab4a6aa927f8131ed53e35b1c71b32c504c700fe5b5145ecd25c7a8284373bb951ed')

pkgver() {
  cd ollama
  git describe --long --tags --abbrev=12 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ollama

  sed -i 's/check_language(CUDA)//g' CMakeLists.txt
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw '-ldflags=-linkmode=external -X=github.com/ollama/ollama/version.Version=${pkgver} -X=github.com/ollama/ollama/server.mode=release'"

  cd ollama

  # all possible targets: gfx900;gfx940;gfx941;gfx942;gfx1010;gfx1012;gfx1030;gfx1100;gfx1101;gfx1102;gfx1200;gfx1201;gfx906:xnack-;gfx908:xnack-;gfx90a:xnack+;gfx90a:xnack-
  # this just produces an insanly huge ollama and takes very long, just pick your target, you can look them up here:
  #   https://rocm.docs.amd.com/en/docs-6.4.0/reference/gpu-arch-specs.html
  # this config is set to mainstream cards RX6000 - RX7000 (including workstation cards)
  # there is no official RX9000 support yet (gfx1200,gfx1201), but they will build
  cmake \
    -B build \
    -DAMDGPU_TARGETS="gfx1010;gfx1012;gfx1030;gfx1100;gfx1101;gfx1102;gfx1200;gfx1201" \
    -Wno-dev
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
