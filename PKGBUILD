# Maintainer: Frederik “Freso” S. Olesen <archlinux at freso.dk>
pkgname=obs-vertical-canvas
pkgver=1.5.2
pkgrel=1
pkgdesc='Add vertical canvas to OBS'
arch=('x86_64' 'x86_64_v3')
url='https://aitum.tv/products/vertical'
license=('GPL-2.0-or-later')
depends=('obs-studio')
makedepends=('cmake')
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/Aitum/$pkgname/archive/refs/tags/$pkgver.tar.gz
  qt_package_fix.patch
)
b2sums=('5bd95ef4d0d79a1c9e6353c0a44b715271b7a58258b198abefa0d15ba45ccb88dcf6eb74fb653f18cacf91ebc24db1f3aa0517df58064f7d837517b10d49df2f'
        '0e919afecd32dcae348ff31a08ad5261d8606db34047e00c67f45f4757a6fda0d1e7a48dac15696371162dc609b31f3a12cbbf6eca13d87c97973323015e3356')

prepare() {
  cd $pkgname-$pkgver
  for p in ../*.patch; do
    patch < $p
  done
}

build() {
  cd $pkgname-$pkgver
  cmake -S . -B build -DBUILD_OUT_OF_TREE=On --install-prefix "$pkgdir/usr" -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-Wno-error=deprecated-declarations"
  cmake --build build
}

package() {
  cd $pkgname-$pkgver
  cmake --install build
  rm -rf "$pkgdir"/usr/{data,obs-plugins}
}
