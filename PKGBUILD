# Maintainer: antsa <asss1924 <plus> aur <at> gmail <dot> com>
# Contributor: Gordin <9ordin@gmail.com>

pkgname=firefox-nightly-de-bin
pkgdesc='Standalone Web Browser from Mozilla — Nightly build (de-DE)'
url='https://www.mozilla.org/de-DE/firefox/nightly'
pkgver=147.0a1.20251111
pkgrel=1
_version=147.0a1
arch=('x86_64')
license=('MPL' 'GPL' 'LGPL')

source=('firefox-nightly.desktop' 'policies.json')
source_x86_64=("https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/firefox-${_version}.de.linux-x86_64.tar.xz"{,.asc})

sha512sums=('1e3e5f64ed2847e54efdc89d6c4c24bcd9a748fa0488a98bac0d27fe946ce6e4be6ccb4c41fbd7cc7142d20ef91291ca87f8d6c39093af390cd163743a950cf5'
  '5ed67bde39175d4d10d50ba5b12063961e725e94948eadb354c0588b30d3f97d2178b66c1af466a6e7bd208ab694227a1391c4141f88d3da1a1178454eba5308')
sha512sums_x86_64=('SKIP' 'SKIP')
validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353')

depends=('dbus-glib' 'gtk3' 'libxt' 'nss' 'mime-types')
optdepends=('pulseaudio: audio support'
            'ffmpeg: h.264 video'
            'gtk2: flash plugin support'
            'hunspell: spell checking'
            'hyphen: hyphenation'
            'libnotify: notification integration'
            'networkmanager: location detection via available WiFi networks'
            'speech-dispatcher: text-to-speech'
            'startup-notification: support for FreeDesktop Startup Notification')

conflicts=('firefox-nightly-bin' 'firefox-nightly-de')
provides=('firefox-nightly-bin' 'firefox-nightly-de')
replaces=('firefox-nightly-de')

pkgver() {
  # Use Last-Modified Header from server
  #echo "${_version}.$(curl -sI https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/firefox-${_version}.de.linux-${arch}.tar.bz2 | grep -i Last-Modified | cut -c16- | date -f- '+%Y%m%d')"
  
  # Use BuildID from platform.ini
  echo "${_version}.$(awk -F "=" '/BuildID/ {print $2}' "${srcdir}/firefox/platform.ini" | cut -c-8)"
}

package() {
  install -d "${pkgdir}"/{usr/{bin,share/{applications,pixmaps}},opt}
  cp -r firefox "${pkgdir}/opt/firefox-nightly"
  ln -s /opt/firefox-nightly/firefox "${pkgdir}/usr/bin/firefox-nightly"

  install -m644 "${srcdir}"/firefox-nightly.desktop "${pkgdir}/usr/share/applications/"

  install -m644 "${srcdir}/firefox/browser/chrome/icons/default/default128.png" "${pkgdir}/usr/share/pixmaps/firefox-nightly-icon.png"

  # Disabling auto updates
  install -Dm644 "${srcdir}/policies.json" -t "${pkgdir}/opt/firefox-nightly/distribution"
}
