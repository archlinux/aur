# Maintainer: monsoon <29970829+monsoon235@users.noreply.github.com>
pkgname=stable-diffusion.cpp-rocm-bin
pkgver=master_1031_c6dfa9d
pkgrel=1
pkgdesc='stable-diffusion.cpp upstream Linux x86_64 prebuilt binaries with the ROCm backend'
arch=('x86_64')
url='https://github.com/leejet/stable-diffusion.cpp'
license=('MIT')
depends=('glibc' 'gcc-libs' 'hip-runtime-amd' 'hipblas' 'rocblas')
provides=('stable-diffusion.cpp')
conflicts=('stable-diffusion.cpp' 'stable-diffusion.cpp-git' 'stable-diffusion.cpp-vulkan-bin')
options=('!strip' '!debug')
_upstream_tag=master-1031-c6dfa9d
_commit=c6dfa9d
_rocm_version=10.1.0
source=("${pkgname}-${pkgver}.zip::https://github.com/leejet/stable-diffusion.cpp/releases/download/${_upstream_tag}/sd-master-${_commit}-bin-Linux-Ubuntu-24.04-x86_64-rocm-${_rocm_version}.zip")
sha256sums=('c6785c3c961a1ddb02fcddc6edbd42b6aad6b001ddc8c4b915f545da8151b495')

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
