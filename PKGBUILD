# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=noutube-bin
_app_id="jp.nonbili.${pkgname%-bin}"
pkgver=0.3.0
pkgrel=1
pkgdesc="YouTube and YouTube Music in a single app. No ads."
arch=('x86_64')
url="https://oss.nonbili.jp/noutube"
license=('AGPL-3.0-or-later')
depends=(
  'alsa-lib'
  'gtk3'
  'nss'
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-linux-unpacked-$pkgver.zip::https://github.com/nonbili/NouTube-Desktop/releases/download/v$pkgver/linux-unpacked.zip"
        "${pkgname%-bin}.desktop")
noextract=("${pkgname%-bin}-linux-unpacked-$pkgver.zip")
sha256sums=('8014f6bab50f6639da335857d3c02a708a19b51eb2564c1f6f6e602bc1690d82'
            'f97f95638590d5cff6e620b09b752dfd356e54c99e949a6206d73a2715f7b614')

prepare() {
  mkdir -p "${pkgname%-bin}-$pkgver"
  bsdtar xf "${pkgname%-bin}-linux-unpacked-$pkgver.zip" -C "${pkgname%-bin}-$pkgver"
}

package() {
  cd "${pkgname%-bin}-$pkgver"
  install -d "$pkgdir/opt/${pkgname%-bin}"
  cp -r dist/linux-unpacked/* "$pkgdir/opt/${pkgname%-bin}/"
  rm "$pkgdir/opt/${pkgname%-bin}/resources/app-update.yml"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/${pkgname%-bin}/${pkgname%-bin}" "$pkgdir/usr/bin/"

  install -Dm644 "$srcdir/${pkgname%-bin}.desktop" -t \
    "$pkgdir/usr/share/applications/"
  install -Dm644 dist/linux-unpacked/resources/app.asar.unpacked/resources/icon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png"
}
