# Maintainer: Jun Bo Bi <jambonmcyeah@gmail.com>

pkgname=netcoredbg
pkgver=latest
pkgrel=2
pkgdesc='Debugger for .NET Core runtime'
url='https://github.com/Samsung/netcoredbg'
license=(MIT)
arch=(x86_64)
depends=(dotnet-host dotnet-runtime dotnet-sdk)
makedepends=(git cmake ninja clang)
optdepends=()
source=("${url}/archive/${pkgver}.tar.gz" "fix.patch")
sha256sums=('SKIP' "d4f18980c86dd91511616b3dcbd9da806f7e355ec4d2b66edeede7465037d023")

prepare() {
  cd "netcoredbg-${pkgver}"
  patch -p1 < ${srcdir}/fix.patch
  mkdir -p "${srcdir}/build"
}

build() {
  cd "${srcdir}/build"
  CC=clang CXX=clang++ \
  cmake "${srcdir}/netcoredbg-${pkgver}" \
    -GNinja \
    -DDOTNET_DIR=/usr/share/dotnet \
    -DCMAKE_INSTALL_PREFIX=/usr/bin
  ninja
}

package() {
  cd build
  DESTDIR="$pkgdir" ninja install
}
