# Maintainer: ava1ar <mail@ava1ar.me>
# Contributor: Duong Pham <dthpham@gmail.com>
# Contributor: Eric Quackenbush <mail@ericquackenbush.com>
# Contributor: Wei-Ning Huang <aitjcize@gmail.com>

pkgname=intel-opencl-runtime
epoch=1
pkgver=18.1.0.015
_package=l_opencl_p_${pkgver}
pkgrel=3
pkgdesc="OpenCL runtime for Intel Core and Xeon processors"
arch=('x86_64')
url="https://software.intel.com/content/www/us/en/develop/articles/opencl-drivers.html"
license=('custom:intel')
depends=('numactl' 'intel-tbb' 'zlib' 'ncurses5-compat-libs')
optdepends=('intel-opencl-sdk: Intel SDK for OpenCL Applications')
provides=('opencl-intel' 'opencl-driver')
source=(https://registrationcenter-download.intel.com/akdlm/irc_nas/15532/${_package}.tgz)
sha256sums=('13ff315e722283eed46cb3099bd43e9ecf557a7567c00bd11e6b84d04d352cc9')

package() {
    cd "${srcdir}"/${_package}/

    # Copy license
    install -Dm644 license.txt "${pkgdir}"/usr/share/licenses/intel-opencl-runtime/license

    # Unpack RPM
    rm rpm/intel-openclrt-pset-*.rpm
    for i in rpm/*.rpm; do bsdtar -xf "$i"; done

    # Register ICD
    mkdir -p "${pkgdir}/etc/OpenCL/vendors"
    echo "/opt/intel/opencl-runtime/linux/compiler/lib/intel64_lin/libintelocl.so" > "${pkgdir}/etc/OpenCL/vendors/intel-cpu.icd"

    # Install files
    mkdir -p "${pkgdir}/opt/intel/opencl-runtime"
    cp -r opt/intel/opencl_*/* "${pkgdir}/opt/intel/opencl-runtime"
}
