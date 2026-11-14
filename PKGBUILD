# Maintainer: monsoon <29970829+monsoon235@users.noreply.github.com>
pkgname=llama.cpp-vulkan-stable-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='llama.cpp official stable release prebuilt binaries with the Vulkan backend'
arch=('x86_64')
url='https://github.com/ggml-org/llama.cpp'
license=('MIT')
# Vulkan loader is the system interface; users provide a Vulkan ICD for their GPU.
# Upstream binaries link OpenSSL 3 (libssl.so.3); Arch's openssl is 4.x.
depends=('glibc' 'gcc-libs' 'openssl-3' 'vulkan-icd-loader')
provides=('llama.cpp')
conflicts=('llama.cpp')
options=('!strip' '!debug')
# Upstream stable releases (vX.Y.Z) carry no binaries; their nightly-tag.txt asset
# names the build whose binaries make up the release.
_build=b12359
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ggml-org/llama.cpp/releases/download/${_build}/llama-${_build}-bin-ubuntu-vulkan-x64.tar.gz")
sha256sums=('19b60f00395a3f4954e46a5037695bc1d843404fc9d3124f82a612ecd8fbe9f0')

package() {
    local upstream="$srcdir/llama-$_build" executable
    test -f "$upstream/LICENSE"
    test -x "$upstream/llama-cli"
    test -x "$upstream/llama-server"
    compgen -G "$upstream/libggml-vulkan.so*" >/dev/null

    # Keep executables, plugins, symlinks and accompanying resources together:
    # the upstream binaries and dynamically loaded backends use $ORIGIN.
    install -d "$pkgdir/usr/lib/llama.cpp-vulkan-stable" "$pkgdir/usr/bin"
    cp -a "$upstream/." "$pkgdir/usr/lib/llama.cpp-vulkan-stable/"
    install -Dm644 "$upstream/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    rm "$pkgdir/usr/lib/llama.cpp-vulkan-stable/LICENSE"
    for executable in "$upstream"/llama-*; do
        [[ -f "$executable" && -x "$executable" && "$executable" != *.so* ]] || continue
        ln -s "../lib/llama.cpp-vulkan-stable/${executable##*/}" "$pkgdir/usr/bin/${executable##*/}"
    done
}
