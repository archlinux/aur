# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=lib32-opencl-icd-loader
pkgver=2024.10.24
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
sha256sums=('95f2f0cda375b13d2760290df044ebea9c6ff954a7d7faa0867422442c9174dc')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  cmake -B build -S "OpenCL-ICD-Loader-$pkgver" \
    -DCMAKE_BUILD_TYPE='RelWithDebInfo' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='lib32' \
    -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  rm -rf "$pkgdir"/usr/{share,include,bin}
}
