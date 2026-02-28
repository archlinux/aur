# Maintainer: Gurov <gurov@disroot.org>
pkgname=viber-appimage
pkgver=27.3.0.2
pkgrel=1
pkgdesc="Proprietary cross-platform IM and VoIP software (appimage)"
arch=('x86_64')
url='https://www.viber.com'
license=('LicenseRef-viber')
depends=(
  'alsa-lib'
  'gst-libav'
  'gst-plugins-bad'
  'gst-plugins-base'
  'gst-plugins-good'
  'gst-plugins-ugly'
  'libjpeg-turbo'
  'libpulse'
  'libxcomposite'
  'libxcursor'
  'libxdamage'
  'libxml2-legacy'
  'libxss'
  'libxslt'
  'nss'
  'numactl'
  'openssl'
  'snappy'
  'xcb-util-cursor'
  'xcb-util-image'
  'xcb-util-keysyms'
  'xcb-util-renderutil'
  'xcb-util-wm'
)
conflicts=('viber')
provides=('viber')
noextract=("$pkgname-$pkgver.AppImage")
options=('!strip')
source=("$pkgname-$pkgver.AppImage::https://download.cdn.viber.com/cdn/desktop/Linux/viber.AppImage")
sha256sums=('72005fe438b45902c64845cdbfce9aa9ae689a07f220ed4c9706b06bae0daecf')

prepare() {
  cd "$srcdir"
  chmod +x "$pkgname-$pkgver.AppImage"
  ./"$pkgname-$pkgver.AppImage" --appimage-extract
  sed -e 's|Exec=.*Viber|Exec=viber|g' \
      -e 's|Icon=.*|Icon=viber|g' \
      -i squashfs-root/viber.desktop
}

package() {
  cd "$srcdir/squashfs-root"

  install -dm755 "$pkgdir/opt/viber"
  cp -dpr --no-preserve=ownership . "$pkgdir/opt/viber/"
  rm -rf "$pkgdir/opt/viber/apprun-hooks"

  install -Dm644 viber.desktop "$pkgdir/usr/share/applications/viber.desktop"
  install -Dm644 viber.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/viber.png"

  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/viber/usr/bin/Viber "$pkgdir/usr/bin/viber"
}
