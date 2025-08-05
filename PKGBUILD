#  Maintainer: Blair Bonnett <blair.bonnett at gmail>

pkgname=ccr
pkgver=1.3.0
pkgrel=2
pkgdesc='Community codec repository: compression (and other) filters for netCDF/HDF5'
url='https://ccr.github.io/ccr/'
license=('BSD-3-Clause')
arch=('x86_64')

depends=(
  'sh'
  'bzip2'
  'glibc'
  'hdf5'
  'netcdf'
  'zstd'
)

source=(
  "https://github.com/ccr/ccr/releases/download/v${pkgver//./_}/ccr-$pkgver.tar.gz"
  'update_netcdf_macros.patch'
)
sha256sums=(
  'bb892e3319e5d748e29453f801286ec2f82bf4074f2f86de0e9b1ba5f08995c6'
  '2caaad65f1c9d3615719d2639f23c733ac3585e61427d05f79f26823e753ebff'
)

prepare() {
  cd "$pkgname-$pkgver"
  patch -p0 -i "$srcdir/update_netcdf_macros.patch"
}

build() {
  cd "$pkgname-$pkgver"
  ./configure \
    --prefix=/usr \
    --with-hdf5-plugin-path=/usr/lib/hdf5/plugin
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
