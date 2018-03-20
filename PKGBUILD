# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
_pkgname=gifski
pkgname=${_pkgname}-git
pkgver=0.8.2.r1.g33f3974
pkgrel=1
pkgdesc="GIF encoder based on libimagequant (pngquant, gifquant?). Squeezes maximum possible quality from the awful GIF format"
arch=('i686' 'x86_64')
url="https://gif.ski/"
license=('AGPL3')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
depends=(gcc-libs ffmpeg)
makedepends=(git rust clang)
source=(
  ${_pkgname}::git+https://github.com/ImageOptim/${_pkgname}.git
  dynamic-openmp.patch
)
sha256sums=(
  'SKIP'
  'be6480ba294bab01ae8651ca3b4c8cbcbe28f6bc920cc6afc2e9dd6c2c62d14f'
)

prepare() {
  cd "${srcdir}/${_pkgname}"
  patch -p1 -i ${srcdir}/dynamic-openmp.patch
}

build() {
  cd "${srcdir}/${_pkgname}"
  cargo build --release --features=video,openmp
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 target/release/gifski "$pkgdir/usr/bin/gifski"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
