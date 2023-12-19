# Maintainer: Erik B Knudsen <erik.knudsen@copenhagenatomics.com>
pkgname=mcstas
pkgver=3.4
pkgrel=1
pkgdesc="neutron ray tracing software package for simulating instruments, optics, and full experiments/measurements."
arch=("x86_64")
url="https://download.mcstas.org/current/linux/src/"
license=('GPL')
groups=()
depends=()
makedepends=("cmake")
optdepends=("NeXus: output binary data in NeXus format" "openmpi: parallelization")
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver-src.tar.gz::$url/$pkgname-$pkgver-src.tar.gz"
        "$pkgname-comps-$pkgver-src.tar.gz::$url/$pkgname-comps-$pkgver-src.tar.gz"
        "$pkgname-manuals-$pkgver-src.tar.gz::$url/$pkgname-manuals-$pkgver-src.tar.gz")
noextract=()
sha256sums=('b48310a8859e768e4aca56810bc5dc7bdd67b9e39f6464f5a7cef4c631d07e53'
            '05e9279731c901d980fba922337e76c7d87d8f2c2c1ac7fc9238a06e00f0052c'
            '4f095d212bbcd8ee6ce15c61015e7c89bcfd9be5d7cf25a3156b8077c98bbeb2')

build() {
  cmake -B build-kernel -S "$pkgname-$pkgver-src" -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_MCSTAS=1
  cmake --build build-kernel
  for part in comps manuals mcpl; do
        cmake -B build-$part -S "$pkgname-$part-$pkgver-src" -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_MCSTAS=1
        cmake --build build-$part
  done
}
check() {
  $srcdir/build-kernel/mcstas --version
}
package() {
  for part in kernel comps manuals mcpl; do 
        DESTDIR="$pkgdir/" cmake --install build-$part
  done 
}
