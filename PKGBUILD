# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>
# Contributor: Vaughan <vaughanm1@protonmail.com>
# Contributor: tytan652 <tytan652 at tytanium dot xyz>
# Contributor: Jun Bo Bi <jambonmcyeah@gmail.com>

pkgname=netcoredbg
_pkgver=3.1.2-1054
pkgver="${_pkgver//-/_}"
pkgrel=4
pkgdesc='Debugger for .NET Core runtime'
url='https://github.com/Samsung/netcoredbg'
license=('MIT')
arch=('x86_64')
depends=('dotnet-runtime-9.0' 'glibc' 'gcc-libs')
makedepends=('cmake' 'clang' 'dotnet-sdk-9.0')
# keep synced with extra/dotnet-core
# see Components.md of dotnet/dotnet
_runtime_tag=831d23e56149cd59c40fc00c7feb7c5334bd19c4
source=("$pkgname-$_pkgver.tar.gz::https://github.com/Samsung/netcoredbg/archive/refs/tags/$_pkgver.tar.gz"
        "dotnet_runtime_${_runtime_tag:0:7}.tar.gz::https://github.com/dotnet/runtime/archive/$_runtime_tag.tar.gz")

sha256sums=('2699f6dd0275c5943339183fc5c7e5c0cdfe77a23388a9fdab3f2c6929ff40a7'
            '0d3d2118f10a353d8940b1910ab861326f9fee32b287b17b7ad343109eb7486b')

build() {
  cmake -B build -S "$pkgname-$_pkgver" \
    -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_BUILD_TYPE=None \
    -DDOTNET_DIR=/usr/share/dotnet \
    -DCORECLR_DIR="$(realpath "runtime-$_runtime_tag")/src/coreclr" \
    -DCMAKE_INSTALL_PREFIX=/

  cmake --build build
}

package() {
  DESTDIR="$pkgdir/opt/netcoredbg" cmake --install build
  install -d "$pkgdir/usr/bin"
  ln -s /opt/netcoredbg/netcoredbg "$pkgdir/usr/bin"
  install -Dm644 "$pkgname-$_pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
