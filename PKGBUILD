# Maintainer: uwuclxdy <uwuclxdy@pm.me>

pkgname=zluda-preview-bin
pkgver=7.preview.6
pkgrel=2
pkgdesc='CUDA on AMD GPUs (pre-release ZLUDA binary).'
arch=('x86_64')
url='https://github.com/vosen/ZLUDA'
license=('Apache-2.0 OR MIT')
depends=('gcc-libs' 'glibc' 'hip-runtime-amd' 'hipblaslt' 'miopen-hip' 'rocblas' 'rocm-smi-lib')
provides=('zluda')
conflicts=('zluda' 'zluda-git' 'nvidia-utils')
options=(!strip !debug)

_tag=v7-preview.6
_commit=dcc8b040

source=(
    "zluda-linux-${_commit}.tar.gz::https://github.com/vosen/ZLUDA/releases/download/${_tag}/zluda-linux-${_commit}.tar.gz"
    "LICENSE-MIT::https://raw.githubusercontent.com/vosen/ZLUDA/${_tag}/LICENSE-MIT"
)
sha256sums=('7c501f07036b1e27609ed3870ab3f831f66aa83c1ce818759e7b33c4bef931dc'
            '23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3')

package() {
    install -d -m755 "${pkgdir}/usr/lib"
    cp -dr --no-preserve=ownership zluda/lib*.so* zluda/zluda_ld "${pkgdir}/usr/lib/"

    install -dm755 "${pkgdir}/usr/lib/zluda"
    cp -dr --no-preserve=ownership zluda/trace zluda/trace_nvidia "${pkgdir}/usr/lib/zluda/"

    # Upstream writes these links relative to its own zluda/ dir. The real libraries land a
    # level higher than that here, so every target needs one more ../ to resolve.
    for _l in "${pkgdir}"/usr/lib/zluda/{trace,trace_nvidia}/*; do
        if [[ -L $_l ]]; then
            ln -sfn "../$(readlink "$_l")" "$_l"
        fi
    done

    install -Dm755 zluda/zluda_ld         "${pkgdir}/usr/bin/zluda_ld"
    install -Dm755 zluda/ptxas            "${pkgdir}/usr/bin/ptxas"
    install -Dm755 zluda/zluda_precompile "${pkgdir}/usr/bin/zluda_precompile"

    install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
