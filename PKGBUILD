# Maintainer: dudemanguy <random342@airmail.cc>
# Contributor: LA-MJ <4mr.minj+aur [at] g-mail>

pkgname=firefox-unbranded-bin
pkgver=67.0.4
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org - Unbranded version"
arch=('x86_64')
url=https://wiki.mozilla.org/Add-ons/Extension_Signing#Unbranded_Builds
provides=(firefox=$pkgver)
conflicts=(firefox)
license=('MPL' 'GPL' 'LGPL')
depends=('dbus-glib' 'gtk3' 'libxt' 'nss' 'mime-types')
optdepends=('pulseaudio: audio support'
            'ffmpeg: h.264 video'
            'hunspell: spell checking'
            'hyphen: hyphenation'
            'libnotify: notification integration'
            'networkmanager: location detection via available WiFi networks'
            'speech-dispatcher: text-to-speech'
            'startup-notification: support for FreeDesktop Startup Notification')
_url="https://queue.taskcluster.net/v1/task/OzOcWy0QSOmY-GMj7g_qXA/runs/0/artifacts/public/build/target.tar.bz2"
source=(${_url}
        firefox.desktop)
sha256sums=('b8f5ea2978c710bd778d42d90aabcd74072bfc6bf8067584d6b1b217d1294ff2'
            '4a783dca1f88e003c72f32d22719a0915f3fa576adbc492240e7cc250246ce10')

package() {
  OPT_PATH="/opt/firefox"
  install -d "${pkgdir}"/{usr/bin,opt}
  cp -r firefox "${pkgdir}"/${OPT_PATH}
  ln -s "/${OPT_PATH}/firefox" "${pkgdir}"/usr/bin/firefox

  # Install .desktop files
  install -Dm644 "${srcdir}"/firefox.desktop -t "${pkgdir}"/usr/share/applications

  # Install Icons
  SRC_LOC="${srcdir}"/firefox/browser
  DEST_LOC="${pkgdir}"/usr/share/icons/hicolor
  for i in 16 32 48 64 128
  do
    install -Dm644 "${SRC_LOC}"/chrome/icons/default/default${i}.png "${DEST_LOC}"/${i}x${i}/apps/firefox.png
  done

  # Use system-provided dictionaries
  rm -rf "${pkgdir}"/${OPT_PATH}/{dictionaries,hyphenation}
  ln -sf /usr/share/hunspell "${pkgdir}"/${OPT_PATH}/dictionaries
  ln -sf /usr/share/hyphen "${pkgdir}"/${OPT_PATH}/hyphenation
}
