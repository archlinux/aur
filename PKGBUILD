# Maintainer: Erik B Knudsen <erik.knudsen@copenhagenatomics.com>
pkgname=mcxtrace
pkgver=3.2
pkgrel=1
pkgdesc="X-ray tracing software package for simulating beamlines, optics, and full experiments/measurements."
arch=("x86_64")
url="https://download.mcxtrace.org/current/linux/mcxtrace-src"
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
        "$pkgname-manuals-$pkgver-src.tar.gz::$url/$pkgname-manuals-$pkgver-src.tar.gz"
        "$pkgname-mcpl-$pkgver-src.tar.gz::$url/$pkgname-mcpl-$pkgver-src.tar.gz")
noextract=()
sha256sums=('a4a097b5be676ce603ae5e34462983232965e88dd5d9de679cae37b41d67c317'
            'de4350b1abbcece30e53f4057fc56e43477da9682f37aa608fd05c097596e6a5'
            'ff2d95fde5a08f290724dcef8414cda4a86c9f3a836416fc4df724428f58474e'
            '29c5944917b47cddd961acd738ca8b019c1abbbb5cd30931d9ed10b8d15e54a0')

build() {
  cmake -B build-kernel -S "$pkgname-$pkgver-src" -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_MCXTRACE=1
  cmake --build build-kernel
  for part in comps manuals mcpl; do
        cmake -B build-$part -S "$pkgname-$part-$pkgver-src" -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_MCXTRACE=1
        cmake --build build-$part
  done
}
check() {
  $srcdir/build-kernel/mcxtrace --version
}
package() {
  for part in kernel comps manuals mcpl; do 
        DESTDIR="$pkgdir/" cmake --install build-$part
  done 
}
