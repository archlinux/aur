# Maintainer: monsoon <29970829+monsoon235@users.noreply.github.com>
pkgname=stable-diffusion.cpp-vulkan-bin
pkgver=master_929_3f8527a
pkgrel=1
pkgdesc='stable-diffusion.cpp upstream Linux x86_64 prebuilt binaries with the Vulkan backend'
arch=('x86_64')
url='https://github.com/leejet/stable-diffusion.cpp'
license=('MIT')
depends=('glibc' 'gcc-libs' 'vulkan-icd-loader')
provides=('stable-diffusion.cpp')
conflicts=('stable-diffusion.cpp' 'stable-diffusion.cpp-git' 'stable-diffusion.cpp-rocm-bin')
options=('!strip' '!debug')
_upstream_tag=master-929-3f8527a
_commit=3f8527a
source=("${pkgname}-${pkgver}.zip::https://github.com/leejet/stable-diffusion.cpp/releases/download/${_upstream_tag}/sd-master-${_commit}-bin-Linux-Ubuntu-24.04-x86_64-vulkan.zip")
sha256sums=('e35cc73cf5ba9637d1dc1d717760e7b8428376a4905d57e72ec8c871864f62c7')

package() {
    local upstream="$srcdir" executable license_file
    test -x "$upstream/sd-cli"
    test -x "$upstream/sd-server"
    test -f "$upstream/libggml-vulkan.so"
    test -f "$upstream/stable-diffusion.cpp.txt"
    test -f "$upstream/ggml.txt"

    install -d "$pkgdir/usr/lib/$pkgname" "$pkgdir/usr/bin"
    cp -a "$upstream/." "$pkgdir/usr/lib/$pkgname/"
    rm -f "$pkgdir/usr/lib/$pkgname/${pkgname}-${pkgver}.zip"
    for license_file in "$pkgdir/usr/lib/$pkgname"/*.txt; do
        [[ -f "$license_file" ]] || continue
        install -Dm644 "$license_file" "$pkgdir/usr/share/licenses/$pkgname/${license_file##*/}"
        rm "$license_file"
    done
    for executable in sd-cli sd-server; do
        ln -s "../lib/$pkgname/$executable" "$pkgdir/usr/bin/$executable"
    done
}
