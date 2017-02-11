# Maintainer: Cedric MATHIEU <me.xenom @ gmail.com>
# Contributor: Dmitriy Bogdanov <di72nn @ gmail.com>
# Contributor: Det <nimetonmaili @ gmail.com>
# Contributor: coderoar <coderoar @ gmail.com>
# Contributor: kang <kang @ mozilla.com>
# Contributor: John Reese <jreese @ noswap.com>

# Before you complain about unverifiable signature, please read Allan's post:
# http://allanmcrae.com/2015/01/two-pgp-keyrings-for-package-management-in-arch-linux/
# TL;DR: gpg --keyserver pgp.mit.edu --recv-keys 14F26682D0916CDD81E37B6D61B7B526D98F0353

_name=firefox
_channel=nightly
pkgname="${_name}-${_channel}"
pkgdesc='Standalone web browser from mozilla.org, nightly build'
url='http://www.mozilla.org/projects/firefox'
pkgver=54.0a1.20170124
_version=54.0a1
pkgrel=2
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
_file="${_name}-${_version}.en-US.linux"
_srcurl="https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-central"
source=(
  'firefox-nightly.desktop' 'firefox-nightly-safe.desktop' 'vendor.js'
  "${_srcurl}/${_file}-${CARCH}.tar.bz2"{,.asc} "${_srcurl}/${_file}-${CARCH}.txt")
sha512sums=(
  '2d8feaf128775efbab958e2614613cd45a7a172a3c687b6af054d61eabd3592cf1dd1c85ca92bff82834f43eb7ebedeb4f8c2fe6f116b6a22eb14a7ff98a1f25'
  '88510ea986776bb8ed9fc8c1217728f8cf0f8b3a8aa4dbc07608e7b2803cd13dcb6809363208fd9531ccee5a9ba2cee39af498a1279d3e1268511982ecb559ec'
  'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010'
  'SKIP'
  'SKIP'
  'SKIP')
validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353')
depends=('alsa-lib' 'libxt' 'libnotify' 'mime-types' 'nss' 'gtk2' 'gtk3' 'sqlite' 'dbus-glib')

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
