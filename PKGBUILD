# Maintainer: Icaro Perseo <icaroperseo[at]protonmail[dot]com>
# Contributor: cesasol <cesasol at hotmail dot com>
# Forked from @xenom PKGBUILD, contributor of firefox-nightly

# Before you complain about unverifiable signature, please read Allan's post:
# http://allanmcrae.com/2015/01/two-pgp-keyrings-for-package-management-in-arch-linux/
# TL;DR: gpg --keyserver pgp.mit.edu --recv-keys 14F26682D0916CDD81E37B6D61B7B526D98F0353

_name=firefox
_channel=developer
_lang=es-MX
_codename=date
pkgname="${_name}-${_channel}-${_lang,,}"
pkgdesc="Standalone web browser from mozilla.org, developer build (${_lang})"
url="http://www.mozilla.org/projects/firefox"
pkgver=56.0b7.20170830
_version=56.0b7
pkgrel=1
arch=('i686' 'x86_64')
conflicts=('firefox-developer')
license=('MPL' 'GPL' 'LGPL')
_srcurl="https://download-installer.cdn.mozilla.net/pub/devedition/releases"
source=(
  'firefox-developer.desktop'
  'vendor.js'
  "${_srcurl}/${_version}/linux-${CARCH}/${_lang}/${_name}-${_version}.tar.bz2")
sha512sums=(
  '018c9995046572ed85bd8b6b569ed5dfd3fdfeec3ca25d013879ce1fd6faac13362d2c1554af3351e9ed672e316f7e6c4130760b48c973e65ef37abaf44f7864'
  'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010'
  'a9702aff50e7d30e770f4331c9d529a68a04103fd03130ecbc520f01eeeff391b49e708b0adb6a4c20e09f9ef08090d7662cb46536ea8adec9edc2774901561b')
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
validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353')

prepare() {
  # remove the dictionaries included in the archive
  rm -rf firefox/dictionaries
}

package() {
  #  uncomment this line to remove these
  #  rm -rf firefox/{extensions,plugins,searchplugins}
  install -d "${pkgdir}"/{usr/{bin,share/{applications,pixmaps}},opt}
  cp -r firefox "${pkgdir}/opt/firefox-${_version}"

  ln -s "/opt/firefox-${_version}/firefox" \
    "${pkgdir}/usr/bin/firefox-developer"
  install -Dm644 "${srcdir}/firefox-developer.desktop" \
    "${pkgdir}/usr/share/applications/"
  install -Dm644 "${srcdir}/firefox/browser/icons/mozicon128.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}-icon.png"
  install -Dm644 "${srcdir}/vendor.js" \
    "${pkgdir}/opt/firefox-${_version}/browser/defaults/preferences/vendor.js"
}

# vim:set ts=2 sw=2 cc=80 et:
