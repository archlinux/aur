# Maintainer: Sandor Nagy <sandor[dot]nagy[at]kdemail[dot]net>
# Contributor: Mladen Pejaković <pejakm[at]autistici[dot]org>
# Contributor: Morealaz <morealaz@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Özgür Sarıer <ozgursarier1011601115[at]gmail[dot]com>

pkgname=viber
pkgver=6.0.1.5
pkgrel=2
pkgdesc="Proprietary cross-platform IM and VoIP software"
arch=('x86_64')
url="http://viber.com"
license=('custom')
depends=('libxss' 'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-renderutil' 'xcb-util-wm' 'libcurl-compat')
options=('!strip')
source=("http://download.cdn.viber.com/cdn/desktop/Linux/${pkgname}.deb"
        "eula.html"
        "viber")
sha256sums=('712d6d21b0e8dbd6cf4589f37615d6b65a2b3d99bcf012396d6219b3afb8db08'
            '037194f911c193b039fd5bcdb5296f8d65e5075006d67822519b5bc7da0c8788'
            'b58bc642de9ba931eadb3743ca4b6dea93f6e21dd33cc181f62fef08843a8f99')

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
