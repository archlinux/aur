# Maintainer: Tengfei Bao <tfbao92@163.com>

pkgname=fcitx5-sime
pkgver=2026.08.02
pkgrel=2
_appver=0.15.4
_enginever=2026.08.02
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
  'c4508d1c78332ec408d14044a0fc68320268a65d0e3c8475ee08746e6ccb997f'
  '99ada6fb8b3cebb6731412365f91f8cf7153cdd6f702a3b8c651d8bb73452ed7'
  '61d3ab6e6f0be2e902b1fe10b54eacdead7baa70748bd2f30891eacb2e5d5fa6'
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
