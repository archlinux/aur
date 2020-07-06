# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Sean Lynch <seanl@literati.org>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Antoine Lubineau <antoine@lubignon.info>
# Contributor: Leopold Bloom <blinxwang@gmail.com>
# Contributor: Michal Krenek (a.k.a. Mikos) <m.krenek@gmail.com>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

# For me, utests fail when built with Clang 10. I therefore by default stick to
# Clang 7 for which no unofficial patches are required. Patches to build against
# Clang 8, 9 or 10 are however included and can be simply commented in.
# - Michael

pkgname=beignet-git
pkgver=1.0.0.r1395.g419c0417
pkgrel=3
pkgdesc="An open source OpenCL implementation for Intel IvyBridge & Haswell iGPUs"
arch=(x86_64)
url="https://01.org/beignet"
license=(LGPL)
depends=(glu clang70 mesa opencl-headers)
makedepends=(git llvm70 cmake ninja python ocl-icd)
provides=(beignet opencl-intel opencl-driver)
conflicts=(beignet)
source=(
    "git+https://github.com/intel/beignet.git"
    GBE-let-GenRegister-reg-never-return-uninitialized-m.patch
    llvm8.patch
    llvm9.patch
    llvm10.patch
)
sha256sums=('SKIP'
            'c1f5880bb192103c371d51f57f646837ca01a8bbe012b9022d4e345c2f1187de'
            'd24e4d8a1a791dc02c91117f900143789dd6f01eaa89292ad67c4fb4eaf84328'
            '5913a93fe6ef77b91480bb6d27c7875673294c0a8a924b2ac66756d0d3577908'
            '2eb9b0801e24f4e537033b41a6bc462e4082f6216d62933240ca3010020ea779')

function pkgver() {
    cd "$srcdir/beignet"
    git describe --long --tags | sed 's/^Release_v//;s/-/.r/;s/-/./'
}

prepare() {
    cd beignet

    # Remove implementation of cl_intel_device_side_avc_motion_estimation
    # (conflicts with the implemention in Clang 8)
    # git revert -n 9b7ca443cf7b d61933205874 a4257c7475e7 5a288032ab23 9cb7ff4c285d

    # Static linking leads to build failure due to the gbe compiler still using shared libs
    git revert -n 1bd0d252d733

    # Fix undefined behavior
    # See:
    #  * https://github.com/intel/beignet/pull/16
    #  * https://gitlab.freedesktop.org/beignet/beignet/issues/12
    # A similar fix is included in llvm8.patch
    patch -Np1 -i ../GBE-let-GenRegister-reg-never-return-uninitialized-m.patch

    # Patches from FreeBSD + Debian to build with newer LLVM
    # patch -Np1 -i ../llvm8.patch
    # patch -Np1 -i ../llvm9.patch

    # https://lists.freedesktop.org/archives/beignet/2020-January/009251.html
    # https://github.com/intel/opencl-clang/commit/77ae1114c7bf79d724f5129461
    # patch -Np1 -i ../llvm10.patch
}

build() {
    cmake -B build -S beignet -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_INSTALL_RPATH_USE_LINK_PATH=TRUE \
        -DLLVM_INSTALL_DIR=/opt/llvm70/bin
    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install
    # Remove headers already provided by 'opencl-headers'
    cd "${pkgdir}"/usr/include/CL
    rm cl.h cl_egl.h cl_ext.h cl_gl.h cl_gl_ext.h cl_platform.h opencl.h
}
