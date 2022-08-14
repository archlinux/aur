# Maintainer: Sandor Nagy <sandor[dot]nagy[at]kdemail[dot]net>
# Contributor: Mladen Pejaković <pejakm[at]autistici[dot]org>
# Contributor: Morealaz <morealaz@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Özgür Sarıer <ozgursarier1011601115[at]gmail[dot]com>

pkgname=viber
pkgver=18.2.0.2
pkgrel=2
pkgdesc="Proprietary cross-platform IM and VoIP software"
arch=('x86_64')
url='https://www.viber.com'
license=('custom')
depends=('libxss' 'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-renderutil' 'xcb-util-wm' 'libxss'
	'openssl' 'libpulse' 'alsa-lib' 'nss' 'libxcomposite' 'libxcursor' 'libxdamage'
	'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-ugly' 'gst-plugins-bad' 'gst-libav' 'libxslt' 'openssl-1.0')
options=('!strip')
source=("$pkgname-$pkgver.deb::https://download.cdn.viber.com/cdn/desktop/Linux/viber.deb")
sha256sums=('b63caf7f5aa3cf39cf3bb60fade79ba3f0a8a809f77d1fdd7cabb04ff066eff7')

prepare() {
  cd "$srcdir"

  tar -xf control.tar.xz
  tar -Jxf data.tar.xz
  sed -e 's|Exec=/opt/viber/Viber|Exec=viber|g' \
      -e 's|/usr/share/pixmaps/viber.png|viber.png|g' \
      -i usr/share/applications/viber.desktop
}

package() {
  cd "$srcdir"

  install -dm755 "$pkgdir/opt"
  cp -r "$srcdir/opt/viber/" "$pkgdir/opt/"
  install -Dm644 usr/share/applications/viber.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 copyright "$pkgdir/usr/share/licenses/viber/LICENSE"

  install -dm755 "$pkgdir/usr/bin/"
  ln -s /opt/viber/Viber "$pkgdir/usr/bin/viber"

  # install icons
  cd "$srcdir/opt/viber/"
  for iconsize in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256; do
    install -Dm644 icons/$iconsize.png "$pkgdir/usr/share/icons/hicolor/$iconsize/apps/viber.png"
  done
  install -Dm644 icons/Viber.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/viber.svg"
}
