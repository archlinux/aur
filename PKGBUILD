# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>
# Contributor: Vaughan <vaughanm1@protonmail.com>
# Contributor: tytan652 <tytan652 at tytanium dot xyz>
# Contributor: Jun Bo Bi <jambonmcyeah@gmail.com>

pkgname=netcoredbg
_pkgver=3.1.3-1062
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
_runtime_tag=0ada13fb1c2aefeef56450edb3e6ff4bc1e889bf
source=("$pkgname-$_pkgver.tar.gz::https://github.com/Samsung/netcoredbg/archive/refs/tags/$_pkgver.tar.gz"
        "dotnet_runtime_${_runtime_tag:0:7}.tar.gz::https://github.com/dotnet/runtime/archive/$_runtime_tag.tar.gz")

sha256sums=('4138f6f99432822b7f56053b91abb550607e1015d91275b82c3cddeaa02d903e'
            '44818b3e6c42afe303c5277bc3fc0383dc8ffdb8c59a3a3ee8310c213f6027dd')

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
