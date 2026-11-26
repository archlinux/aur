# Maintainer: monsoon <29970829+monsoon235@users.noreply.github.com>
pkgname=stable-diffusion.cpp-rocm-bin
pkgver=master_1133_52491bd
pkgrel=1
pkgdesc='stable-diffusion.cpp upstream Linux x86_64 prebuilt binaries with the ROCm backend'
arch=('x86_64')
url='https://github.com/leejet/stable-diffusion.cpp'
license=('MIT')
depends=('glibc' 'gcc-libs' 'hip-runtime-amd' 'hipblas' 'hipblaslt' 'rocblas')
provides=('stable-diffusion.cpp')
conflicts=('stable-diffusion.cpp' 'stable-diffusion.cpp-git' 'stable-diffusion.cpp-vulkan-bin')
options=('!strip' '!debug')
_upstream_tag=master-1133-52491bd
_commit=52491bd
_rocm_version=10.1.0
source=("${pkgname}-${pkgver}.zip::https://github.com/leejet/stable-diffusion.cpp/releases/download/${_upstream_tag}/sd-master-${_commit}-bin-Linux-Ubuntu-24.04-x86_64-rocm-${_rocm_version}.zip")
sha256sums=('52d034fdf9778635f5d8ab454efb719d48b9d7f10c5df292c915734894c11cec')

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
