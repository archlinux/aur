# Maintainer: Gurov <gurov@disroot.org>
pkgname=rakuten-viber
pkgver=27.3.0.2
pkgrel=1
pkgdesc="A free messaging and calling app by Rakuten"
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
noextract=("$pkgname-$pkgver.deb")
options=('!strip')
source=("$pkgname-$pkgver.deb::https://download.cdn.viber.com/cdn/desktop/Linux/viber.deb")
sha256sums=('961534dc0cb920006ec7ae8108b0e1ba09a476eef1e13b4b370a79cd52dd20f3')

prepare() {
  cd "$srcdir"
  bsdtar -xf "$pkgname-$pkgver.deb"
  tar -xf control.tar.xz
  tar -xf data.tar.xz --exclude='./opt/viber/lib/libjpeg.so.8'
  sed -e 's|Exec=/opt/viber/Viber|Exec=viber|g' \
      -e 's|/usr/share/pixmaps/viber.png|viber.png|g' \
      -i usr/share/applications/viber.desktop
}

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/opt"
  cp -dpr --no-preserve=ownership opt/viber "$pkgdir/opt/"
  install -Dm644 usr/share/applications/viber.desktop \
    "$pkgdir/usr/share/applications/viber.desktop"
  install -Dm644 usr/share/icons/hicolor/scalable/apps/Viber.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/viber.svg"
  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/viber/Viber "$pkgdir/usr/bin/viber"
  install -Dm644 copyright "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
