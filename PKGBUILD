# Maintainer: Melanie Scheirer <mel@nie.rs>

pkgname=aom-av1-psy-git
pkgver=r32575.76388f643
pkgrel=1
pkgdesc="aomenc-av1 psy fork"
url="https://github.com/BlueSwordM/aom-av1-psy"
arch=(x86_64)
provides=(aom)
conflicts=(aom)
license=(BSD custom:PATENTS)
depends=(gcc-libs vmaf)
makedepends=(cmake ninja yasm)
source=(git+https://github.com/BlueSwordM/aom-av1-psy.git#branch=full_build-alpha-4)
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -S ${pkgname%-git} -B build -G Ninja \
    -DCONFIG_TUNE_VMAF=1 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=1 \
    -DENABLE_TESTS=0
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 ${pkgname%-git}/{LICENSE,PATENTS}
}
