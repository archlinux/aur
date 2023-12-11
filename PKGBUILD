# Maintainer: Vaughan <vaughanm1@protonmail.com>
# Former maintainer: tytan652 <tytan652 at tytanium dot xyz>
# Contributor: Jun Bo Bi <jambonmcyeah@gmail.com>

pkgname=netcoredbg
_pkgver="3.0.0-1012"
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc='Debugger for .NET Core runtime'
url='https://github.com/Samsung/netcoredbg'
license=("MIT")
arch=("x86_64")
depends=("dotnet-host>=7" "dotnet-runtime>=7")
makedepends=("git" "cmake" "clang" "dotnet-sdk>=7")
optdepends=()
source=("$pkgname-$_pkgver.tar.gz::https://github.com/Samsung/netcoredbg/archive/refs/tags/$_pkgver.tar.gz")
sha256sums=("54438b2f094bee5170e6cdeb45319988686c8c7f954ae36b8fe76045e5a0fd68")

build() {
  cd "$pkgname-$_pkgver"
  # patch needed for some file (https://github.com/Samsung/netcoredbg/issues/147)
  sed -i "20 a #include <cstdint>" src/interfaces/types.h

  mkdir -p build; cd build

  export CC=clang
  export CXX=clang++

  cmake \
    -DDOTNET_DIR=/usr/share/dotnet \
    -DCMAKE_INSTALL_PREFIX=/usr/bin ..

  make
}

package() {
  cd "$pkgname-$_pkgver"
  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  
  cd build
  make install DESTDIR="$pkgdir"
}
