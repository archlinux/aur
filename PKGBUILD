# Maintainer: monsoon <29970829+monsoon235@users.noreply.github.com>
pkgname=llama.cpp-cuda-stable-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='llama.cpp official stable release prebuilt binaries with the CUDA backend'
arch=('x86_64')
url='https://github.com/ggml-org/llama.cpp'
license=('MIT')
# Upstream binaries link OpenSSL 3 (libssl.so.3), while Arch's openssl is 4.x.
# cuda provides libcudart/libcublas/libcublasLt 13; nvidia-utils provides the driver library libcuda.so.1.
depends=('glibc' 'gcc-libs' 'openssl-3' 'cuda' 'nvidia-utils')
provides=('llama.cpp')
conflicts=('llama.cpp')
options=('!strip' '!debug')
# Upstream stable releases (vX.Y.Z) carry no binaries; their nightly-tag.txt asset
# names the build whose binaries make up the release.
_build=b12359
_cudaver=13.5
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ggml-org/llama.cpp/releases/download/${_build}/llama-${_build}-bin-ubuntu-cuda-${_cudaver}-x64.tar.gz")
sha256sums=('9440f417615bed0e191acef03bff0249117d2be74335358265a6d28475a9baf0')

package() {
    local upstream="$srcdir/llama-$_build" executable
    test -f "$upstream/LICENSE"
    test -x "$upstream/llama-cli"
    test -x "$upstream/llama-server"
    compgen -G "$upstream/libggml-cuda.so*" >/dev/null

    # Keep executables, plugins, symlinks and accompanying resources together:
    # the upstream binaries and dynamically loaded backends use $ORIGIN.
    install -d "$pkgdir/usr/lib/llama.cpp-cuda-stable" "$pkgdir/usr/bin"
    cp -a "$upstream/." "$pkgdir/usr/lib/llama.cpp-cuda-stable/"
    install -Dm644 "$upstream/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    rm "$pkgdir/usr/lib/llama.cpp-cuda-stable/LICENSE"
    for executable in "$upstream"/llama-*; do
        [[ -f "$executable" && -x "$executable" && "$executable" != *.so* ]] || continue
        ln -s "../lib/llama.cpp-cuda-stable/${executable##*/}" "$pkgdir/usr/bin/${executable##*/}"
    done
}
