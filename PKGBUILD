# Maintainer: Tengfei Bao <tfbao92@163.com>

pkgname=fcitx5-sime
pkgver=2026.08.13
pkgrel=1
_appver=0.16.0
_enginever=2026.08.13
pkgdesc="Sime Chinese input method for Fcitx5"
arch=('x86_64')
url="https://github.com/Ismantic/SimeApp"
license=('Apache-2.0')
depends=('fcitx5' 'ncnn')
makedepends=('cmake')
source=(
  "SimeApp-${_appver}.tar.gz::https://github.com/Ismantic/SimeApp/archive/refs/tags/v${_appver}.tar.gz"
  "Sime-${_enginever}.tar.gz::https://github.com/Ismantic/Sime/archive/refs/tags/v${_enginever}.tar.gz"
  "sime-model-${_enginever}.tar.zst::https://github.com/Ismantic/Sime/releases/download/v${_enginever}/sime-model-${_enginever}.tar.zst"
)
sha256sums=(
  'd7b486e76fb7c2356bbd4a1c7f489744d5c951f4610762d83611e53605daea7b'
  '5029e5da55f3a468e650d2add7c67e974e8228f227c767e2c942e149fb8f1c21'
  '35ddd39724f252576be1de93a155b85aacd392f7f773966f4488b97c8f596d7c'
)

build() {
  cmake \
    -S "$srcdir/SimeApp-${_appver}/Linux/fcitx5" \
    -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSIME_NCNN_PROVIDER=SYSTEM \
    -DSIME_ENGINE_ROOT="$srcdir/Sime-${_enginever}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$srcdir/sime-model-${_enginever}/sime.dict" \
    "$pkgdir/usr/share/sime/sime.dict"
  install -Dm644 "$srcdir/sime-model-${_enginever}/sime.cnt" \
    "$pkgdir/usr/share/sime/sime.cnt"
  for asset in gru.embedding.i8 \
      gru.pinyin.ncnn.param gru.pinyin.ncnn.bin \
      gru.t9.ncnn.param gru.t9.ncnn.bin; do
    install -Dm644 "$srcdir/sime-model-${_enginever}/$asset" \
      "$pkgdir/usr/share/sime/$asset"
  done
}
