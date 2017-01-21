# Maintainer: Valentin Rouet <v.rouet@gmail.com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=drmr-falktx
pkgname="${_pkgname}-git"
pkgver=0.1.r118.0c2c794
pkgrel=1
pkgdesc="DrMr is an LV2 sampler plugin that can play Hydrogen drumkits. This version enables plugin state saving using strings."
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/falkTX/drmr"
groups=('lv2-plugins')
depends=('libsndfile' 'libsamplerate' 'expat' 'lv2' 'gtk2')
makedepends=('git')
provides=('drmr' "${_pkgname}")
conflicts=('drmr' "${_pkgname}")
source=("${_pkgname}::git+https://github.com/falkTX/drmr.git")
md5sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"
  version="$(git describe --tags | sed -e 's/^v//;s/^[^-]*-//;s/-.*//')"
  revision=$(git rev-list --count HEAD)
  hash=$(git rev-parse --short HEAD)
  echo $version.r$revision.$hash
}

build() {
  cd "${srcdir}/${_pkgname}"

  mkdir -p build
  cd build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  make DESTDIR="$pkgdir/" install
}
