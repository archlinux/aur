# Maintainer: Tengfei Bao <tfbao92@163.com>

pkgname=fcitx5-sime
pkgver=2026.04.29
pkgrel=1
_appver=0.15.3
_enginever=2026.04.29
pkgdesc="Sime Chinese input method for Fcitx5"
arch=('x86_64')
url="https://github.com/Ismantic/SimeApp"
license=('Apache-2.0')
depends=('fcitx5')
makedepends=('cmake')
source=(
  "SimeApp-${_appver}.tar.gz::https://github.com/Ismantic/SimeApp/archive/refs/tags/v${_appver}.tar.gz"
  "Sime-${_enginever}.tar.gz::https://github.com/Ismantic/Sime/archive/refs/tags/v${_enginever}.tar.gz"
  "sime-model-${_enginever}.tar.zst::https://github.com/Ismantic/Sime/releases/download/v${_enginever}/sime-model-${_enginever}.tar.zst"
)
sha256sums=(
  '882d68bc82b36e4c388e059319be8a024f06284c67d92bfafbeb496f16ab83a6'
  'd224e1ec2933c5186dd73d5fb1be0206e658d83b8bfa3ecec729ae4a48b22b60'
  '840ac365d36b200f4e7ebdc168d9bfde5cd458eb71b16e0bf9ef1ef0fdd84333'
)

build() {
  cmake \
    -S "$srcdir/SimeApp-${_appver}/Linux/fcitx5" \
    -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSIME_ENGINE_ROOT="$srcdir/Sime-${_enginever}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$srcdir/sime-model-${_enginever}/sime.dict" \
    "$pkgdir/usr/share/sime/sime.dict"
  install -Dm644 "$srcdir/sime-model-${_enginever}/sime.cnt" \
    "$pkgdir/usr/share/sime/sime.cnt"
}
