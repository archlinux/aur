# Creator: Sami Boukortt <sami@boukortt.com>
# Maintainer: milkii on freenode
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=intersect.lv2
pkgname="${_pkgname}-git"
pkgver=1.3.r0.g18a45e4
pkgrel=1
pkgdesc="LV2 plugin to split 2 audio channels into 3."
arch=("$CARCH")
url="https://github.com/sboukortt/${_pkgname//./-}"
license=('GPL')
groups=('lv2-plugins' 'pro-audio')
provides=("${_pkgname}" "${_pkgname}=${pkgver//.r*/}")
conflicts=("${_pkgname}")
depends=('fftw')
makedepends=('git' 'meson' 'lv2')
optdepends=('lv2proc: for the `intersect` script')
source=("${_pkgname//./-}::git+https://github.com/sboukortt/${_pkgname//./-}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname//./-}"
  (
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_pkgname//./-}"
  mkdir -p build
  meson --buildtype=release --prefix=/usr build
  ninja -C build
}

package() {
  cd "${srcdir}/${_pkgname//./-}/build"
  DESTDIR="$pkgdir" ninja install
}
