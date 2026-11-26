# Maintainer: monsoon <29970829+monsoon235@users.noreply.github.com>
pkgname=llama.cpp-cuda-bin
pkgver=b12752
pkgrel=1
pkgdesc='llama.cpp upstream prebuilt binaries with the CUDA backend'
arch=('x86_64')
url='https://github.com/ggml-org/llama.cpp'
license=('MIT')
# Upstream binaries link OpenSSL 3 (libssl.so.3), while Arch's openssl is 4.x.
# cuda provides libcudart/libcublas/libcublasLt 13; nvidia-utils provides the driver library libcuda.so.1.
depends=('glibc' 'gcc-libs' 'openssl-3' 'cuda' 'nvidia-utils')
provides=('llama.cpp')
conflicts=('llama.cpp')
options=('!strip' '!debug')
_cudaver=13.5
source=("https://github.com/ggml-org/llama.cpp/releases/download/${pkgver}/llama-${pkgver}-bin-ubuntu-cuda-${_cudaver}-x64.tar.gz")
sha256sums=('d881ef335ac3e8c5013489dc77a396f3d4bae5109bccc4dbde83aa0662f406f6')

package() {
    local upstream="$srcdir/llama-$pkgver" executable
    test -f "$upstream/LICENSE"
    test -x "$upstream/llama-cli"
    test -x "$upstream/llama-server"
    compgen -G "$upstream/libggml-cuda.so*" >/dev/null

    # Keep executables, plugins, symlinks and accompanying resources together:
    # the upstream binaries and dynamically loaded backends use $ORIGIN.
    install -d "$pkgdir/usr/lib/llama.cpp-cuda" "$pkgdir/usr/bin"
    cp -a "$upstream/." "$pkgdir/usr/lib/llama.cpp-cuda/"
    install -Dm644 "$upstream/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    rm "$pkgdir/usr/lib/llama.cpp-cuda/LICENSE"
    for executable in "$upstream"/llama-*; do
        [[ -f "$executable" && -x "$executable" && "$executable" != *.so* ]] || continue
        ln -s "../lib/llama.cpp-cuda/${executable##*/}" "$pkgdir/usr/bin/${executable##*/}"
    done
}
