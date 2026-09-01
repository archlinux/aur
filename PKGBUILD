# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=llama.cpp-cuda
pkgname=${_pkgname}-aidock-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='Prebuilt llama.cpp with CUDA 12.8 support (from ai-dock CI)'
arch=(x86_64 aarch64)
url='https://github.com/ai-dock/llama.cpp-cuda'
license=(MIT BSD-3-Clause LicenseRef-NVIDIA-CUDA)
depends=('openssl' 'nvidia-utils' 'libgomp' 'libstdc++' 'libgcc')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "${_pkgname}-git")
makedepends=(patchelf)
# All ELF files below are prebuilt and already stripped upstream
options=('!strip' '!debug')
# CUDA 12.8 runtime (cudart, cublas, nccl) is bundled from NVIDIA's
# official redist server: Arch 'cuda' is 13.x and no longer provides
# the .so.12 sonames these binaries were linked against.
source=(LICENSE-ai-dock-$pkgver::https://raw.githubusercontent.com/ai-dock/llama.cpp-cuda/$pkgver/LICENSE
        LICENSE-llama.cpp-$pkgver::https://raw.githubusercontent.com/ggml-org/llama.cpp/$pkgver/LICENSE)
source_x86_64=(llama.cpp-$pkgver-cuda-12.8-amd64.tar.gz::https://github.com/ai-dock/llama.cpp-cuda/releases/download/$pkgver/llama.cpp-$pkgver-cuda-12.8-amd64.tar.gz
               cuda_cudart-linux-x86_64-12.8.90-archive.tar.xz::https://developer.download.nvidia.com/compute/cuda/redist/cuda_cudart/linux-x86_64/cuda_cudart-linux-x86_64-12.8.90-archive.tar.xz
               libcublas-linux-x86_64-12.8.4.1-archive.tar.xz::https://developer.download.nvidia.com/compute/cuda/redist/libcublas/linux-x86_64/libcublas-linux-x86_64-12.8.4.1-archive.tar.xz
               nccl_2.26.2-1+cuda12.8_x86_64.txz::https://developer.download.nvidia.com/compute/redist/nccl/v2.26.2/nccl_2.26.2-1+cuda12.8_x86_64.txz)
source_aarch64=(llama.cpp-$pkgver-cuda-12.8-arm64.tar.gz::https://github.com/ai-dock/llama.cpp-cuda/releases/download/$pkgver/llama.cpp-$pkgver-cuda-12.8-arm64.tar.gz
                cuda_cudart-linux-sbsa-12.8.90-archive.tar.xz::https://developer.download.nvidia.com/compute/cuda/redist/cuda_cudart/linux-sbsa/cuda_cudart-linux-sbsa-12.8.90-archive.tar.xz
                libcublas-linux-sbsa-12.8.4.1-archive.tar.xz::https://developer.download.nvidia.com/compute/cuda/redist/libcublas/linux-sbsa/libcublas-linux-sbsa-12.8.4.1-archive.tar.xz
                nccl_2.26.2-1+cuda12.8_aarch64.txz::https://developer.download.nvidia.com/compute/redist/nccl/v2.26.2/nccl_2.26.2-1+cuda12.8_aarch64.txz)
sha256sums=('fe82a992d2a88e45746b062aea4d03912da24cde707446cef1f8fd08e38a05ad'
            '94f29bbed6a22c35b992c5c6ebf0e7c92f13b836b90f36f461c9cf2f0f1d010d')
sha256sums_x86_64=('3ccddfdc1f3ecdeaa879463a79ae02bf2f9ee48ab797fb850ff766ae0cb55c41'
                   '8d566b5fe745c46842dc16945cf36686227536decd2302c372be86da37faca68'
                   '21718957c2cf000bacd69d36c95708a2319199e39e056f8b4f0f68e3b9f323bb'
                   '669434a7a2e4f6f99d6969f0a4de7bf12a26d3873bbbd84f1a7bd05e1cd6e45e')
sha256sums_aarch64=('c6554e5e6c0c95b48dc8c401269a1f25bc8619a1a0a21acbd8bae144041bb313'
                    '9e54c6686b193efa9642e7f6609ce78b064c5d576946478bcff4c024e1acdea7'
                    '429803c0ea8aec1db0050f7bfd807d519e22c9bf223c19000d6018d930741028'
                    '250a1bb323df4565bf6936dbacf6c20022deaf841c41b3a5c38c7963a9665050')

package() {
    local _libdir="$pkgdir/usr/lib/$_pkgname"
    install -dm755 "$_libdir" "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses/$pkgname"

    cp -a "$srcdir"/cuda-12.8/. "$_libdir/"

    cp -a "$srcdir"/cuda_cudart-linux-*-archive/lib/libcudart.so.12* "$_libdir/"
    cp -a "$srcdir"/libcublas-linux-*-archive/lib/libcublas.so.12* "$_libdir/"
    cp -a "$srcdir"/libcublas-linux-*-archive/lib/libcublasLt.so.12* "$_libdir/"

    local _nccl_dir
    _nccl_dir=$(find "$srcdir" -maxdepth 1 -type d -name 'nccl_*' | head -1)
    cp -a "$_nccl_dir"/lib/libnccl.so.2* "$_libdir/"

    find "$_libdir" -maxdepth 1 -type f \( -perm -u+x -o -name '*.so*' \) \
        -exec patchelf --set-rpath '$ORIGIN' {} \;

    for _f in "$_libdir"/llama*; do
        [[ -f $_f && -x $_f ]] || continue
        ln -s /usr/lib/$_pkgname/"$(basename "$_f")" "$pkgdir/usr/bin/$(basename "$_f")"
    done

    cp "$srcdir"/LICENSE-ai-dock-$pkgver "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cp "$srcdir"/LICENSE-llama.cpp-$pkgver "$pkgdir/usr/share/licenses/$pkgname/LICENSE.llama.cpp"
    install -Dm644 "$srcdir"/cuda_cudart-linux-*-archive/LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.nvidia-cuda-eula"
    install -Dm644 "$_nccl_dir"/LICENSE.txt \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.nccl"
    cp "$srcdir"/LICENSE-llama.cpp-$pkgver "$pkgdir/usr/share/licenses/$pkgname/LICENSE.llama.cpp"
}
