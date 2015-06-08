# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Nicolas Bigaouette <nbigaouette@gmail.com>
# Contributor: Vojtech "kralyk" Kral

pkgname='intel-opencl-sdk'
pkgver=2014_R2
pkgrel=2
pkgdesc="Intel’s implementation of the OpenCL standard optimized for Intel processors."
arch=('x86_64')
url="http://software.intel.com/en-us/vcsource/tools/opencl"
license=('intel')
depends=('opencl-headers' 'libcl' 'llvm' 'intel-tbb' 'numactl' 'libpng12' )
makedepends=('rpmextract')
provides=('opencl')
install='intel-opencl-sdk.install'
source=('http://registrationcenter.intel.com/irc_nas/4667/intel_sdk_for_ocl_applications_2014_4.6.0.92_x64.tgz')
sha256sums=('caa9112bfd9cd81afd9b64bc6c14d316dc563377f33c2d781f5f5b3d91145707')
_ipath="/opt/intel/opencl-sdk"

package() {
  #Unpack RMP
  cd "${srcdir}"/intel_sdk*/
  for i in rpm/*.rpm; do  rpmextract.sh "$i"; done

  #Register ICD
  mkdir -p "${pkgdir}/etc/OpenCL/vendors"
  echo "${_ipath}/lib64/libintelocl.so" > "${pkgdir}/etc/OpenCL/vendors/intel.icd"
  # The OpenCL ICD specifications: http://www.khronos.org/registry/cl/extensions/khr/cl_khr_icd.txt

  #Install files
  mkdir -p "${pkgdir}/${_ipath}"
  cp -r opt/intel/opencl-*/* "${pkgdir}/${_ipath}"

  # #Symlink binaries
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "${_ipath}/bin/ioc64" "${pkgdir}/usr/bin/ioc"

  ln -s opencl-sdk "${pkgdir}"/opt/intel/opencl-1.2-4.4.0.117
}
