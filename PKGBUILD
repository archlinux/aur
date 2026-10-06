# Maintainer: monsoon <29970829+monsoon235@users.noreply.github.com>
pkgname=stable-diffusion.cpp-rocm-bin
pkgver=master_929_3f8527a
pkgrel=1
pkgdesc='stable-diffusion.cpp upstream Linux x86_64 prebuilt binaries with the ROCm backend'
arch=('x86_64')
url='https://github.com/leejet/stable-diffusion.cpp'
license=('MIT')
depends=('glibc' 'gcc-libs' 'hip-runtime-amd' 'hipblas' 'rocblas')
provides=('stable-diffusion.cpp')
conflicts=('stable-diffusion.cpp' 'stable-diffusion.cpp-git' 'stable-diffusion.cpp-vulkan-bin')
options=('!strip' '!debug')
_upstream_tag=master-929-3f8527a
_commit=3f8527a
_rocm_version=7.14.0
source=("${pkgname}-${pkgver}.zip::https://github.com/leejet/stable-diffusion.cpp/releases/download/${_upstream_tag}/sd-master-${_commit}-bin-Linux-Ubuntu-24.04-x86_64-rocm-${_rocm_version}.zip")
sha256sums=('b4877986cc25cc04decc073874eed5ea411fc0bb19f5338f0ea3511a8e8b1c58')

package() {
    local upstream="$srcdir/build/bin" executable license_file
    test -x "$upstream/sd-cli"
    test -x "$upstream/sd-server"
    test -f "$upstream/libggml-hip.so"
    test -f "$upstream/stable-diffusion.cpp.txt"
    test -f "$upstream/ggml.txt"

    install -d "$pkgdir/usr/lib/$pkgname" "$pkgdir/usr/bin"
    cp -a "$upstream/." "$pkgdir/usr/lib/$pkgname/"
    for license_file in "$pkgdir/usr/lib/$pkgname"/*.txt; do
        [[ -f "$license_file" ]] || continue
        install -Dm644 "$license_file" "$pkgdir/usr/share/licenses/$pkgname/${license_file##*/}"
        rm "$license_file"
    done
    for executable in sd-cli sd-server; do
        ln -s "../lib/$pkgname/$executable" "$pkgdir/usr/bin/$executable"
    done
}
