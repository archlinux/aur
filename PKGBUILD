pkgname=oceandl
pkgver=0.2.5
pkgrel=1
pkgdesc="Lightweight C++ CLI for downloading ocean/climate NetCDF datasets from NOAA PSL"
arch=('x86_64')
url='https://github.com/lainx86/oceandl'
license=('MIT')
depends=('curl' 'fmt' 'tomlplusplus')
makedepends=('cmake' 'ninja')
options=('!debug' '!lto')

_source_archive="oceandl-src-v${pkgver}.tar.gz"
_source_url="${OCEANDL_SOURCE_URL:-https://github.com/lainx86/oceandl/releases/download/v${pkgver}/${_source_archive}}"
_source_sha256="${OCEANDL_SOURCE_SHA256:-939509e732b4d56d31067a030fd0a4803c9064440c59bb2396406d50343001fd}"
_source_root="oceandl-v${pkgver}"

source=("${_source_archive}::${_source_url}")
sha256sums=("${_source_sha256}")

build() {
  local build_dir="${srcdir}/build"
  cmake -S "${srcdir}/${_source_root}" -B "${build_dir}" -G Ninja -DCMAKE_BUILD_TYPE=Release
  cmake --build "${build_dir}" --parallel
}

check() {
  local build_dir="${srcdir}/build"
  "${build_dir}/oceandl_tests"
}

package() {
  local build_dir="${srcdir}/build"
  DESTDIR="${pkgdir}" cmake --install "${build_dir}" --prefix /usr
}
