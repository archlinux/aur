# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=python-pysilero-vad
pkgver=3.3.1
pkgrel=2
pkgdesc="voice activity detector using silero-vad"
url="https://github.com/rhasspy/pysilero-vad"
license=('MIT')
arch=('any')
depends=('python')
makedepends=("cmake" "python-scikit-build-core" "python-setuptools")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('931660d79a888c2002a5cfeec8cdd33c584b8b4659ccbbb620f95aacd7072b11')

build() {
  cmake -S pysilero-vad-$pkgver -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -GNinja
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 pysilero-vad-$pkgver/LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
# Fix packaging
  pyver="$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')"
  cd "$pkgdir/usr"
  rm -dr include lib
  mkdir -p lib/python$pyver/site-packages
  mv pysilero_vad "lib/python$pyver/site-packages"
}
