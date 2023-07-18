# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgname=rocm-bandwidth-test
pkgver=5.6.0
pkgrel=1
pkgdesc="Bandwidth test for ROCm"
arch=('x86_64')
url="https://github.com/RadeonOpenCompute/rocm_bandwidth_test"
license=('custom:NCSAOSL')
depends=('hsa-rocr')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/rocm-$pkgver.tar.gz"
	"$pkgname-hsa-include.patch")
sha256sums=('ae2f7263a21a3a650068f43e3112b2b765eea80a5af2297572f850c77f83c85e'
            '8c3be607d36fb5aa01f770c244c5d4088dffddf879a21a9e0ac80d6dbcd2dbdf')
_dirname="$(basename "$url")-$(basename "${source[0]}" .tar.gz)"

prepare() {
  cd "$_dirname"
  patch -Np1 -i "$srcdir/$pkgname-hsa-include.patch"
}

build() {
  cmake \
    -Wno-dev \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -S "$_dirname" \
    -DCMAKE_INSTALL_PREFIX=/opt/rocm
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$_dirname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
