# Maintainer: cantosun99 <privat at cantosun dot de>
pkgname=intel-deep-learning-essentials
pkgver=2026.2.0
pkgrel=1
pkgdesc="Intel® Deep Learning Essentials + Intel® Deep Neural Network Library - Intel® oneAPI DPC++/C++ Compiler, Intel® oneAPI DPC++ Library, Intel® oneAPI Math Kernel Library, Intel® oneAPI Collective Communications Library, Intel® Deep Neural Network Library"
arch=('x86_64')
url="https://www.intel.com/content/www/us/en/developer/tools/oneapi/oneapi-toolkit-download.html"
license=('custom')
provides=(
    'intel-oneapi-common'
    'intel-oneapi-dpcpp-cpp'
    'intel-oneapi-mkl'
    'intel-oneapi-mkl-sycl'
    'intel-oneapi-openmp'
    'intel-oneapi-tbb'
    'intel-oneapi-tcm'
    'intel-oneapi-umf'
    'intel-pti'
    'oneccl'
    'onednn'
)
conflicts=(
    'intel-oneapi-toolkit'
    'intel-oneapi-basekit-2025'
    'intel-oneapi-hpckit'
    'intel-oneapi-common'
    'intel-oneapi-dpcpp-cpp'
    'intel-oneapi-mkl'
    'intel-oneapi-mkl-sycl'
    'intel-oneapi-openmp'
    'intel-oneapi-tbb'
    'intel-oneapi-tcm'
    'intel-oneapi-umf'
    'intel-pti'
    'oneccl'
    'onednn'
)
options=('!strip' 'staticlibs')
source=(
    'https://registrationcenter-download.intel.com/akdlm/IRC_NAS/aef232d2-aac5-4cd6-bceb-911019bbb6a8/intel-deep-learning-essentials-2026.2.0.640_offline.sh'
    'https://registrationcenter-download.intel.com/akdlm/IRC_NAS/46452a4a-7b7f-49f2-be4c-602a900180bb/intel-onednn-2026.1.0.625_offline.sh'
)
noextract=(
    'intel-deep-learning-essentials-2026.2.0.640_offline.sh'
    'intel-onednn-2026.1.0.625_offline.sh'
)
sha384sums=(
    '612706088f1c816224af1ca9750dbf4eb16006c81e7a0aac82e2cd0f489efcc2ee554dc298bed9eaff35970237188900'
    '6bcbb2d013c87a91b2300e75f125613f2f4cff82a4ef45cfd3b3d1e79b43d089b910fcdc59ba942b65c675fcced4d9fc'
)

package() {
    # Show warning during makepkg build time
    echo "==========================================================================="
    echo " NOTE: The installer may output a few error messages during installation."
    echo " This is because Intel intended the oneAPI packages for Windows and Ubuntu,"
    echo " not Arch Linux. Please just let it run and ignore these non-fatal errors."
    echo " "
    echo " If the install fails, 99% of the time you need to delete the two folders"
    echo " intel and .intel in your /home directory."
    echo " You can use the following command:"
    echo " rm -rf "$HOME/intel" "$HOME/.intel""
    echo " "
    echo " If you encounter further issues, please refer to:"
    echo " https://codeberg.org/cantosun/intel-deep-learning-essentials"
    echo "==========================================================================="

    # Must run without fakeroot env so --install-dir is respected by the installer
    local _real_user="${SUDO_USER:-$USER}"

    env -i HOME="/home/${_real_user}" \
           USER="${_real_user}" \
           PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" \
    sh "${srcdir}/intel-deep-learning-essentials-2026.2.0.640_offline.sh" \
        -a --silent --eula accept \
        --install-dir "${pkgdir}/opt/intel/oneapi" \
        --log-dir "${srcdir}/"

    env -i HOME="/home/${_real_user}" \
           USER="${_real_user}" \
           PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" \
    sh "${srcdir}/intel-onednn-2026.1.0.625_offline.sh" \
        -a --silent --eula accept \
        --install-dir "${pkgdir}/opt/intel/oneapi" \
        --log-dir "${srcdir}/"

    # Clean up logs that contain references to $srcdir and $pkgdir
    rm -rf "${pkgdir}/opt/intel/oneapi/logs"

    # Register compiler lib dir with the system linker
    install -d "${pkgdir}/etc/ld.so.conf.d"
    for _comp in compiler mkl tbb dnnl ccl umf tcm; do
        echo "/opt/intel/oneapi/${_comp}/latest/lib"
    done > "${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf"
}
