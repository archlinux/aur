# Maintainer: Selene Bray-Hernandez <selebray1998@gmail.com>
# Maintainer: Aaron Liu
# Contributor: Zhirui Dai <daizhirui at hotmail dot com>

# Probe which ROCm version has a libtorch binary for the current pkgver.
# Tries the system version first, then known fallbacks.
_detect_rocm_ver() {
    local sysver=$(pacman -Q rocm-core 2>/dev/null | awk '{print $2}' | cut -d. -f1-2)
    for v in "$sysver" "7.2" "7.1" "6.2" "6.1" "6.0"; do
        [ -n "$v" ] || continue
        if curl -sfI --max-time 5 \
            "https://download.pytorch.org/libtorch/rocm$v/libtorch-shared-with-deps-${pkgver}%2Brocm$v.zip" \
            >/dev/null 2>&1; then
            echo "$v"
            return 0
        fi
    done
    echo "7.1"
}
_rocm_ver=$(_detect_rocm_ver)

pkgname=libtorch-rocm
pkgver=2.12.0
pkgrel=1
pkgdesc="PyTorch but C++ as an isolated folder, with ROCm included"
arch=('x86_64')
url='https://docs.pytorch.org/cppdocs/installing.html'
license=('BSD-3-Clause')
depends=(pybind11 rocm-core)
makedepends=(curl)
replaces=(libtorch-cxx11abi-rocm)
provides=("libtorch=${pkgver}")
conflicts=(libtorch)
# Use a filename without URL encoding to avoid extraction issues
source=("libtorch-shared-with-deps-${pkgver}+rocm${_rocm_ver}.zip::https://download.pytorch.org/libtorch/rocm${_rocm_ver}/libtorch-shared-with-deps-${pkgver}%2Brocm${_rocm_ver}.zip"
	"https://github.com/pytorch/pytorch/raw/refs/tags/v${pkgver}/LICENSE")
sha256sums=('SKIP'
            'SKIP')
options=('!debug' '!strip' '!libtool' '!staticlibs' '!zipman')

pkgver() {
    curl -sL https://api.github.com/repos/pytorch/pytorch/releases/latest |
        grep '"tag_name":' |
        sed 's/.*: "//;s/",//' |
        sed 's/^v//'
}

prepare() {
    # Remove bundled pybind11 headers as we use system pybind11
    rm -r libtorch/include/pybind11
}

package() {
    # Install to /opt/libtorch
    install -dm755 "${pkgdir}/opt"
    mv libtorch "${pkgdir}/opt/"
    
    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/libtorch/LICENSE"
}