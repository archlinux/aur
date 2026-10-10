# Maintainer: monsoon <29970829+monsoon235@users.noreply.github.com>
pkgname=llama.cpp-vulkan-bin
pkgver=b11552
pkgrel=1
pkgdesc='llama.cpp upstream prebuilt binaries with the Vulkan backend'
arch=('x86_64')
url='https://github.com/ggml-org/llama.cpp'
license=('MIT')
# Vulkan loader is the system interface; users provide a Vulkan ICD for their GPU.
depends=('glibc' 'gcc-libs' 'openssl' 'vulkan-icd-loader')
provides=('llama.cpp')
conflicts=('llama.cpp')
options=('!strip' '!debug')
source=("https://github.com/ggml-org/llama.cpp/releases/download/${pkgver}/llama-${pkgver}-bin-ubuntu-vulkan-x64.tar.gz")
sha256sums=('c7bb933f3584b73296fbadea6e0d6273ddb7907699ec59ef08d0bb59e0a8b997')

package() {
    local upstream="$srcdir/llama-$pkgver" executable
    test -f "$upstream/LICENSE"
    test -x "$upstream/llama-cli"
    test -x "$upstream/llama-server"
    compgen -G "$upstream/libggml-vulkan.so*" >/dev/null

    # Keep executables, plugins, symlinks and accompanying resources together:
    # the upstream binaries and dynamically loaded backends use $ORIGIN.
    install -d "$pkgdir/usr/lib/llama.cpp-vulkan" "$pkgdir/usr/bin"
    cp -a "$upstream/." "$pkgdir/usr/lib/llama.cpp-vulkan/"
    install -Dm644 "$upstream/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    rm "$pkgdir/usr/lib/llama.cpp-vulkan/LICENSE"
    for executable in "$upstream"/llama-*; do
        [[ -f "$executable" && -x "$executable" && "$executable" != *.so* ]] || continue
        ln -s "../lib/llama.cpp-vulkan/${executable##*/}" "$pkgdir/usr/bin/${executable##*/}"
    done
}
