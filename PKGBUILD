# Maintainer: Sandor Nagy <sandor[dot]nagy[at]kdemail[dot]net>
# Contributor: Mladen Pejaković <pejakm[at]autistici[dot]org>
# Contributor: Morealaz <morealaz@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Özgür Sarıer <ozgursarier1011601115[at]gmail[dot]com>

pkgname=viber
pkgver=4.2.2.6
pkgrel=16
pkgdesc="Proprietary cross-platform IM and VoIP software"
arch=('x86_64')
url="http://viber.com"
license=('custom')
depends=('gstreamer0.10-base' 'libxss') # 'qt5-imageformats' 'qt5-svg' 'qt5-websockets' 'sqlite2'
source=("http://download.cdn.viber.com/cdn/desktop/Linux/${pkgname}.deb"
        "eula.html"
        "viber")
sha256sums=('46b453aa2bad31d4ac3b4c58f7c2731ff194bb9545a819180d225a9d7e3262bb'
            '037194f911c193b039fd5bcdb5296f8d65e5075006d67822519b5bc7da0c8788'
            'ab2e0b8fe15b5411e7fb2e57210f2aa32ef288d418d739fc4c724d2641140d3c')

prepare() {
  cd "${srcdir}"
  tar -zxf data.tar.gz
  sed -e 's|Exec=/opt/viber/Viber|Exec=viber|g' \
      -e 's|Network;Application;|Network;Application;InstantMessaging;|g' \
      -e 's|/usr/share/pixmaps/viber.png|viber.png|g' \
      -i usr/share/applications/viber.desktop
}

package() {
  cd "${srcdir}"
  install -m 755 -d "${pkgdir}"/opt/viber/imageformats
  install -m 755 -d "${pkgdir}"/opt/viber/platforms
  install -m 755 -d "${pkgdir}"/opt/viber/sqldrivers
  install -m 755 -d "${pkgdir}"/opt/viber/Sound/{DTMF,Messages,PTT}
  install -Dm755 viber "${pkgdir}/usr/bin/viber"
  install -Dm644 eula.html "${pkgdir}/usr/share/licenses/viber/eula.html"
  install -Dm644 usr/share/applications/viber.desktop "${pkgdir}/usr/share/applications/viber.desktop"

  # must go into /opt - see following comments
  cd "${srcdir}/opt/viber"
  install -Dm755 Viber "${pkgdir}/opt/viber"

  # there's no AUR package for QFacebook yet, so leave this
  install -Dm644 libqfacebook.so "${pkgdir}/opt/viber"

  # qt5-quick1 package no longer available
  install -Dm644 libQt5Declarative.so.5 "${pkgdir}/opt/viber"

  # crashes without this, even if qt5-base installed
  install -Dm644 platforms/*.so "${pkgdir}/opt/viber/platforms"
  install -Dm644 {libQt5Core.so.5,libQt5DBus.so.5,libQt5Gui.so.5,libQt5Network.so.5,libQt5OpenGL.so.5,libQt5PrintSupport.so.5,libQt5Sql.so.5,libQt5Widgets.so.5} "${pkgdir}/opt/viber/"

  # crashes without this, even if qt5-imageformats installed
  install -Dm644 imageformats/*.so "${pkgdir}/opt/viber/imageformats"

  # crashes on image sending/recieving with system WebKit, so leave this for now
  install -Dm644 {libicudata.so.48,libicui18n.so.48,libicuuc.so.48,libQt5WebKit.so.5,libQt5WebKitWidgets.so.5} "${pkgdir}/opt/viber"

  # crashes without this, even if the right Qt5 package installed
  install -Dm644 {libQt5Qml.so.5,libQt5Quick.so.5,libQt5QuickWidgets.so.5} "${pkgdir}/opt/viber/" # qt5-declarative
  install -Dm644 libQt5Script.so.5 "${pkgdir}/opt/viber/" # qt5-script
  install -Dm644 libQt5Svg.so.5 "${pkgdir}/opt/viber/" # qt5-svg
  install -Dm644 libQt5WebSockets.so.5 "${pkgdir}/opt/viber/" # qt5-websockets
  install -Dm644 libQt5XmlPatterns.so.5 "${pkgdir}/opt/viber/" # qt5-xmlpatterns

  # crashes without this, even if sqlite2 installed
  install -Dm644 sqldrivers/libqsqlite.so "${pkgdir}/opt/viber/sqldrivers"

  # it appears that 'Sound' path is hardcoded to Viber binary directory
  install -Dm644 Sound/*.wav "${pkgdir}/opt/viber/Sound"
  install -Dm644 Sound/DTMF/*.wav "${pkgdir}/opt/viber/Sound/DTMF"
  install -Dm644 Sound/Messages/*.wav "${pkgdir}/opt/viber/Sound/Messages"
  install -Dm644 Sound/PTT/*.wav "${pkgdir}/opt/viber/Sound/PTT"
  install -Dm644 Sound/Ringtone/ringtone.wav "${pkgdir}/opt/viber/Sound/Ringtone/ringtone.wav"

  # install icons
  for isize in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256; do
    install -Dm644 icons/${isize}.png "${pkgdir}/usr/share/icons/hicolor/${isize}/apps/viber.png"
  done
  install -Dm644 icons/Viber.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/viber.svg"
}
