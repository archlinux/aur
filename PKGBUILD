# Maintainer: monsoon <29970829+monsoon235@users.noreply.github.com>
pkgname=llama.cpp-rocm-bin
pkgver=b11433
pkgrel=1
pkgdesc='llama.cpp upstream prebuilt binaries with the ROCm backend'
arch=('x86_64')
url='https://github.com/ggml-org/llama.cpp'
license=('MIT')
# Initial dependency candidates. Confirm with scripts/docker-check.sh before publishing.
depends=('glibc' 'gcc-libs' 'openssl' 'hip-runtime-amd' 'hipblas' 'rocblas')
provides=('llama.cpp')
conflicts=('llama.cpp')
options=('!strip' '!debug')
_rocmver=10.0
source=("https://github.com/ggml-org/llama.cpp/releases/download/${pkgver}/llama-${pkgver}-bin-ubuntu-rocm-${_rocmver}-x64.tar.gz")
sha256sums=('3d7028e9bb43887ff01fd34d43356baf8bdddeb0c822843781b16d311d3e5147')

package() {
    local upstream="$srcdir/llama-$pkgver" executable
    test -f "$upstream/LICENSE"
    test -x "$upstream/llama-cli"
    test -x "$upstream/llama-server"
    compgen -G "$upstream/libggml-hip.so*" >/dev/null

    # Keep executables, plugins, symlinks and accompanying resources together:
    # the upstream binaries and dynamically loaded backends use $ORIGIN.
    install -d "$pkgdir/usr/lib/llama.cpp-rocm" "$pkgdir/usr/bin"
    cp -a "$upstream/." "$pkgdir/usr/lib/llama.cpp-rocm/"
    install -Dm644 "$upstream/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    rm "$pkgdir/usr/lib/llama.cpp-rocm/LICENSE"
    for executable in "$upstream"/llama-*; do
        [[ -f "$executable" && -x "$executable" && "$executable" != *.so* ]] || continue
        ln -s "../lib/llama.cpp-rocm/${executable##*/}" "$pkgdir/usr/bin/${executable##*/}"
    done
}
