# Maintainer: dudemanguy <random342@airmail.cc>

pkgname=firefox-unbranded-release-bin
pkgver=66.0.3
pkgrel=1
pkgdesc="Official unbranded firefox release build"
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
_url="https://queue.taskcluster.net/v1/task/OY5EZrZKQKuaN2xBSaBH_g/runs/0/artifacts/public/build/target.tar.bz2"
source=(${_url}
        firefox.desktop)
sha256sums=('a4b0e4e7419862a57833ffd3ad289bdaf7e6e3fdecb82742ba8135db6ec72614'
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
