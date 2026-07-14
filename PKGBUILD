# Maintainer: Rohit Goswami (HaoZeke) <rohit.goswami@aol.com>
pkgname=flowy-code
_name=flowy
pkgver=1.0.0
pkgrel=1
pkgdesc="Probabilistic lava emplacement simulator (Mr. Lava Loba reimplementation)"
arch=('x86_64')
url='https://github.com/flowy-code/flowy'
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'xtensor' 'xtl' 'fmt')
makedepends=('meson' 'ninja' 'cmake' 'git' 'pkgconf' 'xtensor' 'xtl' 'xtensor-blas' 'openblas' 'fmt' 'argparse')
optdepends=('netcdf-cxx: NetCDF topography I/O (-Dwith_netcdf=true)')
provides=('flowy-lava')
source=("$_name-$pkgver.tar.gz::https://github.com/flowy-code/flowy/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c2107efbfdf127536073c90d8730127c822396b20deb86752917728633018f21')

prepare() {
  cd "$_name-$pkgver"
  meson subprojects download || true
  # flowy 1.0.0 targets pre-0.26 xtensor layout; Arch ships 0.27 reorganized headers
  find . \( -name '*.hpp' -o -name '*.cpp' -o -name '*.h' -o -name '*.cc' \) -print0 \
    | xargs -0 sed -i \
      -e 's|xtensor/xbuilder\.hpp|xtensor/generators/xbuilder.hpp|g' \
      -e 's|xtensor/xmanipulation\.hpp|xtensor/misc/xmanipulation.hpp|g' \
      -e 's|xtensor/xmath\.hpp|xtensor/core/xmath.hpp|g' \
      -e 's|xtensor/xtensor_forward\.hpp|xtensor/core/xtensor_forward.hpp|g' \
      -e 's|xtensor/xcsv\.hpp|xtensor/io/xcsv.hpp|g' \
      -e 's|xtensor/xfixed\.hpp|xtensor/containers/xfixed.hpp|g' \
      -e 's|xtensor/xtensor\.hpp|xtensor/containers/xtensor.hpp|g' \
      -e 's|xtensor/xview\.hpp|xtensor/views/xview.hpp|g' \
      -e 's|xtensor/xsort\.hpp|xtensor/misc/xsort.hpp|g' \
      -e 's|xtensor/xtensor_config\.hpp|xtensor/core/xtensor_config.hpp|g' \
      -e 's|xtensor/xarray\.hpp|xtensor/containers/xarray.hpp|g' \
      -e 's|xtensor/xadapt\.hpp|xtensor/containers/xadapt.hpp|g' \
      -e 's|xtensor/xio\.hpp|xtensor/io/xio.hpp|g' \
      -e 's|xtensor/xrandom\.hpp|xtensor/generators/xrandom.hpp|g'
}

build() {
  cd "$_name-$pkgver"
  meson setup build \
    --prefix=/usr \
    --buildtype=plain \
    -Dbuild_tests=false \
    -Dwith_netcdf=false \
    -Dbuild_exe=true \
    -Dbuild_shared_lib=true \
    --wrap-mode=default
  meson compile -C build
}

package() {
  cd "$_name-$pkgver"
  meson install -C build --destdir "$pkgdir"
}
