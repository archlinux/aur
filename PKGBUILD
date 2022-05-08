# Maintainer: tytan652 <tytan652 at tytanium dot xyz>
# Contributor: Jun Bo Bi <jambonmcyeah@gmail.com>

pkgname=netcoredbg
_ver=2.0.0-895
pkgver=${_ver//-/_}
pkgrel=1
pkgdesc='Debugger for .NET Core runtime'
url='https://github.com/Samsung/netcoredbg'
license=("MIT")
arch=("x86_64")
depends=("dotnet-host>=3.1" "dotnet-runtime>=3.1")
makedepends=("git" "cmake" "clang" "dotnet-sdk>=3.1")
optdepends=()
source=(
    "$pkgname-$_ver.tar.gz::https://github.com/Samsung/netcoredbg/archive/refs/tags/$_ver.tar.gz"
)
sha256sums=(
    "a2196b945371ada239660d9a52998ab451399498fa4048a9510a54710910eb4d"
)

prepare() {
  # Add missing include
  cd "$pkgname-$_ver"/src/debugger/
  echo -e "#include <limits>\n$(cat frames.cpp)" > frames.cpp
}

build() {
  cd "$pkgname-$_ver"
  mkdir -p build; cd build

  export CC=clang
  export CXX=clang++

  cmake \
    -DDOTNET_DIR=/usr/share/dotnet \
    -DCMAKE_INSTALL_PREFIX=/usr/bin ..

  make
}

package() {
  cd "$pkgname-$_ver"
  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  
  cd build
  make install DESTDIR="$pkgdir"
}
