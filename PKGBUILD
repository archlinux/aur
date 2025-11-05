# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=noutube-bin
_app_id="jp.nonbili.${pkgname%-bin}"
pkgver=0.1.9
pkgrel=1
pkgdesc="YouTube and YouTube Music in a single app. No ads."
arch=('x86_64')
url="https://github.com/nonbili/NouTube-Desktop"
license=('AGPL-3.0-or-later')
depends=(
  'alsa-lib'
  'gtk3'
  'nss'
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-linux-unpacked-$pkgver.zip::$url/releases/download/v$pkgver/linux-unpacked.zip")
noextract=("${pkgname%-bin}-linux-unpacked-$pkgver.zip")
sha256sums=('b05ebbbe43c7c1d76b55d3e980e93b3895830fb49b3d5f8ef8d24410a8f0549a')

prepare() {
  mkdir -p "${pkgname%-bin}-$pkgver"
  bsdtar xf "${pkgname%-bin}-linux-unpacked-$pkgver.zip" -C "${pkgname%-bin}-$pkgver"

  cd "${pkgname%-bin}-$pkgver"
  desktop-file-edit --set-key=Exec --set-value="${pkgname%-bin}-desktop" \
    --set-key=StartupWMClass --set-value=NouTube \
    "dist/linux-unpacked/flatpak/${_app_id}.desktop"
}

package() {
  cd "${pkgname%-bin}-$pkgver"
  install -d "$pkgdir/opt/${pkgname%-bin}"
  cp -r dist/linux-unpacked/* "$pkgdir/opt/${pkgname%-bin}/"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/${pkgname%-bin}/${pkgname%-bin}-desktop" "$pkgdir/usr/bin/"

  install -Dm644 "dist/linux-unpacked/flatpak/${_app_id}.desktop" -t \
    "$pkgdir/usr/share/applications/"
  install -Dm644 "dist/linux-unpacked/flatpak/${_app_id}.metainfo.xml" -t \
    "$pkgdir/usr/share/metainfo/"
  install -Dm644 dist/linux-unpacked/resources/app.asar.unpacked/resources/icon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/${_app_id}.png"

  rm -rf "$pkgdir/opt/${pkgname%-bin}/flatpak/"
}
