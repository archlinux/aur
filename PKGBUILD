# Maintainer: chadsr <git at ross dot ch>

# Thanks to maintainer(s) of the following packages for reference material:
# - https://aur.archlinux.org/ollama-rocm-git
# - https://aur.archlinux.org/ollama-for-amd-git

pkgname=ollama-for-amd
pkgver=0.12.6
pkgrel=1
pkgdesc='Create, run and share large language models (LLMs) with ROCm, patched for AMD GPUs'
arch=(x86_64 aarch64)
url='https://github.com/likelovewant/ollama-for-amd'
license=(MIT)
conflicts=(ollama ollama-rocm)
provides=("ollama=${pkgver}")
depends=(comgr gcc-libs "hip-runtime-amd>=6.3.2" hipblas hsa-rocr libdrm libelf numactl rocblas rocsolver rocsparse)
optdepends=('rocm-smi-lib: monitor GPU usage with rocm-smi' 'amdgpu_top: tool that shows AMD GPU utilization')
makedepends=(cmake git gcc-libs "go>=1.24" "hip-runtime-amd>=6.3.2" hipblas hipblas-common hsa-rocr libdrm libelf numactl rocblas rocm-hip-sdk rocm-opencl-sdk rocsolver rocsparse)
options=(!distcc !debug strip lto)
source=(${url}/archive/refs/tags/v${pkgver}.tar.gz
    ollama.service
    sysusers.conf
    tmpfiles.conf)
b2sums=(
    '319f076e3ee43f388a474897406e6790ffb9a1271ebce10fd22f94b03f226e612ad1178d939f9a43bd8b41e96ea4b1710656fe8ae514e3cda06fed97544e4567'
    '683efc624a883aeb653b0afe944c0ab1fb4b79ff838066d3050d5ec6f8d21770c8cf65cf6fbb2ade7daacb65e0b54caed93cce1f7b987991aec6a9b69464f1ee'
    '68622ac2e20c1d4f9741c57d2567695ec7b5204ab43356d164483cd3bc9da79fad72489bb33c8a17c2e5cb3b142353ed5f466ce857b0f46965426d16fb388632'
    'e8f2b19e2474f30a4f984b45787950012668bf0acb5ad1ebb25cd9776925ab4a6aa927f8131ed53e35b1c71b32c504c700fe5b5145ecd25c7a8284373bb951ed')

prepare() {
    cd ${pkgname}-${pkgver}

    sed -i 's/check_language(CUDA)//g' CMakeLists.txt
}

build() {
    export CMAKE_HIP_COMPILER=/tmp
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOPATH="${srcdir}"
    export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw '-ldflags=-linkmode=external -X=github.com/ollama/ollama/version.Version=${pkgver} -X=github.com/ollama/ollama/server.mode=release'"

    cd ${pkgname}-${pkgver}

    # all possible targets are usually listed on the latest release: https://github.com/likelovewant/ollama-for-amd/releases
    #   https://rocm.docs.amd.com/en/docs-6.4.0/reference/gpu-arch-specs.html
    # this config is set to mainstream cards RX6000 - RX9000 (including workstation cards)
    cmake \
        -B build \
        -DAMDGPU_TARGETS="gfx1010;gfx1012;gfx1030;gfx1100;gfx1101;gfx1103;gfx1150;gfx1151;gfx1200;gfx1201" \
        -Wno-dev
    cmake --build build --config Release
    go build .
}

package() {
    install -dm755 ${pkgdir}/var/lib/ollama
    install -dm755 ${pkgdir}/usr/{bin,lib/ollama}
    install -Dm644 ${pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/ollama/LICENSE
    install -Dm755 ${pkgname}-${pkgver}/ollama ${pkgdir}/usr/bin/ollama
    if [ "$CARCH" = "aarch64" ]; then
        install -Dm755 ${pkgname}-${pkgver}/build/lib/ollama/*base* ${pkgdir}/usr/lib/ollama
    else
        install -Dm755 ${pkgname}-${pkgver}/build/lib/ollama/* ${pkgdir}/usr/lib/ollama
    fi
    install -Dm644 ollama.service ${pkgdir}/usr/lib/systemd/system/ollama.service
    install -Dm644 sysusers.conf ${pkgdir}/usr/lib/sysusers.d/ollama.conf
    install -Dm644 tmpfiles.conf ${pkgdir}/usr/lib/tmpfiles.d/ollama.conf

    ln -s /var/lib/ollama ${pkgdir}/usr/share/ollama
}
