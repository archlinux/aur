# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Sean Lynch <seanl@literati.org>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Antoine Lubineau <antoine@lubignon.info>
# Contributor: Leopold Bloom <blinxwang@gmail.com>
# Contributor: Michal Krenek (a.k.a. Mikos) <m.krenek@gmail.com>

# For me, the compiler_rotate() utest fails when built with Clang 9.
# I therefore by default stick to Clang 7 for which support is somehow
# maintained upstream by Debian developers. Patches to build against
# Clang 9 are however included and can be simply commented in.
# - Michael

pkgname=beignet-git
pkgver=1.0.0.r1395.g419c0417
pkgrel=2
pkgdesc="An open source OpenCL implementation for Intel IvyBridge & Haswell iGPUs"
arch=(x86_64)
url="https://01.org/beignet"
license=(LGPL)
depends=(glu clang70 mesa opencl-headers)
makedepends=(git llvm70 cmake ninja python ocl-icd)
provides=(beignet opencl-intel opencl-driver)
conflicts=(beignet)
source=("git+https://github.com/intel/beignet.git"
        'GBE-let-GenRegister-reg-never-return-uninitialized-m.patch'
        'llvm8.patch'
        'llvm9.patch')
sha256sums=('SKIP'
            'c1f5880bb192103c371d51f57f646837ca01a8bbe012b9022d4e345c2f1187de'
            'f16b13a3263b5042081094cd20c9e09c20a3a6d6e1dd796f460e4f447cfbb598'
            '2a0229629ad228b54fdb930d18a94c6879024a41b43ed5265c758bf508cd4bc6')

function pkgver() {
    cd "$srcdir/beignet"
    git describe --long --tags | sed 's/^Release_v//;s/-/.r/;s/-/./'
}

prepare() {
    mkdir -p build
    cd beignet

    # Remove implementation of cl_intel_device_side_avc_motion_estimation
    # (conflicts with the implemention in Clang 8)
    # git revert -n 9b7ca443cf7b d61933205874 a4257c7475e7 5a288032ab23 9cb7ff4c285d

    # Static linking leads to build failure
    git revert -n 1bd0d252d733

    # Fix undefined behavior
    # See:
    #  * https://github.com/intel/beignet/pull/16
    #  * https://gitlab.freedesktop.org/beignet/beignet/issues/12
    # patch -Np1 -i ../GBE-let-GenRegister-reg-never-return-uninitialized-m.patch

    # Patches from FreeBSD to build with newer LLVM
    # patch -Np0 -i ../llvm8.patch
    # patch -Np0 -i ../llvm9.patch
}

build() {
    cd build
    cmake -G Ninja ../beignet \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_INSTALL_RPATH_USE_LINK_PATH=TRUE \
        -DLLVM_INSTALL_DIR=/opt/llvm70/bin
    ninja
}

package() {
    cd build
    DESTDIR="${pkgdir}" ninja install
    # Remove headers already provided by 'opencl-headers'
    cd "${pkgdir}/usr/include/CL"
    rm cl.h cl_egl.h cl_ext.h cl_gl.h cl_gl_ext.h cl_platform.h opencl.h
}
