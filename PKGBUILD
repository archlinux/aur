# Maintainer: grmat <grmat@sub.red>

pkgname='compute-runtime'
pkgdesc="Intel(R) Graphics Compute Runtime for OpenCL(TM). Replaces Beignet for Gen8 (Broadwell) and beyond. Weekly build version."
pkgver='19.11.12599'
pkgrel=2
arch=('x86_64')
url='https://01.org/compute-runtime'
license=('MIT')
makedepends=(
    # official repositories:
	'git' 'cmake' 'intel-gmmlib'
    # AUR:
        'intel-graphics-compiler'    
)	
optdepends=('libva: for cl_intel_va_api_media_sharing'
            'libdrm: for cl_intel_va_api_media_sharing')
depends=('ocl-icd' 'ncurses' 'zlib' 'intel-gmmlib')
conflicts=('compute-runtime-git')
provides=('opencl-driver')

source=("neo::git+https://github.com/intel/compute-runtime#tag=$pkgver")

sha256sums=('SKIP')

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/build"
}

build() {
  cd "${srcdir}/build"
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DNEO_DRIVER_VERSION=$pkgver \
        ../neo
  make "$MAKEFLAGS"
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="$pkgdir" install
}

