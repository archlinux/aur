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
pkgver=99.0a1
pkgrel=18
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

source=("${pkgname}-$(pkgver).tar.bz2::${_srcurl}/${_file}.tar.bz2"
        'http://design.firefox.com/product-identity/firefox-nightly/firefox-logo-nightly.svg'
        'http://design.firefox.com/product-identity/firefox-nightly/firefox-logo-nightly.png'
        'firefox-nightly.desktop'
        'firefox-nightly-safe.desktop'
        'vendor.js')
sha512sums=("${_shasum}"
            'f07445bbb6c97a803062b498c81063414ba83660d746ba5abd712d9c8e8e1469df9a015163ad8548298604630e1bfe586d78fb64f9966506770a2c45ae5be323'
            '4cd0552df782a022a4a6bc56cf62eb3216470776f51b2bb817203095b876550d9b9856c0c5dbdcbc490869129296e0007bc0128d60a450fbc8a725443a915156'
            'e83bc6604c21d0f53845fb87abc4fd3a50c4375747d1c770322edf5bee6e7f21c46f1fd98269b44889f0c5fa69ac572302c6f184ce11b3ea371ce1ac3c469b39'
            'ee5dbab349e9c9c995bccea711aacdab1db09b38072ce194f88c0c2259aef38af6dc8727ecf218ff003dc10718588200927809bd71465eb95c6298c6f7e0dbc6'
            'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010')

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

  ln -s /opt/firefox-nightly/firefox "${pkgdir}/usr/bin/firefox-nightly"
  install -Dm644 "${srcdir}"/{firefox-nightly.desktop,firefox-nightly-safe.desktop} "${pkgdir}/usr/share/applications/"
  install -Dm644 "${srcdir}/firefox-logo-nightly.png" "${pkgdir}/usr/share/pixmaps/firefox-nightly.png"
  install -Dm644 "${srcdir}/firefox-logo-nightly.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/firefox-nightly.svg"
  install -Dm644 "${srcdir}/firefox/browser/chrome/icons/default/default128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/firefox-nightly.png"
  install -Dm644 "${srcdir}/vendor.js" "${pkgdir}/opt/firefox-nightly/browser/defaults/preferences/vendor.js"
}
