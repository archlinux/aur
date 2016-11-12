# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: ava1ar <mail@ava1ar.me>
# Contributor: Duong Pham <dthpham@gmail.com>
# Contributor: Eric Quackenbush <mail@ericquackenbush.com>
# Contributor: Wei-Ning Huang <aitjcize@gmail.com>

pkgname=intel-opencl
_pkgver=3.0-57406
pkgver="${_pkgver/-/.r}"
pkgrel=1
pkgdesc="OpenCL(TM) 2.0 Driver for Intel(R) HD, Iris(TM), and Iris(TM) Pro Graphics for Linux"
arch=('x86_64')
url="https://software.intel.com/en-us/articles/opencl-drivers#latest_linux_driver"
license=('custom:intel')
depends=('zlib' 'libdrm')
optdepends=('intel-opencl-sdk: Intel SDK for OpenCL Applications')
provides=('opencl')
source=("${pkgname}-${pkgver}-linux64.zip::https://software.intel.com/sites/default/files/managed/b8/65/linux64.zip")
sha256sums=('5fc83b6626e3d1dea2864bd6f80b0de82f191ccd879c08a1345835d9ebe75349')

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
