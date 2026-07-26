# Maintainer: cantosun99 <privat at cantosun dot de>
pkgname=intel-deep-learning-essentials
pkgver=2026.1.2
pkgrel=1
pkgdesc="Intel® Deep Learning Essentials + Intel® Deep Neural Network Library - Intel® oneAPI DPC++/C++ Compiler, Intel® oneAPI DPC++ Library, Intel® oneAPI Math Kernel Library, Intel® oneAPI Collective Communications Library, Intel® Deep Neural Network Library"
arch=('x86_64')
url="https://www.intel.com/content/www/us/en/developer/tools/oneapi/oneapi-toolkit-download.html"
license=('custom')
provides=(
    'intel-oneapi-dpcpp-cpp'
    'intel-oneapi-mkl'
    'intel-oneapi-mkl-sycl'
    'intel-pti'
    'oneccl'
    'onednn'
)
conflicts=(
    'intel-oneapi-toolkit'
    'intel-oneapi-basekit-2025'
    'intel-oneapi-hpckit'
    'intel-oneapi-dpcpp-cpp'
    'intel-oneapi-mkl'
    'intel-oneapi-mkl-sycl'
    'intel-pti'
    'oneccl'
    'onednn'
)
options=('!strip' 'staticlibs')
source=(
    'https://registrationcenter-download.intel.com/akdlm/IRC_NAS/c109e1ae-e02c-48a6-917b-b03b90d33f77/intel-deep-learning-essentials-2026.1.2.25_offline.sh'
    'https://registrationcenter-download.intel.com/akdlm/IRC_NAS/0451dc19-00a2-4236-bace-dc0b4aec0680/intel-onednn-2026.0.1.64_offline.sh'
)
noextract=(
    'intel-deep-learning-essentials-2026.1.2.25_offline.sh'
    'intel-onednn-2026.0.1.64_offline.sh'
)
sha384sums=(
    '71bef416ccab3d73e6768cbe2e82e08bb97b6ace61bbcb437369901c26872be583ff571225d648b7fa82e63ff31994d2'
    '7e59c0bfa76eb66290a10f533cbcc3e13a92cc28882e9d674a757a840803f51932137be689e5d72bd3c4835d701520f7'
)

package() {
    # Must run without fakeroot env so --install-dir is respected by the installer
    local _real_user="${SUDO_USER:-$USER}"

    env -i HOME="/home/${_real_user}" \
           USER="${_real_user}" \
           PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" \
    sh "${srcdir}/intel-deep-learning-essentials-2026.1.2.25_offline.sh" \
        -a --silent --eula accept \
        --install-dir "${pkgdir}/opt/intel/oneapi" \
        --log-dir "${srcdir}/"

    env -i HOME="/home/${_real_user}" \
           USER="${_real_user}" \
           PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" \
    sh "${srcdir}/intel-onednn-2026.0.1.64_offline.sh" \
        -a --silent --eula accept \
        --install-dir "${pkgdir}/opt/intel/oneapi" \
        --log-dir "${srcdir}/"

    # Clean up logs that contain references to $srcdir and $pkgdir
    rm -rf "${pkgdir}/opt/intel/oneapi/logs"

    # Register compiler lib dir with the system linker
    install -d "${pkgdir}/etc/ld.so.conf.d"
    echo '/opt/intel/oneapi/compiler/2026.1/lib' \
        > "${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf"
}
