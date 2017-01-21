# Maintainer: Sandor Nagy <sandor[dot]nagy[at]kdemail[dot]net>
# Contributor: Mladen Pejaković <pejakm[at]autistici[dot]org>
# Contributor: Morealaz <morealaz@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Özgür Sarıer <ozgursarier1011601115[at]gmail[dot]com>

pkgname=viber
pkgver=6.5.5.1481
pkgrel=1
pkgdesc="Proprietary cross-platform IM and VoIP software"
arch=('x86_64')
url="http://viber.com"
license=('custom')
depends=('libxss' 'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-renderutil' 'xcb-util-wm' 'libxss' 'openssl' 'libpulse' 'alsa-lib' 'nss' 'libxcomposite' 'libxcursor' 'libxdamage' 'libcurl-compat' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-ugly' 'gst-libav')
options=('!strip')
source=("http://download.cdn.viber.com/cdn/desktop/Linux/${pkgname}.deb"
        "eula.html"
        "viber")
md5sums=('b952d0c15184e665e8603b498159e48f'
         'd128190efcd7312829583e682cf46b98'
         '51943e698680b19eb85e66f4c3c22adf')

prepare() {
  cd "${srcdir}"
  tar -Jxf data.tar.xz
  sed -e 's|Exec=/opt/viber/Viber|Exec=viber|g' \
      -e 's|Network;Application;|Network;Application;InstantMessaging;|g' \
      -e 's|/usr/share/pixmaps/viber.png|viber.png|g' \
      -i usr/share/applications/viber.desktop
}

package() {
  cd "${srcdir}"
  install -m 755 -d "${pkgdir}"/opt/viber/
  install -Dm755 viber "${pkgdir}/usr/bin/viber"
  install -Dm644 eula.html "${pkgdir}/usr/share/licenses/viber/eula.html"
  install -Dm644 usr/share/applications/viber.desktop "${pkgdir}/usr/share/applications/viber.desktop"

  cp -r ${srcdir}/opt/viber/ "${pkgdir}/opt/"

  # install icons
  cd "${srcdir}/opt/viber/"
  for isize in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256; do
    install -Dm644 icons/${isize}.png "${pkgdir}/usr/share/icons/hicolor/${isize}/apps/viber.png"
  done
  install -Dm644 icons/Viber.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/viber.svg"
}
