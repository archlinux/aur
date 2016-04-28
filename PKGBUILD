# Maintainer: ava1ar <maiL@ava1ar.me>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: Nicolas Bigaouette <nbigaouette@gmail.com>
# Contributor: Vojtech "kralyk" Kral

pkgname=intel-opencl-sdk
pkgver=2016
pkgrel=4
pkgdesc="Intel SDK for OpenCL Applications"
arch=('x86_64')
url="https://software.intel.com/en-us/intel-opencl/download"
license=('custom:intel')
depends=('libcl' 'libpng12' 'opencl-headers')
makedepends=('rpmextract')
optdepends=('intel-opencl-runtime: OpenCL runtime for Intel Core and Xeon processors')
install=intel-opencl-sdk.install
source=(http://registrationcenter-download.intel.com/akdlm/irc_nas/8522/intel_sdk_for_opencl_${pkgver}_6.0.0.1049_x64.tgz)
sha256sums=('7878850173ca4dc97a7897bc561199f7f13987ee12d82c886b94a63fd71c1e5f')

package() {
  cd "${srcdir}"/intel_sdk*/

  # Copy license
  install -Dm644 EULA.txt "${pkgdir}"/usr/share/licenses/intel-opencl-sdk/license
                
  # Unpack rpms
  for i in rpm/*.rpm; do  rpmextract.sh "$i"; done

  # Install files
  mkdir -p "${pkgdir}/opt/intel/opencl-sdk"
  cp -r opt/intel/opencl-*/* "${pkgdir}/opt/intel/opencl-sdk"

  # Cleanup
  rm -rf "${pkgdir}"/opt/intel/opencl-sdk/uninstall*
  # Headers are provided by 'opencl-headers' package	
  rm -rf "${pkgdir}"/opt/intel/opencl-sdk/include

  # Fix runtime_lib_dir and sdk_dir
  sed -i -e 's|/etc/alternatives/opencl-intel-tools|/opt/intel/opencl-sdk|g' \
	-e 's|$(dirname $(readlink /etc/alternatives/opencl-libOpenCL.so))|/opt/intel/opencl-runtime/lib64|g' \
  	"${pkgdir}"/opt/intel/opencl-sdk/bin/{KBServer64,KernelBuilder64,ioc64}

  # Symlink binaries
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/intel/opencl-sdk/bin/ioc64" "${pkgdir}/usr/bin/ioc"
}
