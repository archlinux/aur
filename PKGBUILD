# Maintainer: lanxia <lanxia@gmail>

pkgname=intel-oneapi-basekit-2025
pkgver=2025.3.2
_pkgver=2025.3.2.21
_urlmagic=99f4837a-25b7-425d-a897-60af022676ea
pkgrel=1
pkgdesc="Intel oneAPI Base Toolkit for Linux"
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=('LicenseRef-Intel-EULA-Developer-Tools AND LicenseRef-Intel-Simplified')
source=("${pkgname}-${pkgver}.sh::https://registrationcenter-download.intel.com/akdlm/IRC_NAS/${_urlmagic}/intel-oneapi-base-toolkit-${_pkgver}_offline.sh")
sha256sums=('fbca4d913f0afc73c8de1408a07e7d9cd12c68648c51c72802b709232f13f39c')
depends=(level-zero-loader)
options=(!strip staticlibs)
install="intel-oneapi-base-toolkit.install"
noextract=("${pkgname}-${pkgver}.sh")
optdepends=('libnotify: VTune GUI'
            'glib2: VTune GUI'
            'gtk3: VTune GUI'
            'at-spi2-atk: VTune GUI'
            'libdrm: VTune GUI'
            'libxcb: VTune GUI'
            'libxcrypt-compat: VTune GUI'
            'xdg-utils: VTune GUI'
            'nss: Advisor GUI')
conflicts=('intel-oneapi-base-toolkit' 'intel-oneapi-basekit')
provides=('intel-oneapi-base-toolkit' 'intel-oneapi-basekit'
          'intel-oneapi-mkl' 'intel-oneapi-dnnl' 'intel-oneapi-tbb' 'intel-oneapi-dpl'
          'intel-oneapi-ccl' 'intel-oneapi-dpcpp-cpp-compiler' 'intel-oneapi-dal' 'intel-oneapi-tcm'
          'intel-oneapi-compiler-shared-runtime-libs' 'intel-oneapi-compiler-shared-opencl-cpu'
          'intel-oneapi-compiler-shared-runtime' 'intel-oneapi-compiler-dpcpp-cpp-runtime-libs'
          'intel-oneapi-compiler-dpcpp-cpp-runtime' 'intel-oneapi-compiler-shared' 'intel-oneapi-openmp'
          'intel-oneapi-dpcpp-debugger' 'intel-oneapi-dev-utilities' 'intel-oneapi-dpcpp-cpp'
          'intel-oneapi-vpl' 'intel-oneapi-ipp' 'intel-oneapi-ippcp' 'intel-oneapi-advisor'
          'intel-oneapi-vtune' 'intel-oneapi-fpga-group' "intel-oneapi-basekit=${pkgver}")

build() {
  sh "${pkgname}-${pkgver}.sh" \
    --extract-folder "${srcdir}" --extract-only \
    --remove-extracted-files no --log "${srcdir}"/extract.log
}

package() {
  # we have to run as a user different from root
  # otherwise the installer wants to write to /opt, /var
  # which is not possible in fakeroot
  LD_PRELOAD="" "intel-oneapi-base-toolkit-${_pkgver}_offline"/install.sh \
    --silent --eula accept \
    --components all \
    --install-dir "${pkgdir}"/opt/intel/oneapi \
    --log-dir "${srcdir}"/ --ignore-errors

  # Remove install logs to make package reproducible.
  rm -r "${pkgdir}/opt/intel/oneapi/logs"

  # allow low level compiler libs to be found
  local _lib_path='/opt/intel/oneapi/compiler'
  local _ldso_conf="${pkgdir}"/etc/ld.so.conf.d
  install -d "${_ldso_conf}"
  echo "${_lib_path}/latest/lib" >> "${_ldso_conf}/${pkgname}.conf"
  echo "${_lib_path}/latest/opt/compiler/lib" >> "${_ldso_conf}/${pkgname}.conf"

  # Collection of licenses used in OneAPI with pointers for all toolkits
  local majmin=$(echo "${pkgver}" | cut -d. -f1,2)
  install -Dm644 "${pkgdir}/opt/intel/oneapi/licensing/latest/licensing/${majmin}/license.htm" \
                 "${pkgdir}/usr/share/licenses/${pkgname}/license.htm"
}
