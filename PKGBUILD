# Maintainer: Yingchang Liu <yingchangliu at outlook dot com>
pkgname=intel-oneapi-hpckit
_major_ver=2024
_minor_ver=2
_patch_ver=0
pkgver=$_major_ver.$_minor_ver.$_patch_ver
# https://www.intel.com/content/www/us/en/developer/tools/oneapi/base-toolkit-download.html?operatingsystem=linux&distributions=offline&version=2024.2.0
# https://www.intel.com/content/www/us/en/developer/tools/oneapi/hpc-toolkit-download.html?operatingsystem=linux&distributions=offline&version=2024.2.0
pkgver_base=$pkgver.634
pkgver_hpc=$pkgver.635
_urlver_base=9a98af19-1c68-46ce-9fdd-e249240c7c42
_urlver_hpc=d4e49548-1492-45c9-b678-8268cb0f1b05
pkgrel=1
pkgdesc="Intel oneAPI Base and HPC Toolkit for Linux"
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=('custom:EULA')
source=("https://registrationcenter-download.intel.com/akdlm/IRC_NAS/${_urlver_base}/l_BaseKit_p_${pkgver_base}_offline.sh"
        "https://registrationcenter-download.intel.com/akdlm/IRC_NAS/${_urlver_hpc}/l_HPCKit_p_${pkgver_hpc}_offline.sh")
sha384sums=('1206a2773e03295241eca39a114a30202e355f5d0d655aad7db13bd64998badc05b22b3fb3ec7843c9923c80f05929d7'
            '1970937b0ae5005ac3db652659dc093e8f76fc449c3630ce0c761216e88b2f55975777232d84acd06847d52b5605c12b')
depends=(level-zero-loader)
options=(!strip staticlibs)
install="$pkgname.install"
noextract=("l_BaseKit_p_${pkgver_base}_offline.sh"
           "l_HPCKit_p_${pkgver_hpc}_offline.sh")
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
  runuser -u $USER -- sh "l_BaseKit_p_${pkgver_base}_offline.sh" -a \
    --silent --eula accept \
    --components all \
    --install-dir "${pkgdir}"/opt/intel/oneapi \
    --log-dir "${srcdir}"/ --ignore-errors
  ## Delete the directory again, Sometimes HPCKit installer may not 
  ## be able to install new components in same directory as BaseKit.
  ## I only saw this happen once in wsl, removing the directory will
  ## be safe but slow.
  # runuser -u $USER -- rm -rf /home/$USER/intel

  runuser -u $USER -- sh "l_HPCKit_p_${pkgver_hpc}_offline.sh" -a \
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
  echo "${_lib_path}/latest/linux/lib" >> "${_ldso_conf}/${pkgname}.conf"
  echo "${_lib_path}/latest/linux/lib/x64" >> "${_ldso_conf}/${pkgname}.conf"
  echo "${_lib_path}/latest/linux/compiler/lib/intel64" >> "${_ldso_conf}/${pkgname}.conf"

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
