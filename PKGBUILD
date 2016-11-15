# Maintainer: Icaro Perseo <icaroperseo[at]protonmail[dot]com>
# Forked from @xenom PKGBUILD, contributor of firefox-nightly

# Before you complain about unverifiable signature, please read Allan's post:
# http://allanmcrae.com/2015/01/two-pgp-keyrings-for-package-management-in-arch-linux/
# TL;DR: gpg --keyserver pgp.mit.edu --recv-keys 14F26682D0916CDD81E37B6D61B7B526D98F0353

_name=firefox
_channel=nightly
_lang=es-MX
pkgname="${_name}-${_channel}-${_lang,,}"
pkgdesc="Standalone web browser from mozilla.org, nightly build (${_lang})"
url='http://www.mozilla.org/projects/firefox'
pkgver=53.0a1.20161114
_version=53.0a1
pkgrel=1
arch=('i686' 'x86_64')
conflicts=('firefox-nightly')
license=('MPL' 'GPL' 'LGPL')
_file="${_name}-${_version}.en-US.linux"
_file_l10n="${_name}-${_version}.${_lang}.linux"
_srcurl="https://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-mozilla-central"
_srcurl_l10n="${_srcurl}-l10n"
source=(
  'firefox-nightly.desktop' 'firefox-nightly-safe.desktop' 'vendor.js'
  "${_srcurl_l10n}/${_file_l10n}-${CARCH}.tar.bz2" "${_srcurl}/${_file}-${CARCH}.txt"
  "${_srcurl_l10n}/${_file_l10n}-${CARCH}.checksums"{,.asc})
sha512sums=(
  '2d8feaf128775efbab958e2614613cd45a7a172a3c687b6af054d61eabd3592cf1dd1c85ca92bff82834f43eb7ebedeb4f8c2fe6f116b6a22eb14a7ff98a1f25'
  '88510ea986776bb8ed9fc8c1217728f8cf0f8b3a8aa4dbc07608e7b2803cd13dcb6809363208fd9531ccee5a9ba2cee39af498a1279d3e1268511982ecb559ec'
  'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP')
validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353')
depends=('alsa-lib' 'libxt' 'libnotify' 'mime-types' 'nss' 'gtk2' 'gtk3' 'sqlite' 'dbus-glib')

prepare() {
  grep -e "${_file_l10n}-${CARCH}.tar.bz2" "${srcdir}/${_file_l10n}-${CARCH}.checksums" \
    | grep " sha512 " | cut -d " " -f1,4 > "${srcdir}/checksums"

  msg 'Verifying checksums...'
  if [ ! "$(wc -l <"${srcdir}/checksums")" -eq '1' ]; then
    error 'Wrong number of lines in a checksums file'
    exit 1
  fi
  sha512sum -c --strict "${srcdir}/checksums"
}

pkgver() {
  echo "${_version}.$(head -n1 "${srcdir}/${_file}-${CARCH}.txt" | cut -c-8)"
}

package() {
  #  uncomment this line to remove these
  #  rm -rf firefox/{extensions,plugins,searchplugins}
  install -d "${pkgdir}"/{usr/{bin,share/{applications,pixmaps}},opt}
  cp -r firefox "${pkgdir}/opt/firefox-${_version}"

  ln -s /opt/firefox-${_version}/firefox "${pkgdir}/usr/bin/firefox-nightly"
  install -m644 "${srcdir}"/{firefox-nightly.desktop,firefox-nightly-safe.desktop} "${pkgdir}/usr/share/applications/"
  install -m644 "${srcdir}/firefox/browser/icons/mozicon128.png" "${pkgdir}/usr/share/pixmaps/${pkgname}-icon.png"
  install -Dm644 "${srcdir}/vendor.js" "${pkgdir}/opt/firefox-${_version}/browser/defaults/preferences/vendor.js"
}

# vim:set ts=2 sw=2 cc=80 et:
