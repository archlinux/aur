# Maintainer: Madeline Mewmews <maddie@mewmews.gay>
# Contributor Melanie Scheirer <mel@nie.rs>

pkgname=aom-av1-lavish-git
pkgver=r33037.4141a59e1
pkgrel=1
pkgdesc="aomenc-av1 lavish fork"
url="https://github.com/Clybius/aom-av1-lavish"
arch=(x86_64)
provides=('aom' 'aom-git' 'libaom.so')
conflicts=('aom' 'aom-git')
license=(BSD custom:PATENTS)
depends=(gcc-libs vmaf libjxl-metrics-git)
makedepends=(cmake ninja yasm git)
source=(git+https://github.com/Clybius/aom-av1-lavish.git#branch=Endless_Merging)
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -S ${pkgname%-git} -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCONFIG_TUNE_VMAF=1 \
    -DCONFIG_TUNE_BUTTERAUGLI=1 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DCONFIG_AV1_ENCODER=1 \
    -DCONFIG_AV1_DECODER=1 \
    -DBUILD_SHARED_LIBS=1 \
    -DENABLE_TESTS=0
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 ${pkgname%-git}/{LICENSE,PATENTS}
}
