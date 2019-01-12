# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Francois Menning <f.menning@protonmail.com>
# Contributor: ava1ar <mail@ava1ar.me>
# Contributor: Duong Pham <dthpham@gmail.com>
# Contributor: Eric Quackenbush <mail@ericquackenbush.com>
# Contributor: Wei-Ning Huang <aitjcize@gmail.com>

pkgname=intel-opencl
_pkgver=5.0-63503
pkgver="${_pkgver/-/.r}"
pkgrel=2
pkgdesc="Legacy OpenCL(TM) 2.0 Driver for Intel(R) HD, Iris(TM), and Iris(TM) Pro Graphics for Linux (pre-Broadwell)"
arch=('x86_64')
url="https://software.intel.com/en-us/articles/legacy-opencl-drivers#latest_linux_driver"
license=('custom:intel')
depends=('zlib' 'libdrm')
optdepends=('intel-opencl-sdk: Intel SDK for OpenCL Applications')
provides=('opencl-driver')
source=("${pkgname}-${pkgver}-linux64.zip::http://registrationcenter-download.intel.com/akdlm/irc_nas/11396/SRB5.0_linux64.zip")
sha256sums=('a3989a7a00f216b1a50bad37dc49629c3f7ce65104a2ca665e59d8c699bf7443')

_package_internal=("intel-opencl-r${_pkgver}.x86_64.tar.xz"
                   "intel-opencl-cpu-r${_pkgver}.x86_64.tar.xz")

package() {
	for p in "${_package_internal[@]}"; do
		tar -xf "$p" -C "$pkgdir"
	done

	# Copy license
	mkdir -p                              "$pkgdir/usr/share/licenses/intel-opencl"
	mv "$pkgdir/opt/intel/opencl/LICENSE" "$pkgdir/usr/share/licenses/intel-opencl/LICENSE"

	# Do not conflict with intel-opencl-runtime
	mv "$pkgdir/etc/OpenCL/vendors/intel"{,-gpu}.icd

	# sanitize permissions
	chown root:root -R "$pkgdir"
	chmod go-w -R "$pkgdir"
}
