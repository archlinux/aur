# Maintainer: Jacek Danecki <gmail j a c e k . m . d a n e c k i>
# Contributor: Enihcam <gmail n a n e r i c w a n g>
# Contributor: Schmetzler <web.de d i m o n o k>

pkgname=compute-runtime-bin
_depver=19.11.1622
pkgver=19.11.12599
pkgrel=1
pkgdesc='Intel(R) Graphics Compute Runtime for OpenCL(TM). Replaces Beignet for Gen8 (Broadwell) and beyond (binary version)'
arch=(x86_64)
url='https://github.com/intel/compute-runtime'
license=(MIT)
install=${pkgname}.install
depends=(intel-gmmlib zlib)
optdepends=(libdrm libva ocl-icd)
provides=(opencl opencl-driver compute-runtime)
conflicts=(beignet compute-runtime)

source=(
${url}/releases/download/${pkgver}/intel-igc-core_${_depver}_amd64.deb
${url}/releases/download/${pkgver}/intel-igc-opencl_${_depver}_amd64.deb
${url}/releases/download/${pkgver}/intel-opencl_${pkgver}_amd64.deb
)

sha256sums=('6ed64329e0816e23ca7aed8c8a54b98c9bcfbdf4b9b78f254407cdac10fa17a4'
            'a1c3e3c8848e8cf52790c558ec310ab72a20865a8c6473046c3a29052b08c273'
	    '1d6b197d1341545a570d6b2f8722163db7c1cf2d369ba4160d4081e39922c95b')

noextract=(
${url}/releases/download/${pkgver}/intel-igc-core_${_depver}_amd64.deb
${url}/releases/download/${pkgver}/intel-igc-opencl_${_depver}_amd64.deb
${url}/releases/download/${pkgver}/intel-opencl_${pkgver}_amd64.deb
)

prepare() {
    cd ${srcdir}
    mkdir -p igc-core/
    cd igc-core/
    ar xf ../intel-igc-core_${_depver}_amd64.deb

    cd ${srcdir}
    mkdir -p igc-opencl/
    cd igc-opencl/
    ar xf ../intel-igc-opencl_${_depver}_amd64.deb

    cd ${srcdir}
    mkdir -p opencl/
    cd opencl/
    ar xf ../intel-opencl_${pkgver}_amd64.deb
}

package() {
    tar -xJC ${pkgdir} -f ${srcdir}/igc-core/data.tar.xz
    tar -xJC ${pkgdir} -f ${srcdir}/igc-opencl/data.tar.xz
    tar -xJC ${pkgdir} -f ${srcdir}/opencl/data.tar.xz

    mkdir -p ${pkgdir}/usr/lib
    rm -f ${pkgdir}/usr/local/lib/libigdgmm.so*
    cp -af ${pkgdir}/usr/local/lib/*.so ${pkgdir}/usr/lib
    chmod 755 ${pkgdir}/usr/lib/*.so
    chown root:root ${pkgdir}/usr/lib/*.so
    rm -fr ${pkgdir}/usr/local
    sed -i 's/\/usr\/local\/lib/\/usr\/lib/gI' ${pkgdir}/etc/ld.so.conf.d/libintelopencl.conf
    sed -i 's/\/usr\/local\/lib/\/usr\/lib/gI' ${pkgdir}/etc/OpenCL/vendors/intel.icd
    mv ${pkgdir}/etc/OpenCL/vendors/intel.icd ${pkgdir}/etc/OpenCL/vendors/intel-gpu.icd
}
