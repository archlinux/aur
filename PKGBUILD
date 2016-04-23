# Maintainer: ava1ar <mail@ava1ar.me>
# Contributor: Duong Pham <dthpham@gmail.com>
# Contributor: Eric Quackenbush <mail@ericquackenbush.com>
# Contributor: Wei-Ning Huang <aitjcize@gmail.com>

pkgname=intel-opencl-runtime
epoch=1
pkgver=16.1
pkgrel=1
pkgdesc="OpenCL runtime for Intel Core and Xeon processors"
arch=('x86_64')
url="https://software.intel.com/en-us/articles/opencl-drivers"
license=('custom:intel')
depends=('numactl' 'intel-tbb' 'zlib')
makedepends=('rpmextract')
optdepends=('intel-opencl-sdk: Intel SDK for OpenCL Applications')
provides=('opencl')
install='intel-opencl-runtime.install'
source=(http://registrationcenter-download.intel.com/akdlm/irc_nas/9019/opencl_runtime_${pkgver}_x64_rh_5.2.0.10002.tgz)
sha256sums=('b39bb90f35640cd8d3fd6fc173cf24d969b81da4554a32484c9b2520a8c010c6')

package() {
	cd "${srcdir}"/opencl_runtime_*/

	# Copy license
	install -Dm644 EULA.txt "${pkgdir}"/usr/share/licenses/opencl-runtime/license

	# Unpack RPM
	rm rpm/opencl-1.2-base-pset-*.rpm
	for i in rpm/*.rpm; do rpmextract.sh "$i"; done

	# Register ICD
	mkdir -p "${pkgdir}/etc/OpenCL/vendors"
	echo "/opt/intel/opencl-runtime/lib64/libintelocl.so" > "${pkgdir}/etc/OpenCL/vendors/intel.icd"

	# Install files
	mkdir -p "${pkgdir}/opt/intel/opencl-runtime"
	cp -r opt/intel/opencl-*/* "${pkgdir}/opt/intel/opencl-runtime"

}
