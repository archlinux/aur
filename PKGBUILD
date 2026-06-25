# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>
# Contributor: Vaughan <vaughanm1@protonmail.com>
# Contributor: tytan652 <tytan652 at tytanium dot xyz>
# Contributor: Jun Bo Bi <jambonmcyeah@gmail.com>

pkgname=netcoredbg
_pkgver=3.2.0-1092
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc='Debugger for .NET Core runtime'
url='https://github.com/Samsung/netcoredbg'
license=('MIT')
arch=('x86_64')
depends=('dotnet-runtime-10.0' 'glibc' 'gcc-libs')
makedepends=('cmake' 'clang' 'dotnet-sdk-10.0')
# keep synced with extra/dotnet-core
# see src/source-manifest.json of dotnet/dotnet
_runtime_tag=5eaa18a9f3398d54ba9b8c0974d88171663be892
source=("$pkgname-$_pkgver.tar.gz::https://github.com/Samsung/netcoredbg/archive/refs/tags/$_pkgver.tar.gz"
        "dotnet_runtime_${_runtime_tag:0:7}.tar.gz::https://github.com/dotnet/runtime/archive/$_runtime_tag.tar.gz")

sha256sums=('18fe4e77e436d9cf98bcf58a949546da1b5278b57c7704a87473509b87585609'
            'e1859b52d33d095b2a4cfb805851af52d7986f4bb316d0bfcc72f3329d79008e')

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
