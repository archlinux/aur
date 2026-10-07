# Maintainer: monsoon <29970829+monsoon235@users.noreply.github.com>
pkgname=llama.cpp-openvino-bin
pkgver=b11460
pkgrel=1
pkgdesc='llama.cpp upstream prebuilt binaries with the OpenVINO backend'
arch=('x86_64')
url='https://github.com/ggml-org/llama.cpp'
license=('MIT')
depends=('glibc' 'gcc-libs' 'openssl' 'level-zero-loader' 'intel-npu-driver')
optdepends=('intel-compute-runtime: Intel GPU inference')
provides=('llama.cpp')
conflicts=('llama.cpp' 'llama.cpp-rocm-bin' 'llama.cpp-sycl-bin' 'llama.cpp-sycl' 'llama.cpp-openvino')
options=('!strip' '!debug')
_openvinover=2026.4.1
source=("https://github.com/ggml-org/llama.cpp/releases/download/${pkgver}/llama-${pkgver}-bin-ubuntu-openvino-${_openvinover}-x64.tar.gz")
sha256sums=('d503b0c60454fd02c14614c1803c10cad15192e7cabbe8ee7d7e630ae887f09f')

package() {
    local upstream="$srcdir/llama-$pkgver" executable
    test -f "$upstream/LICENSE"
    test -x "$upstream/llama-cli"
    test -x "$upstream/llama-server"
    compgen -G "$upstream/libggml-openvino.so*" >/dev/null
    compgen -G "$upstream/libopenvino_intel_npu_plugin.so" >/dev/null

    # Keep the upstream executables and backend libraries together for $ORIGIN lookups.
    install -d "$pkgdir/usr/lib/llama.cpp-openvino" "$pkgdir/usr/bin"
    cp -a "$upstream/." "$pkgdir/usr/lib/llama.cpp-openvino/"
    install -Dm644 "$upstream/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    rm "$pkgdir/usr/lib/llama.cpp-openvino/LICENSE"
    for executable in "$upstream"/llama-*; do
        [[ -f "$executable" && -x "$executable" && "$executable" != *.so* ]] || continue
        ln -s "../lib/llama.cpp-openvino/${executable##*/}" "$pkgdir/usr/bin/${executable##*/}"
    done
}
