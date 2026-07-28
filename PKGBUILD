# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=lib32-opencl-icd-loader
pkgver=2026.05.29
pkgrel=1
pkgdesc="The OpenCL ICD Loader project. (32-bit)"
arch=('x86_64')
url="https://github.com/KhronosGroup/OpenCL-ICD-Loader"
license=('Apache-2.0')
depends=('lib32-glibc')
makedepends=(
  'cmake'
  'gcc-multilib'
  'opencl-headers'
)
optdepends=('lib32-opencl-driver: packaged opencl driver')
provides=('libOpenCL.so=1' 'lib32-ocl-icd')
conflicts=('lib32-ocl-icd')
source=("OpenCL-ICD-Loader-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('48fd0c5181db7cd046f4f731d5955694892e10998d49d09ee0d997e7e04fd939')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  cmake -B build -S "OpenCL-ICD-Loader-$pkgver" \
    -DCMAKE_BUILD_TYPE='RelWithDebInfo' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='lib32' \
    -Wno-author
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  rm -rf "$pkgdir"/usr/{share,include,bin}
}
