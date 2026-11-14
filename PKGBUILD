# Maintainer: monsoon <29970829+monsoon235@users.noreply.github.com>
pkgname=llama.cpp-openvino-stable-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='llama.cpp official stable release prebuilt binaries with the OpenVINO backend'
arch=('x86_64')
url='https://github.com/ggml-org/llama.cpp'
license=('MIT')
depends=('glibc' 'gcc-libs' 'openssl-3' 'level-zero-loader' 'intel-compute-runtime')
optdepends=('intel-npu-driver: Intel NPU inference')
provides=('llama.cpp')
conflicts=('llama.cpp' 'llama.cpp-rocm-bin' 'llama.cpp-sycl-bin' 'llama.cpp-sycl' 'llama.cpp-openvino' 'llama.cpp-openvino-bin')
options=('!strip' '!debug')
_openvinover=2026.4.1
# Upstream stable releases (vX.Y.Z) carry no binaries; their nightly-tag.txt asset
# names the build whose binaries make up the release.
_build=b12359
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ggml-org/llama.cpp/releases/download/${_build}/llama-${_build}-bin-ubuntu-openvino-${_openvinover}-x64.tar.gz")
sha256sums=('1db62f87b293588eb34724e074bd298819ea0a176d96c9af4f5b4e3129cf40e6')

package() {
    local upstream="$srcdir/llama-$_build" executable
    test -f "$upstream/LICENSE"
    test -x "$upstream/llama-cli"
    test -x "$upstream/llama-server"
    compgen -G "$upstream/libggml-openvino.so*" >/dev/null
    compgen -G "$upstream/libopenvino_intel_npu_plugin.so" >/dev/null

    # Keep the upstream executables and backend libraries together for $ORIGIN lookups.
    install -d "$pkgdir/usr/lib/llama.cpp-openvino-stable" "$pkgdir/usr/bin"
    cp -a "$upstream/." "$pkgdir/usr/lib/llama.cpp-openvino-stable/"
    install -Dm644 "$upstream/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    rm "$pkgdir/usr/lib/llama.cpp-openvino-stable/LICENSE"
    for executable in "$upstream"/llama-*; do
        [[ -f "$executable" && -x "$executable" && "$executable" != *.so* ]] || continue
        ln -s "../lib/llama.cpp-openvino-stable/${executable##*/}" "$pkgdir/usr/bin/${executable##*/}"
    done
}
