# Maintainer: Yingchang Liu <yingchangliu at outlook dot com>
pkgname=intel-oneapi-hpckit
_major_ver=2024
_minor_ver=0
_patch_ver=1
pkgver=$_major_ver.$_minor_ver.$_patch_ver
# https://www.intel.com/content/www/us/en/developer/tools/oneapi/base-toolkit-download.html?operatingsystem=linux&distributions=offline&version=2024.0.1
# https://www.intel.com/content/www/us/en/developer/tools/oneapi/hpc-toolkit-download.html?operatingsystem=linux&distributions=offline&version=2024.0.1
pkgver_base=$pkgver.46
pkgver_hpc=$pkgver.38
_urlver_base=163da6e4-56eb-4948-aba3-debcec61c064
_urlver_hpc=67c08c98-f311-4068-8b85-15d79c4f277a
pkgrel=1
pkgdesc="Intel oneAPI Base and HPC Toolkit for Linux"
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=('custom:EULA')
source=("https://registrationcenter-download.intel.com/akdlm/IRC_NAS/${_urlver_base}/l_BaseKit_p_${pkgver_base}_offline.sh"
        "https://registrationcenter-download.intel.com/akdlm/IRC_NAS/${_urlver_hpc}/l_HPCKit_p_${pkgver_hpc}_offline.sh")
sha384sums=('7b9d71a0b412c65efe0b6083c6a48a64ffeeb9070f4e2af125333314e8e897490ec566e1d0c2c3cdb3c4aa0820ea44b4'
            'df6509544dfc38cd0f58862545c98853b9a254c52eba105d988b98740cf987412872f9695584ba6985429d1a0b50a9e4')
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
