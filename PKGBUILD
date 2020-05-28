# Maintainer: das_kube
pkgname='aeron'
pkgver='1.28.0'
arch=('i686' 'x86_64')
pkgrel='1'
pkgdesc="Efficient reliable UDP unicast, UDP multicast, and IPC message transport "
url="https://github.com/real-logic/aeron"
source=("https://github.com/real-logic/aeron/archive/$pkgver.tar.gz"
        "aeronmd.service")
license=('Apache-2.0')
depends=('gcc-libs' 'gcc' 'cmake' 'zlib')
makedepends=('cmake')

ROOT="aeron-$pkgver"

build() {
  cd "$ROOT"
  echo "in $PWD"
  mkdir -p cppbuild/Release
  cd cppbuild/Release
  cmake ../.. -DCMAKE_BUILD_TYPE=Release
  cmake --build . --clean-first
}

#check() {
#  cd "$ROOT"
#  cd cppbuild/Release/
#  ctest
#}

package() {
  mkdir -p "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/usr/lib/"
  mkdir -p "$pkgdir/usr/include/"
  mkdir -p "$pkgdir/usr/lib/systemd/user"
  install -Dm755 "$ROOT/cppbuild/Release/binaries/aeronmd" "$pkgdir/usr/bin/aeronmd"
  install -Dm755 "$ROOT/cppbuild/Release/binaries/AeronStat" "$pkgdir/usr/bin/AeronStat"
  install -Dm655 "$ROOT/cppbuild/Release/lib/libaeron_client_shared.so" "$pkgdir/usr/lib/"
  install -Dm655 "$ROOT/cppbuild/Release/lib/libaeron_driver.so" "$pkgdir/usr/lib/"
  install -Dm655 "$ROOT/cppbuild/Release/lib/libaeron.so" "$pkgdir/usr/lib/"
  install -Dm655 "$ROOT/aeron-client/src/main/c/aeronc.h" "$pkgdir/usr/include/"
  install -Dm655 "aeronmd.service" "$pkgdir/usr/lib/systemd/user/aeronmd.service"
}
md5sums=('e090b280c237a2aa2eee30719ca9295b'
         '7ec78d21efed1477e37ba044c3f1b1b3')
