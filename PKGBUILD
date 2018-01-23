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
pkgver=999.0a1
pkgrel=21
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
_srcurl="https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-central"
_version="$(curl -s "${_srcurl}/" | grep -Eo firefox-.+tar.bz2 | cut -d- -f2 | cut -d. -f1-2 | tail -n1)"
_file="firefox-${_version}.en-US.linux-${CARCH}"
_revision="$(curl -s "${_srcurl}/${_file}.txt" | head -n1)"
_shasum="$(curl -s "${_srcurl}/${_file}.checksums" | grep -E "sha512.+${_file}\.tar\.bz2\$" | cut -d\  -f1)"

pkgver() {
  echo "${_version}.${_revision}"
}

install="${pkgname}.install"
source=("${pkgname}-$(pkgver).tar.bz2::${_srcurl}/${_file}.tar.bz2"
        'http://design.firefox.com/product-identity/firefox-nightly/firefox-logo-nightly.svg'
        'firefox-nightly.desktop'
        'firefox-nightly-safe.desktop')
sha512sums=("${_shasum}"
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

package() {
  install -d "${pkgdir}"/{usr/{bin,share/{applications,pixmaps}},opt}
  cp -r firefox "${pkgdir}/opt/firefox-nightly"
  chmod -R g+w "${pkgdir}/opt/firefox-nightly"

  ln -s /opt/firefox-nightly/firefox "${pkgdir}/usr/bin/firefox-nightly"
  install -Dm644 "${srcdir}"/{firefox-nightly.desktop,firefox-nightly-safe.desktop} "${pkgdir}/usr/share/applications/"
  install -Dm644 "${srcdir}/firefox-logo-nightly.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/firefox-nightly.svg"
  install -Dm644 "${srcdir}/firefox/browser/chrome/icons/default/default128.png" "${pkgdir}/usr/share/pixmaps/firefox-nightly.png"
  install -Dm644 "${srcdir}/firefox/browser/chrome/icons/default/default128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/firefox-nightly.png"
}
