#  Maintainer: Blair Bonnett <blair.bonnett at gmail>

pkgname=ccr
pkgver=2.0.0
pkgrel=1
pkgdesc='Community codec repository: compression (and other) filters for netCDF/HDF5'
url='https://ccr.github.io/ccr/'
license=('BSD-3-Clause')
arch=('x86_64')

depends=(
  'sh'
  'glibc'
  'hdf5'
  'lz4'
  'netcdf'
)

source=(
  "ccr-$pkgver.tar.gz::https://github.com/ccr/ccr/archive/refs/tags/v${pkgver//./_}.tar.gz"
  'remove_old_tests.patch'
)
sha256sums=(
  'a9b12720265b5a4d694c3e43de66c3aa3bdafd59106cc0f1b6b82b966687d8e6'
  '84289938f2c05a4e235298a44fce06a50cabd620a61082f47ae036614a3a2bf6'
)

prepare() {
  cd "$pkgname-${pkgver//./_}"
  patch -p0 -i "$srcdir/remove_old_tests.patch"
  autoreconf -fiv
}

build() {
  cd "$pkgname-${pkgver//./_}"
  ./configure \
    --prefix=/usr \
    --with-hdf5-plugin-path=/usr/lib/hdf5/plugin
  make
}

check() {
  cd "$pkgname-${pkgver//./_}"
  make check
}

package() {
  cd "$pkgname-${pkgver//./_}"
  make DESTDIR="$pkgdir" install
  mkdir "$pkgdir/usr/lib/hdf5"
  mv "$pkgdir/usr/local/hdf5/lib/plugin" "$pkgdir/usr/lib/hdf5"
  rm -rf "$pkgdir/usr/local"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
