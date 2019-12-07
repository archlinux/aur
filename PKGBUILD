# Maintainer: Sandor Nagy <sandor[dot]nagy[at]kdemail[dot]net>
# Contributor: Mladen Pejaković <pejakm[at]autistici[dot]org>
# Contributor: Morealaz <morealaz@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Özgür Sarıer <ozgursarier1011601115[at]gmail[dot]com>

pkgname=viber
pkgver=12.0.0.7
pkgrel=1
pkgdesc="Proprietary cross-platform IM and VoIP software"
arch=('x86_64')
url='https://www.viber.com'
license=('custom')
depends=('libxss' 'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-renderutil' 'xcb-util-wm' 'libxss'
	'openssl' 'libpulse' 'alsa-lib' 'nss' 'libxcomposite' 'libxcursor' 'libxdamage'
	'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-ugly' 'gst-libav' 'libxslt' 'openssl-1.0')
options=('!strip')
source=("$pkgname-$pkgver.deb::https://download.cdn.viber.com/cdn/desktop/Linux/viber.deb")
sha256sums=('bfc771fec15dacf4b1cbc6e64b7217c0ea14ce216a5e66f17022de255099d898')

prepare() {
  cd "$srcdir"

  tar -xf control.tar.gz
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
