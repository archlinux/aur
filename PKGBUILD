pkgname=ukey2-git
_pkgname=ukey2
pkgrel=1
pkgver=r34.c2436e5
arch=('x86_64')
url=https://github.com/google/ukey2
# Maintainer: Bageljr <bageljr897 at pm dot me>
source=("git+https://github.com/google/ukey2.git" "ukey2_use_shared.patch")
sha256sums=(SKIP 7be2c60f78fa4bbfb7c289b643a3c29284ac2d4422ed21872a67566383f93e79)
license=(Apache)
depends=('protobuf' 'abseil-cpp' 'openssl')
makedepends=('git' 'cmake')
pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
#TODO: use system gtest
prepare() {
  cd $_pkgname
  git submodule update --init --recursive third_party/gtest
  git submodule update --init --recursive third_party/secure_message
  patch --forward --strip=1 --input="${srcdir}/ukey2_use_shared.patch"
}
build() {
  mkdir -p build
  cmake -Dukey2_USE_LOCAL_PROTOBUF=OFF -Dukey2_USE_LOCAL_ABSL=OFF -DCMAKE_INSTALL_PREFIX=/usr -B build -DCMAKE_BUILD_TYPE='None' -DBUILD_SHARED_LIBS:BOOL='ON'  -Wno-dev -S $_pkgname
  cmake --build build
}
check() {
  cd build
  ctest -V --output-on-failure
}
package() { 
  DESTDIR="$pkgdir" cmake --install build
}

