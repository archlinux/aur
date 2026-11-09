
# Maintainer: Dylan Harkleroad <deehark87@gmail.com>

pkgname=gt3-revisited-git
pkgver=0.6.3.r4.g634adfa
pkgrel=1
pkgdesc="Open reimplementation of the Gran Turismo 3 A-Spec engine (latest Git version)"
arch=('x86_64')
url="https://github.com/matt-pulsipher/GT3-revisited"
license=('MIT')
depends=('glibc' 'gcc-libs' 'sdl3' 'zlib')
makedepends=('git' 'cmake' 'ninja')
optdepends=(
  'vulkan-icd-loader: Vulkan renderer support'
  'mesa: Mesa graphics drivers'
)
provides=('gt3-revisited')
conflicts=('gt3-revisited' 'gt3-revisited-bin')

source=(
  'git+https://github.com/matt-pulsipher/GT3-revisited.git'
  'gt3r.png::https://raw.githubusercontent.com/sxdot/GT3-revisited/master/gt3r.png'
)

sha256sums=(
  'SKIP'
  '60736ba89a11a51688e010119ad6b87d59732cadb041da28e7424b96168f3bfa'
)

pkgver() {
  cd "$srcdir/GT3-revisited"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-g/.g/'
}

build() {
  cd "$srcdir/GT3-revisited"

  cmake -S . -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DGT3R_BUILD_TESTS=OFF \
    -DGT3R_BUILD_TOOLS=ON \
    -DGT3R_FETCH_SDL=OFF

  cmake --build build --parallel
}

package() {
  cd "$srcdir/GT3-revisited"

  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 "$srcdir/gt3r.png" \
    "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/gt3r.png"
}
