# Maintainer: Serhii Starovoitov <drommer.94@gmail.com>

pkgname=beignet
pkgver=1.4.0+g419c041
pkgrel=1
pkgdesc="An open source OpenCL implementation for Intel IvyBridge & Haswell iGPUs"
arch=('x86_64')
url="https://www.freedesktop.org/wiki/Software/Beignet"
license=('LGPL-2.1-or-later')
depends=('glu' 'llvm10-libs' 'clang10' 'mesa' 'opencl-headers')
makedepends=('git' 'libxfixes' 'llvm10' 'cmake' 'python' 'ocl-icd')
provides=('opencl-intel' 'opencl-driver')
conflicts=('opencl-intel')
source=("git+https://github.com/intel/beignet.git#commit=419c041736c5d19cd9c9e7f90717792a01826638"
        "llvm8.patch"
        "llvm9.patch"
        "llvm10.patch"
        "cflags.patch"
        "cl_accelerator_intel.patch"
        "coffeelake-cometlake-amberlake.patch"
        "fix-docs-links.patch"
        "fix-dynamic-exception-specifications.patch"
        "make-timestamps-reproducible.patch"
        "let-GenRegister-never-return-uninitialized-memory.patch"
        "reduce-notfound-output.patch"
        "utests-add-limits.patch")
sha256sums=('SKIP'
            'd24e4d8a1a791dc02c91117f900143789dd6f01eaa89292ad67c4fb4eaf84328'
            '5913a93fe6ef77b91480bb6d27c7875673294c0a8a924b2ac66756d0d3577908'
            'bbba2e1b57717ed4bd984a9b31acc6b3e3cf420fb4167f59e7dae9ae92cfb550'
            '4e6c37dc7b5b40321b4f460d712b88bb644dd061a747ce94aa68187b26b15440'
            '2e058d2d0f30c7a528ccbbd48de2750bdad18927f29891ee53e9d6923250e60b'
            'f76b383d53adf441865d25e887d12bbbe5956f1ea4836acc99f060f626a7d39f'
            '88ad44b0299a934610c6bb7e404f539d8c3dde0a4d9fa3e9a7b0f86b670a2e74'
            '7f55e2ddb98e94276a31fae297c1d465c8c3c893068d982cadf28501c88a7810'
            '274be0bf2ce87d07ee128e92e9075b8b21a7253b237b7b7bf8af83e7b9590a25'
            'c1f5880bb192103c371d51f57f646837ca01a8bbe012b9022d4e345c2f1187de'
            '3f51f892f6cba9c4af81a15117f833769a2526032df93fd928426ed77ffd343b'
            '584dd293856ddfc76ca9e50488aa2076239ab568a945e957ca3221e2d30b1c52')

prepare() {
  cd $pkgname

  git revert -n 9b7ca443cf7b 9cb7ff4c285d 1bd0d252d733

  patch -Np1 -i ../llvm8.patch
  patch -Np1 -i ../llvm9.patch
  patch -Np1 -i ../llvm10.patch
  patch -Np1 -i ../cflags.patch
  patch -Np1 -i ../cl_accelerator_intel.patch
  patch -Np1 -i ../coffeelake-cometlake-amberlake.patch
  patch -Np1 -i ../fix-docs-links.patch
  patch -Np1 -i ../fix-dynamic-exception-specifications.patch
  patch -Np1 -i ../let-GenRegister-never-return-uninitialized-memory.patch
  patch -Np1 -i ../make-timestamps-reproducible.patch
  patch -Np1 -i ../reduce-notfound-output.patch
  patch -Np1 -i ../utests-add-limits.patch
}

build() {
  cd $pkgname

  cmake -DLLVM_INSTALL_DIR=/opt/llvm10/bin \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  make
}

package() {
  cd $pkgname
  make DESTDIR=$pkgdir install
  # Remove headers already provided by 'opencl-headers'
  rm -f $pkgdir/usr/include/CL/{cl.h,cl_{egl.h,ext.h,gl.h,gl_ext.h,platform.h,d3d10.h,d3d11.h,dx9_media_sharing.h},opencl.h}
}
