# Maintainer: Yingchang Liu <yingchangliu at outlook dot com>
# Modified from the intel-oneapi-basekit package in the official repository.
pkgname=intel-oneapi-hpckit
_major_ver=2025
_minor_ver=0
_patch_ver=1
pkgver=$_major_ver.$_minor_ver.$_patch_ver
# https://www.intel.com/content/www/us/en/developer/tools/oneapi/base-toolkit-download.html?operatingsystem=linux&distributions=offline&version=2024.2.0
# https://www.intel.com/content/www/us/en/developer/tools/oneapi/hpc-toolkit-download.html?operatingsystem=linux&distributions=offline&version=2024.2.0
pkgver_base=$pkgver.46
pkgver_hpc=$pkgver.47
_urlver_base=dfc4a434-838c-4450-a6fe-2fa903b75aa7
_urlver_hpc=b7f71cf2-8157-4393-abae-8cea815509f7
pkgrel=1
pkgdesc="Intel oneAPI Base and HPC Toolkit for Linux"
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=('custom:EULA')
source=("https://registrationcenter-download.intel.com/akdlm/IRC_NAS/${_urlver_base}/intel-oneapi-base-toolkit-${pkgver_base}_offline.sh"
        "https://registrationcenter-download.intel.com/akdlm/IRC_NAS/${_urlver_hpc}/intel-oneapi-hpc-toolkit-${pkgver_hpc}_offline.sh")
# source=("https://registrationcenter-download.intel.com/akdlm/IRC_NAS/${_urlver_base}/l_BaseKit_p_${pkgver_base}_offline.sh"
#         "https://registrationcenter-download.intel.com/akdlm/IRC_NAS/${_urlver_hpc}/l_HPCKit_p_${pkgver_hpc}_offline.sh")
sha384sums=('8f315562c26104eea7790e1fba868d63562f0fd1888623f0f4a286a234ec799beefefe78ffa904bd71dc6b8fb479df79'
            'be217e7242c19d23698bf3055ecd992e9e1a469a8e23dc9de62767d985171c311db130c46f6cf979299e428c8c7c6f37')
depends=(level-zero-loader)
options=(!strip staticlibs)
install="$pkgname.install"
noextract=("intel-oneapi-base-toolkit-${pkgver_base}_offline.sh"
           "intel-oneapi-hpc-toolkit-${pkgver_hpc}_offline.sh")
optdepends=('libnotify: VTune GUI'
            'glib2: VTune GUI'
            'gtk3: VTune GUI'
            'at-spi2-atk: VTune GUI'
            'libdrm: VTune GUI'
            'libxcb: VTune GUI'
            'xdg-utils: VTune GUI'
            'nss: Advisor GUI')
provides=('intel-oneapi-mkl' 'intel-oneapi-dnnl' 'intel-oneapi-tbb' 'intel-oneapi-dpl'
          'intel-oneapi-ccl' 'intel-oneapi-dpcpp-cpp-compiler' 'intel-oneapi-dal'
          'intel-oneapi-compiler-shared-runtime-libs' 'intel-oneapi-compiler-shared-opencl-cpu'
          'intel-oneapi-compiler-shared-runtime' 'intel-oneapi-compiler-dpcpp-cpp-runtime-libs'
          'intel-oneapi-compiler-dpcpp-cpp-runtime' 'intel-oneapi-compiler-shared' 'intel-oneapi-openmp'
          'intel-oneapi-dpcpp-debugger' 'intel-oneapi-dev-utilities' 'intel-oneapi-dpcpp-cpp'
          'intel-oneapi-vpl' 'intel-oneapi-ipp' 'intel-oneapi-ippcp' 'intel-oneapi-advisor'
          'intel-oneapi-vtune' 'intel-oneapi-fpga-group')
conflicts=('intel-oneapi-basekit')

package() {

  ## We have to run as a user different from root
  ## otherwise the installer wants to write to /opt, /var
  ## which is not possible in fakeroot.

  ## The directory has to be removed first, otherwise the installer
  ## will complain that some components are already installed.
  runuser -u $USER -- rm -rf /home/$USER/intel
  runuser -u $USER -- sh "intel-oneapi-base-toolkit-${pkgver_base}_offline.sh" -a \
    --silent --eula accept \
    --components all \
    --install-dir "${pkgdir}"/opt/intel/oneapi \
    --log-dir "${srcdir}"/ --ignore-errors
  ## Delete the directory again, Sometimes HPCKit installer may not 
  ## be able to install new components in same directory as BaseKit.
  ## I only saw this happen once in wsl, removing the directory will
  ## be safe but slow.
  # runuser -u $USER -- rm -rf /home/$USER/intel

  runuser -u $USER -- sh "intel-oneapi-hpc-toolkit-${pkgver_hpc}_offline.sh" -a \
    --silent --eula accept \
    --components all \
    --install-dir "${pkgdir}"/opt/intel/oneapi \
    --log-dir "${srcdir}"/ --ignore-errors
  # Clean up
  runuser -u $USER -- rm -rf /home/$USER/intel

  ## allow low level compiler libs to be found
  local _lib_path='/opt/intel/oneapi/compiler'
  local _ldso_conf="${pkgdir}"/etc/ld.so.conf.d
  install -d "${_ldso_conf}"
  echo "${_lib_path}/latest/lib" >> "${_ldso_conf}/${pkgname}.conf"
  echo "${_lib_path}/latest/lib/x64" >> "${_ldso_conf}/${pkgname}.conf"
  echo "${_lib_path}/latest/compiler/lib/intel64" >> "${_ldso_conf}/${pkgname}.conf"

  ## Collection of licenses used in OneAPI with pointers for all toolkits
  install -Dm644 "${pkgdir}/opt/intel/oneapi/licensing/latest/licensing/${_major_ver}.${_minor_ver}/license.htm" \
                 "${pkgdir}/usr/share/licenses/${pkgname}/license.htm"

## This will create a script in /etc/profile.d/intel-oneapi-hpckit.sh that sets the 
## environment variables for the current shell. If you want to create it automatically,
## uncomment the following lines. 

#   install -dm755 "$pkgdir/etc/profile.d/"
#   cat > "$pkgdir/etc/profile.d/$pkgname.sh" << EOF
# #!/bin/bash
# export ONEAPI_ROOT="/opt/intel/oneapi"
# source "/opt/intel/oneapi/setvars.sh >/dev/null 2>&1"
# EOF
#     chmod 644 "$pkgdir/etc/profile.d/$pkgname.sh"
}
