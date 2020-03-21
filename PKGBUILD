# Creator: Sami Boukortt <sami@boukortt.com>
# Maintainer: milkii on freenode
pkgname=intersect.lv2-git
pkgver=1.3.r0.g18a45e4
pkgrel=1
pkgdesc="LV2 plugin to split 2 audio channels into 3."
arch=("$CARCH")
url="https://github.com/sboukortt/$pkgname"
license=('GPL')
groups=('lv2-plugins')
depends=('fftw')
makedepends=('git' 'meson' 'lv2')
optdepends=('lv2proc: for the `intersect` script')
source=("intersect.lv2-git::git+https://github.com/sboukortt/intersect-lv2.git")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd $pkgname
	mkdir -p build
	meson --buildtype=release --prefix=/usr build
	cd build
	ninja
}

package() {
  cd $pkgname
	cd build
	DESTDIR="$pkgdir" ninja install
}
