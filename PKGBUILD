# Maintainer : Félix Saparelli <felix @ passcod.name>
# Contributor: Cedric MATHIEU <me.xenom @ gmail.com>
# Contributor: coderoar <coderoar @ gmail.com>
# Contributor: Det <nimetonmaili @ gmail.com>
# Contributor: kang <kang @ mozilla.com>
# Contributor: John Reese <jreese @ noswap.com>
# Contributor: Paul Vinieratos <pvinis @ gmail.com>

pkgname=firefox-always-nightly
pkgdesc='Standalone web browser from mozilla.org, nightly build, always updating'
url='https://blog.nightly.mozilla.org/'
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')

pkgver=999.0a1 # High number so we're always picked up for upgrade
pkgrel=23 # Actual revision of this script (but has no other effect because of above)

# Go through the hierarchy of dated builds, as the checksums there are
# generated within 4-5 minutes, instead of several hours in latest/
declare -A _build
_build=(
  ["repo"]="https://ftp.mozilla.org/pub/firefox/nightly"
  ["year"]="$(curl -s ${_build[repo]}/ | grep -Eo '20[0-9]{2}/' | sort | tail -n1 | cut -c1-4)"
  ["month"]="$(curl -s ${_build[repo]}/${_build[year]}/ | grep -Eo '>[0-9]{2}/' | sort | tail -n1 | cut -c2-3)"
  ["date"]="$(curl -s ${_build[repo]}/${_build[year]}/${_build[month]}/ | grep -Eo '20[0-9-]+-mozilla-central/' | sort | tail -n1 | cut -c1-19)"
  ["url"]="${_build[repo]}/${_build[year]}/${_build[month]}/${_build[date]}-mozilla-central"
  ["version"]="$(curl -s ${_build[url]}/ | grep -Eo '[0-9]+.0a1' | head -n1)"
  ["id"]="${_build[date]//-/}"
  ["tarball"]="firefox-${_build[version]}.en-US.linux-$CARCH.tar.bz2"
  ["checksums"]="firefox-${_build[version]}.en-US.linux-$CARCH.checksums"
  ["tarsum"]="$(curl -s ${_build[url]}/${_build[checksums]} | grep -E "sha512 [0-9]+ ${_build[tarball]}$" | cut -d\  -f1)"
)

# That should cut down on the number of people needlessly commenting/marking outdated
if [[ -z "${_build[tarsum]}" ]]; then
  echo "$pkgname ${_build[version]} build ${_build[date]}"
  echo "Missing checksums file! It must be getting generated. Retry in 5 minutes."
  exit 1
fi

# Necessary to 'cache' the value until pkgver() is run, otherwise it's blank
_pkgver="${_build[version]}.${_build[id]}"
pkgver() {
  echo $_pkgver
}

source=("${pkgname}-${_build[id]}.tar.bz2::${_build[url]}/${_build[tarball]}"
        'http://design.firefox.com/product-identity/firefox-nightly/firefox-logo-nightly.svg'
        'firefox-nightly.desktop'
        'firefox-nightly-safe.desktop')
sha512sums=("${_build[tarsum]}"
            'f07445bbb6c97a803062b498c81063414ba83660d746ba5abd712d9c8e8e1469df9a015163ad8548298604630e1bfe586d78fb64f9966506770a2c45ae5be323'
            'e83bc6604c21d0f53845fb87abc4fd3a50c4375747d1c770322edf5bee6e7f21c46f1fd98269b44889f0c5fa69ac572302c6f184ce11b3ea371ce1ac3c469b39'
            'd5395d3d6afb812ac3dd3b1526d724ffbe0cd761594fc461ae353b071b09c4e4ac9357ab8a6487073fe52e295511acf0039585fc64961de21dee944027d523dd')

depends=('dbus-glib' 'gtk3' 'libxt' 'mime-types' 'nss')
optdepends=('pulseaudio: audio support'
            'ffmpeg: h.264 video'
            'gtk2: flash plugin support'
            'hunspell: spell checking'
            'hyphen: hyphenation'
            'libnotify: notification integration'
            'networkmanager: location detection via available WiFi networks'
            'speech-dispatcher: text-to-speech'
            'startup-notification: support for FreeDesktop Startup Notification')

provides=('firefox-nightly')
conflicts=('firefox-nightly')

# .install file sets permissions and echoes message for automatic updates
install="${pkgname}.install"

package() {
  install -d "${pkgdir}"/{usr/{bin,share/{applications,pixmaps}},opt}
  cp -r firefox "${pkgdir}/opt/firefox-nightly"

  # Set the group permissions in the pkgball instead of the .install
  # so pacman doesn't warn about mismatched modes during upgrades
  chmod -R g+w "${pkgdir}/opt/firefox-nightly"

  ln -s /opt/firefox-nightly/firefox "${pkgdir}/usr/bin/firefox-nightly"
  install -Dm644 "${srcdir}"/{firefox-nightly.desktop,firefox-nightly-safe.desktop} "${pkgdir}/usr/share/applications/"
  install -Dm644 "${srcdir}/firefox-logo-nightly.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/firefox-nightly.svg"
  install -Dm644 "${srcdir}/firefox/browser/chrome/icons/default/default128.png" "${pkgdir}/usr/share/pixmaps/firefox-nightly.png"
  install -Dm644 "${srcdir}/firefox/browser/chrome/icons/default/default128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/firefox-nightly.png"
}
