# Maintainer: cantosun99 <https://github.com/cantosun99>
pkgname=intel-deep-learning-essentials-bin
pkgver=2026.0.0.624
pkgrel=1
pkgdesc="Intel oneAPI Deep Learning Essentials – PyTorch/TensorFlow tools for Intel CPUs/GPUs (1.4GB download, ~6.4GB installed)"
arch=('x86_64')
url="https://www.intel.com/content/www/us/en/developer/tools/oneapi/deep-learning-essentials.html"
license=('LicenseRef-Intel-oneAPI')
depends=('gcc-libs' 'glibc' 'gcc')
options=('!strip' '!debug' '!emptydirs')
install=${pkgname}.install

source=("https://registrationcenter-download.intel.com/akdlm/IRC_NAS/8170208e-86db-4faa-a0d6-1ecf62699574/intel-deep-learning-essentials-${pkgver}_offline.sh")
sha256sums=('fa8620a1d648be2b44ba437c7bf1388524f4d0a6b665f685b08fa683473910f7')

prepare() {
    chmod +x "${srcdir}/intel-deep-learning-essentials-${pkgver}_offline.sh"
}

package() {
    mkdir -p "${pkgdir}/opt/intel/oneapi"

    "${srcdir}/intel-deep-learning-essentials-${pkgver}_offline.sh" \
        -a \
        --silent \
        --eula accept \
        --install-dir "${pkgdir}/opt/intel/oneapi" \
        --intel-sw-improvement-program-consent decline

    rm -f "${HOME}/.intel/intel-sw-install-history.json"

    install -Dm644 /dev/stdin \
        "${pkgdir}/etc/profile.d/intel-dl-essentials.sh" <<'PROFILE'
export ONEAPI_ROOT=/opt/intel/oneapi
# To activate: source /opt/intel/oneapi/setvars.sh
PROFILE
}
