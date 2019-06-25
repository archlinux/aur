pkgname=aws-lambda-cpp
pkgver=0.2.2+1+ga9dccbf
pkgrel=1
pkgdesc="C++ implementation of the AWS Lambda runtime"
url="https://github.com/awslabs/aws-lambda-cpp"
license=(Apache-2.0)
arch=(x86_64)
makedepends=(cmake git)
provides=("$pkgname")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  local v="$(git describe --tags)"
  v="${v#v}"
  printf %s "${v//-/+}"
}

_cmake_flags=(
  -DCMAKE_BUILD_TYPE=Release
  -DCMAKE_INSTALL_PREFIX=/usr
)

build() {
  mkdir build
  cd build
  cmake ../$pkgname "${_cmake_flags[@]}"
  make
}

# check() {
#   cd build
#   cmake ../$pkgname "${_cmake_flags[@]}" -DBUILD_TESTING=ON
#   make
#   ctest --output-on-failure
# }

package() {
  cd build
  make "DESTDIR=$pkgdir" install
  install -Dm644 "-t$pkgdir/usr/share/licenses/$_name" ../$pkgname/LICENSE
}
