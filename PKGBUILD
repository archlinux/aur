# Maintainer: Jacek Danecki <gmail j a c e k . m . d a n e c k i>
# Contributor: Enihcam <gmail n a n e r i c w a n g>
# Contributor: Schmetzler <web.de d i m o n o k>

pkgname=compute-runtime-bin
_depver=18.50.1270
pkgver=19.07.12410
pkgrel=1
pkgdesc='Intel(R) Graphics Compute Runtime for OpenCL(TM). Replaces Beignet for Gen8 (Broadwell) and beyond (binary version)'
arch=(x86_64)
url='https://github.com/intel/compute-runtime'
license=(MIT)
install=${pkgname}.install
depends=(intel-gmmlib zlib ncurses5-compat-libs)
optdepends=(libdrm libva ocl-icd)
provides=(opencl opencl-driver compute-runtime)
conflicts=(beignet compute-runtime)

source=(
${url}/releases/download/${pkgver}/intel-igc-core_${_depver}_amd64.deb
${url}/releases/download/${pkgver}/intel-igc-opencl_${_depver}_amd64.deb
${url}/releases/download/${pkgver}/intel-opencl_${pkgver}_amd64.deb
)

sha256sums=('9cd2359c903a7bcb35c9c86ccfe113828f07757afd2d9bf7fda36d8d68a17b7b'
            'f05e162a3c2a6785a578fd24e87f3c31e0365caad2c72a620239cf1341833ca3'
            'e479c9058b828472e36078647c258a70bb6db779c6b34c90b8f5b621d4d484b0')

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

    cd ${pkgdir}/usr/lib
    ln -sf libigdgmm.so libigdgmm.so.3
}
