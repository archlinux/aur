# Maintainer: vitamin1980 <vitamin.novgorod @ yandex.ru>
# Contributor: McModder <mcmodder @ mcmodder.ru>
# Contributor: Denis Vadimov <me @ bloody.pw>

_version=73.0a1
_baseurl="https://download-installer.cdn.mozilla.net/pub/firefox/nightly/latest-mozilla-central-l10n/"
_date="$(date +%Y%m%d)"
_filename="firefox-${_version}.ru.linux"
pkgname=firefox-nightly-ru
pkgver=73.0a1
pkgrel=1
pkgdesc='Standalone Web Browser from Mozilla — Nightly build (ru)'
arch=('i686' 'x86_64')
url='http://nightly.mozilla.org/'
license=('MPL' 'GPL' 'LGPL')
depends=('dbus-glib' 'gtk3' 'libxt' 'nss' 'mime-types')
optdepends=('pulseaudio: audio support'
            'ffmpeg: h.264 video'
            'hunspell: spell checking'
            'hyphen: hyphenation'
            'libnotify: notification integration'
            'networkmanager: location detection via available WiFi networks'
            'speech-dispatcher: text-to-speech'
            'startup-notification: support for FreeDesktop Startup Notification'
            'jq: updater script support'
            'zenity: updater script support')
conflicts=('firefox-nightly')
source=('firefox-nightly.desktop'
        'policies.json')
source_i686=("${_date}-${_filename}.tar.bz2::${_baseurl}${_filename}-i686.tar.bz2"
        "${_date}-${_filename}.tar.bz2.asc::${_baseurl}${_filename}-i686.tar.bz2.asc")
source_x86_64=("${_date}-${_filename}.tar.bz2::${_baseurl}${_filename}-x86_64.tar.bz2"
        "${_date}-${_filename}.tar.bz2.asc::${_baseurl}${_filename}-x86_64.tar.bz2.asc")
sha512sums=('02bd8c8c717e6796fb1772f51c1bfd78ff3ca7c5355c08b9568dc36cb72b8b84330d20522653eedda12bdec1517cd4074a4bc5d51a8667880121e946b85c11ec'
            '5ed67bde39175d4d10d50ba5b12063961e725e94948eadb354c0588b30d3f97d2178b66c1af466a6e7bd208ab694227a1391c4141f88d3da1a1178454eba5308')
sha512sums_i686=('SKIP' 'SKIP')
sha512sums_x86_64=('SKIP' 'SKIP')
validpgpkeys=("14F26682D0916CDD81E37B6D61B7B526D98F0353")

pkgver() {
  # extract BuildID from firefox application.ini
  echo "${_version}.$(grep BuildID= $srcdir/firefox/application.ini | cut -d'=' -f2)"
}

package() {
  mkdir -p "${pkgdir}"/{usr/{bin,share/{applications,pixmaps}},opt}
  cp -r firefox "${pkgdir}/opt/firefox-nightly-ru"
  mkdir -p "${pkgdir}/opt/firefox-nightly-ru/distribution/"
  ln -s /opt/firefox-nightly-ru/firefox "${pkgdir}/usr/bin/firefox-nightly"

  # Install .desktop
  install -m644 "${srcdir}/firefox-nightly.desktop" "${pkgdir}/usr/share/applications/"

  # Install icons
  install -m644 "${srcdir}/firefox/browser/chrome/icons/default/default128.png" "${pkgdir}/usr/share/pixmaps/firefox-nightly-icon.png"

  # Disable auto updates
  install -Dm644 "${srcdir}/policies.json" "${pkgdir}/opt/firefox-nightly-ru/distribution"

  # Use system-provided dictionaries
  rm -rf "${pkgdir}/opt/firefox-nightly-ru/{dictionaries,hyphenation}"
  ln -sf /usr/share/hunspell "${pkgdir}"/opt/firefox-nightly-ru/dictionaries
  ln -sf /usr/share/hyphen "${pkgdir}"/opt/firefox-nightly-ru/hyphenation
}
