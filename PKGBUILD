# Maintainer: vitamin1980 <vitamin.novgorod @ yandex.ru>
# Contributor: McModder <mcmodder @ mcmodder.ru>
# Contributor: Denis Vadimov <me @ bloody.pw>

_version=$(curl -sL https://product-details.mozilla.org/1.0/firefox_versions.json | grep FIREFOX_NIGHTLY | cut -d'"' -f4)
_baseurl="https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/"
_date="$(curl -sL ${_baseurl} | grep -A2 "firefox-${_version}.ru.linux-x86_64.tar.bz2\"" | tail -n1 | cut -f2 -d'>' | cut -f1 -d' ' | date +%Y%m%d)"
_filename="firefox-${_version}.ru.linux-${CARCH}"
_sha512sum="$(curl -vs "${_baseurl}${_filename}.checksums" 2>&1 | grep bz | grep sha512 | cut -d " " -f1 | head -n 1)"
pkgname=firefox-nightly-ru
pkgver=${_version}.${_date}
pkgrel=1
pkgdesc='Web browser from mozilla.org, nightly build, russian version'
arch=('i686' 'x86_64')
url='http://nightly.mozilla.org/'
license=('MPL' 'GPL' 'LGPL')
depends=('alsa-lib' 'libxt' 'libnotify' 'mime-types' 'nss' 'gtk2' 'gtk3'
'sqlite' 'dbus-glib' 'desktop-file-utils')
conflicts=('firefox-nightly')
install=${pkgname}.install
source=('firefox-nightly.desktop'
        'firefox-nightly-ru.install'
        'vendor.js'
        "${_date}-${_filename}.tar.bz2::${_baseurl}${_filename}.tar.bz2")
sha512sums=('02bd8c8c717e6796fb1772f51c1bfd78ff3ca7c5355c08b9568dc36cb72b8b84330d20522653eedda12bdec1517cd4074a4bc5d51a8667880121e946b85c11ec'
         'bc940986f5acb02706714d5dcbc32e17b167190dc9a30c7d63bf5317a45a1a0ff9da5ea302b9c8efc32acf7b75d2dec1420f542cb0ba08c3e3d59273d18baa96'
         'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010'
         "${_sha512sum}")

pkgver() {
  echo "${_version}.${_date}"
}

package() {
  mkdir -p "${pkgdir}"/{usr/{bin,share/{applications,pixmaps}},opt}
  cp -r firefox "${pkgdir}/opt/firefox-nightly-ru"
  ln -s /opt/firefox-nightly-ru/firefox "${pkgdir}/usr/bin/firefox-nightly"
  install -m644 "${srcdir}/firefox-nightly.desktop" "${pkgdir}/usr/share/applications/"
  install -m644 "${srcdir}/firefox/browser/chrome/icons/default/default128.png" "${pkgdir}/usr/share/pixmaps/firefox-nightly-icon.png"
  install -Dm644 "${srcdir}/vendor.js" "${pkgdir}/opt/firefox-nightly-ru/browser/defaults/preferences/vendor.js"
}
