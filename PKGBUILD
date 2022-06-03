# Maintainer: Drommer <drommer@github.com>

pkgname=beignet
pkgver=1.3.2.r3283.419c0417
pkgrel=1
pkgdesc="An open source OpenCL implementation for Intel IvyBridge & Haswell iGPUs"
arch=('x86_64')
url="https://www.freedesktop.org/wiki/Software/Beignet/"
license=('LGPL')
depends=('glu' 'llvm10-libs' 'clang10' 'mesa' 'opencl-headers')
makedepends=('git' 'llvm10' 'cmake' 'python' 'ocl-icd')
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
        "gbe_bin_generater.patch"
        "reduce-notfound-output.patch"
)
sha256sums=('SKIP'
            'd24e4d8a1a791dc02c91117f900143789dd6f01eaa89292ad67c4fb4eaf84328'
            '5913a93fe6ef77b91480bb6d27c7875673294c0a8a924b2ac66756d0d3577908'
            '2eb9b0801e24f4e537033b41a6bc462e4082f6216d62933240ca3010020ea779'
            '4e6c37dc7b5b40321b4f460d712b88bb644dd061a747ce94aa68187b26b15440'
            '2e058d2d0f30c7a528ccbbd48de2750bdad18927f29891ee53e9d6923250e60b'
            'f76b383d53adf441865d25e887d12bbbe5956f1ea4836acc99f060f626a7d39f'
            '88ad44b0299a934610c6bb7e404f539d8c3dde0a4d9fa3e9a7b0f86b670a2e74'
            '7f55e2ddb98e94276a31fae297c1d465c8c3c893068d982cadf28501c88a7810'
            '3f51f892f6cba9c4af81a15117f833769a2526032df93fd928426ed77ffd343b'
)

pkgver() {
  cd $pkgname
  printf "1.3.2.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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
  patch -Np1 -i ../gbe_bin_generater.patch
  patch -Np1 -i ../reduce-notfound-output.patch
}

build() {
  cd $pkgname

  cmake -DLLVM_INSTALL_DIR=/opt/llvm10/bin \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_BUILD_TYPE=RELEASE
  make
}

package() {
  cd $pkgname
  make DESTDIR=$pkgdir install
  # Remove headers already provided by 'opencl-headers'
  rm -f $pkgdir/usr/include/CL/{cl.h,cl_{egl.h,ext.h,gl.h,gl_ext.h,platform.h},opencl.h}
}
