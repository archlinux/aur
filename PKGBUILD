# Maintainer: cantosun99 <privat at cantosun dot de>
pkgname=intel-deep-learning-essentials
pkgver=2026.1.0
pkgrel=1
pkgdesc="Intel® Deep Learning Essentials + Intel® Deep Neural Network Library - Intel® oneAPI DPC++/C++ Compiler, Intel® oneAPI DPC++ Library, Intel® oneAPI Math Kernel Library, Intel® oneAPI Collective Communications Library, Intel® Deep Neural Network Library"
arch=('x86_64')
url="https://www.intel.com/content/www/us/en/developer/tools/oneapi/oneapi-toolkit-download.html"
license=('custom')
conflicts=(
    'intel-oneapi-toolkit'
    'intel-oneapi-basekit-2025'
)
options=('!strip' 'staticlibs')
source=(
    'intel-deep-learning-essentials-2026.1.0.197_offline.sh::https://registrationcenter-download.intel.com/akdlm/IRC_NAS/185b3f71-836d-43fa-8afa-bd6bf08b3441/intel-deep-learning-essentials-2026.1.0.197_offline.sh'
    'intel-onednn-2026.0.1.64_offline.sh::https://registrationcenter-download.intel.com/akdlm/IRC_NAS/0451dc19-00a2-4236-bace-dc0b4aec0680/intel-onednn-2026.0.1.64_offline.sh'
)
noextract=(
    'intel-deep-learning-essentials-2026.1.0.197_offline.sh'
    'intel-onednn-2026.0.1.64_offline.sh'
)
sha384sums=(
    '77f06a42762ce161165f99dac02de95966b271bf545c4d989f5627b964d368181ca3bdd67c4443005c763784092d4686'
    '7e59c0bfa76eb66290a10f533cbcc3e13a92cc28882e9d674a757a840803f51932137be689e5d72bd3c4835d701520f7'
)

package() {
    # Must run without fakeroot env so --install-dir is respected by the installer
    local _real_user="${SUDO_USER:-$USER}"

    env -i HOME="/home/${_real_user}" \
           USER="${_real_user}" \
           PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" \
    sh "${srcdir}/intel-deep-learning-essentials-2026.1.0.197_offline.sh" \
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
