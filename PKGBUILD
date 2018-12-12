# Maintainer: Akrai <drokergeek@gmail.com>

# Before you complain about unverifiable signature, please read Allan's post:
# http://allanmcrae.com/2015/01/two-pgp-keyrings-for-package-management-in-arch-linux/
# TL;DR: gpg --keyserver pgp.mit.edu --recv-keys 14F26682D0916CDD81E37B6D61B7B526D98F0353
# TL;DR: gpg --keyserver pgp.mit.edu --recv-keys BBBEBDBB24C6F355

_name=firefox
_channel=nightly
_lang=es-ES
_pkgname=${_name}-${_channel}
pkgname=${_pkgname}-${_lang,,}
pkgdesc="Standalone Web Browser from Mozilla — Nightly build (${_lang})"
url="https://www.mozilla.org/${_lang}/${_name}/${_channel}"
_version=66.0a1
pkgver=66.0a1.20181212
pkgrel=1
arch=('i686' 'x86_64')
conflicts=('firefox-nightly')
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
_url="https://download-installer.cdn.mozilla.net/pub/${_name}/nightly/latest-mozilla-central"
_urlsrc="${_url}-l10n"
_src="${_name}-${_version}.${_lang}.linux"
_srctxt="${_name}-${_version}.en-US.linux"
_filename="$(date +%Y%m%d)-${_src}"
source=("${_pkgname}.desktop" 'policies.json')
source_i686=("${_filename}-i686.tar.bz2"::"${_urlsrc}/${_src}-i686.tar.bz2"
             "${_filename}-i686.tar.bz2.asc"::"${_urlsrc}/${_src}-i686.tar.bz2.asc"
             "${_filename}-i686.txt"::"${_url}/${_srctxt}-i686.txt")
source_x86_64=("${_filename}-x86_64.tar.bz2"::"${_urlsrc}/${_src}-x86_64.tar.bz2"
               "${_filename}-x86_64.tar.bz2.asc"::"${_urlsrc}/${_src}-x86_64.tar.bz2.asc"
               "${_filename}-x86_64.txt"::"${_url}/${_srctxt}-x86_64.txt")
sha512sums=(
    '42426e7b510bd88cbf7b246bf66d7768afa5d71389bf15f7a4231dc24f99fd73284dd9a0a8eb4342b42337c2c7dd843e570a93afa7d3b44c97ecbf5e38e433ac'
    '59d53a3f225e4e28ea25459dba0f3eb96b0e896a96bee992fd45148de3276e141649a0db7e6abad7f4ad341ea244222d31d2ac943f6b7d63c2b7365f702e537c'
)
sha512sums_i686=('SKIP' 'SKIP' 'SKIP')
sha512sums_x86_64=('SKIP' 'SKIP' 'SKIP')
validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353') # Mozilla’s GnuPG release key

pkgver() {
  echo "${_version}.$(head -n1 ${_filename}-${CARCH}.txt | cut -c-8)"
}

package() {
  OPT_PATH="opt/${_pkgname}"

  # Install the package files
  install -d "${pkgdir}"/{usr/bin,opt}
  cp -r ${_name} "${pkgdir}"/${OPT_PATH}
  ln -s "/${OPT_PATH}/${_name}" "${pkgdir}"/usr/bin/${_pkgname}

  # Install .desktop files
  install -Dm644 "${srcdir}"/${_pkgname}.desktop -t "${pkgdir}"/usr/share/applications

  # Install icons
  SRC_LOC="${srcdir}"/${_name}/browser
  DEST_LOC="${pkgdir}"/usr/share/icons/hicolor
  for i in 16 32 48 64 128
  do
      install -Dm644 "${SRC_LOC}"/chrome/icons/default/default${i}.png "${DEST_LOC}"/${i}x${i}/apps/${_pkgname}.png
  done

  #install -Dm644 "${SRC_LOC}"/icons/mozicon128.png \
  #  "${DEST_LOC}"/128x128/apps/${_pkgname}.png

  # Disable auto-updates
  install -Dm644 "${srcdir}"/policies.json -t "${pkgdir}"/${OPT_PATH}/distribution

  # Use system-provided dictionaries
  rm -rf "${pkgdir}"/${OPT_PATH}/{dictionaries,hyphenation}
  ln -sf /usr/share/hunspell "${pkgdir}"/${OPT_PATH}/dictionaries
  ln -sf /usr/share/hyphen "${pkgdir}"/${OPT_PATH}/hyphenation
}
