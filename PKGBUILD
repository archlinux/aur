# Maintainer: Nick Black <nickblack@linux.com>
# Contributor: ava1ar <mail@ava1ar.me>
# Contributor: Duong Pham <dthpham@gmail.com>
# Contributor: Eric Quackenbush <mail@ericquackenbush.com>
# Contributor: Wei-Ning Huang <aitjcize@gmail.com>

pkgname=intel-opencl-runtime
epoch=1
pkgver=20.26.17199
pkgrel=1
pkgdesc="OpenCL runtime for Intel processors"
arch=('x86_64')
url="https://software.intel.com/en-us/articles/opencl-drivers#latest_CPU_runtime"
license=('MIT')
depends=('numactl' 'intel-tbb' 'zlib' 'ncurses' 'intel-gmmlib')
optdepends=('intel-opencl-sdk: Intel SDK for OpenCL Applications')
makedepends=('debtap')
provides=('opencl-intel' 'opencl-driver')
conflicts=('intel-compute-sdk')
source=("https://github.com/intel/compute-runtime/releases/download/${pkgver}/intel-opencl_${pkgver}_amd64.deb"
        "https://github.com/intel/compute-runtime/releases/download/20.26.17199/intel-ocloc_20.26.17199_amd64.deb"
)

package() {
    cd "${srcdir}"

    for i in *deb ; do
      echo "Unpacking $i to $(basename -s deb $i)..."
      mkdir -p $(basename -s deb $i)
      pushd $(basename -s deb $i) > /dev/null
      ar x ../$i
      tar xJf data.tar.xz -C ${pkgdir}
      popd > /dev/null
    done

    sed -i -e 's/\/local\//\//g' ${pkgdir}/etc/OpenCL/vendors/intel.icd
    for i in bin include lib ; do
      [ ! -e ${pkgdir}/usr/$i ] || { echo "${pkgdir}/usr/$i already exists, aborting" >&2 ; return 1; }
      mv ${pkgdir}/usr/local/$i ${pkgdir}/usr/$i
    done
    ls -lR ${pkgdir}/usr/local/
    rmdir ${pkgdir}/usr/local/
}

sha256sums=('752c08c9e9703c6ab065de10103b0b1c0c2ce29c8038da25e6734f6f72de555b'
            'b0887fad48d67a4a5b0afa1da98f3b6bef686fbf75d47c5f0f4a1da232dce7a3'
)
