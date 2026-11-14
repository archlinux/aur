# Maintainer: monsoon <29970829+monsoon235@users.noreply.github.com>
pkgname=llama.cpp-rocm-stable-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='llama.cpp official stable release prebuilt binaries with the ROCm backend'
arch=('x86_64')
url='https://github.com/ggml-org/llama.cpp'
license=('MIT')
# Upstream binaries link OpenSSL 3 (libssl.so.3); Arch's openssl is 4.x.
depends=('glibc' 'gcc-libs' 'openssl-3' 'hip-runtime-amd' 'hipblas' 'rocblas')
provides=('llama.cpp')
conflicts=('llama.cpp')
options=('!strip' '!debug')
# Upstream stable releases (vX.Y.Z) carry no binaries; their nightly-tag.txt asset
# names the build whose binaries make up the release.
_build=b12359
_rocmver=10.0
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ggml-org/llama.cpp/releases/download/${_build}/llama-${_build}-bin-ubuntu-rocm-${_rocmver}-x64.tar.gz")
sha256sums=('2d934c367e613ec67a5f78dffa450ee30bc3a6024f559b70c207896ee4bc9108')

package() {
    local upstream="$srcdir/llama-$_build" executable
    test -f "$upstream/LICENSE"
    test -x "$upstream/llama-cli"
    test -x "$upstream/llama-server"
    compgen -G "$upstream/libggml-hip.so*" >/dev/null

    # Keep executables, plugins, symlinks and accompanying resources together:
    # the upstream binaries and dynamically loaded backends use $ORIGIN.
    install -d "$pkgdir/usr/lib/llama.cpp-rocm-stable" "$pkgdir/usr/bin"
    cp -a "$upstream/." "$pkgdir/usr/lib/llama.cpp-rocm-stable/"
    install -Dm644 "$upstream/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    rm "$pkgdir/usr/lib/llama.cpp-rocm-stable/LICENSE"
    for executable in "$upstream"/llama-*; do
        [[ -f "$executable" && -x "$executable" && "$executable" != *.so* ]] || continue
        ln -s "../lib/llama.cpp-rocm-stable/${executable##*/}" "$pkgdir/usr/bin/${executable##*/}"
    done
}
