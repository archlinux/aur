# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=ydotool
pkgver=0.1.8
pkgrel=1
pkgdesc="Generic command-line automation tool (no X!)"
arch=('x86_64')
depends=('libevdevplus' 'libuinputplus' 'boost-libs')
makedepends=('cmake' 'ninja' 'boost')
url="https://github.com/ReimuNotMoe/ydotool"
license=('MIT')
source=("$url/archive/v$pkgver.tar.gz"
        "710e77f160eee194f988039620d2f50604560c9b.patch")
sha256sums=('6ebc4ede0a11aa7ced6b52637a4a59cc1528b4c5ed54478d38f0248a40b40a07'
            'd45bfc90836a615b2a269642cdb903ac33376b8d4bf6c287fbe1ab209bcf9566')

prepare() {
  cd "$pkgname-$pkgver"
  # backport of an upstream fix
  patch -sp1 -i ../710e77f160eee194f988039620d2f50604560c9b.patch
}

build() {
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DSTATIC_BUILD=0 \
    -G Ninja \
    -S "$pkgname-$pkgver" -B build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
