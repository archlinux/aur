# Maintainer:
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Antoine Lubineau <antoine@lubignon.info>
# Contributor: Leopold Bloom <blinxwang@gmail.com>
# Contributor: Michal Krenek (a.k.a. Mikos) <m.krenek@gmail.com>

pkgname=beignet
pkgver=1.3.2+12+gfc5f430c
pkgrel=4
pkgdesc="An open source OpenCL implementation for Intel IvyBridge & Haswell iGPUs"
arch=(x86_64)
url="https://01.org/${pkgname}"
license=(LGPL)
depends=(glu llvm-libs clang mesa opencl-headers)
makedepends=(git llvm cmake python ocl-icd)
provides=(opencl-intel opencl-driver)
conflicts=(opencl-intel)
_commit=fc5f430cb7b7a8f694d86acbb038bd5b38ec389c  # master as of 2018-08-20
source=(
    "git+https://anongit.freedesktop.org/git/beignet.git#commit=$_commit"
    llvm8.patch
    llvm9.patch
    llvm10.patch
)
sha256sums=(
    SKIP
    d24e4d8a1a791dc02c91117f900143789dd6f01eaa89292ad67c4fb4eaf84328
    5913a93fe6ef77b91480bb6d27c7875673294c0a8a924b2ac66756d0d3577908
    2eb9b0801e24f4e537033b41a6bc462e4082f6216d62933240ca3010020ea779
)

prepare() {
    cd ${pkgname}

    # Remove implementation of cl_intel_device_side_avc_motion_estimation
    # (conflicts with the implemention in Clang 8)
    git revert -n 9b7ca443cf7b 9cb7ff4c285d

    # Patches from FreeBSD + Debian to build with newer LLVM
    patch -Np1 -i ../llvm8.patch
    patch -Np1 -i ../llvm9.patch

    # https://lists.freedesktop.org/archives/beignet/2020-January/009251.html
    # https://github.com/intel/opencl-clang/commit/77ae1114c7bf79d724f5129461
    patch -Np1 -i ../llvm10.patch
}

build() {
    cmake -B build -S ${pkgname} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_BUILD_TYPE=RELEASE
    make -C build
}

package() {
    make -C build DESTDIR="${pkgdir}" install
    # Remove headers already provided by 'opencl-headers'
    cd "${pkgdir}"/usr/include/CL
    rm cl.h cl_egl.h cl_ext.h cl_gl.h cl_gl_ext.h cl_platform.h opencl.h
}
