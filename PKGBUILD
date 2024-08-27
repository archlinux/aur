# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>
# Contributor: Vaughan <vaughanm1@protonmail.com>
# Contributor: tytan652 <tytan652 at tytanium dot xyz>
# Contributor: Jun Bo Bi <jambonmcyeah@gmail.com>

pkgname=netcoredbg
_pkgver=3.1.0-1031
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc='Debugger for .NET Core runtime'
url='https://github.com/Samsung/netcoredbg'
license=('MIT')
arch=('x86_64')
depends=('dotnet-runtime-8.0')
makedepends=('git' 'cmake' 'clang' 'dotnet-sdk-8.0')
# keep synced with extra/dotnet-core
# see Components.md of dotnet/dotnet
_runtime_tag=2aade6beb02ea367fd97c4070a4198802fe61c03
source=("$pkgname-$_pkgver.tar.gz::https://github.com/Samsung/netcoredbg/archive/refs/tags/$_pkgver.tar.gz"
        "dotnet_$_runtime_tag.tar.gz::https://github.com/dotnet/runtime/archive/$_runtime_tag.tar.gz")

sha256sums=('f9393d7ebef9070044b325ca419ce52a8f9a2c9b9b33b326edb7c2e134a52849'
            '2814c6b2933deaa6f3f950eb4ce797a9155e3ab103133061a1d73f0afd2a0a18')

build() {
  cmake -B build -S "$pkgname-$_pkgver" \
    -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ \
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
