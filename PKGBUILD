# Maintainer: cantosun99 <privat at cantosun dot de>
pkgname=intel-deep-learning-essentials
pkgver=2026.0.0
pkgrel=3
pkgdesc="Intel® Deep Learning Essentials + Intel® Deep Neural Network Library - Intel® oneAPI DPC++/C++ Compiler, Intel® oneAPI DPC++ Library (oneDPL), Intel® oneAPI Math Kernel Library (oneMKL), Intel® oneAPI Collective Communications Library (oneCCL), Intel® Deep Neural Network Library (oneDNN)"
arch=('x86_64')
url="https://www.intel.com/content/www/us/en/developer/tools/oneapi/oneapi-toolkit-download.html"
license=('custom')
options=('!strip' 'staticlibs')
source=(
    'intel-deep-learning-essentials-2026.0.0.624_offline.sh::https://registrationcenter-download.intel.com/akdlm/IRC_NAS/8170208e-86db-4faa-a0d6-1ecf62699574/intel-deep-learning-essentials-2026.0.0.624_offline.sh'
    'intel-onednn-2026.0.0.689_offline.sh::https://registrationcenter-download.intel.com/akdlm/IRC_NAS/964163c0-9651-4e14-8ebf-3cc27e2519e4/intel-onednn-2026.0.0.689_offline.sh'
)
noextract=(
    'intel-deep-learning-essentials-2026.0.0.624_offline.sh'
    'intel-onednn-2026.0.0.689_offline.sh'
)
sha384sums=(
    '04e1b3392cb01e2f50fbe4ef985686902158af0c232e3990d1955ee2cd67ade8c70ba24f604b45d4f513c3050ecf93d5'
    '29cd895492bdde32b83611f21e85b06085b15604cd26eb45aa4692c0e1d8a57d34cf2c447d3a07559d46f14c3afc27bf'
)

package() {
    # Must run without fakeroot env so --install-dir is respected by the installer
    local _real_user="${SUDO_USER:-$USER}"

    env -i HOME="/home/${_real_user}" \
           USER="${_real_user}" \
           PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" \
    sh "${srcdir}/intel-deep-learning-essentials-2026.0.0.624_offline.sh" \
        -a --silent --eula accept \
        --install-dir "${pkgdir}/opt/intel/oneapi" \
        --log-dir "${srcdir}/"

    env -i HOME="/home/${_real_user}" \
           USER="${_real_user}" \
           PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" \
    sh "${srcdir}/intel-onednn-2026.0.0.689_offline.sh" \
        -a --silent --eula accept \
        --install-dir "${pkgdir}/opt/intel/oneapi" \
        --log-dir "${srcdir}/"

    # Clean up logs that contain references to $srcdir and $pkgdir
    rm -rf "${pkgdir}/opt/intel/oneapi/logs"

    # Register compiler lib dir with the system linker
    install -d "${pkgdir}/etc/ld.so.conf.d"
    echo '/opt/intel/oneapi/compiler/2026.0/lib' \
        > "${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf"
}
