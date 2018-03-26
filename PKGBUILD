# Maintainer: Michael Moroni <michaelmoroni AT disroot DOT org >
# Contributor: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Cedric MATHIEU <me.xenom @ gmail.com>

_name=firefox
_channel=nightly
_lang=it
pkgname=${_name}-${_channel}-${_lang}
pkgdesc="Standalone Web Browser from Mozilla — Nightly build (${_lang})"
url="https://www.mozilla.org/${_lang}/${_name}/${_channel}"
_version=61.0a1
pkgver=61.0a1.20180326
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
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
_url="https://ftp.mozilla.org/pub/${_name}/${_channel}/latest-mozilla-central-l10n"
_urlUS="https://ftp.mozilla.org/pub/${_name}/${_channel}/latest-mozilla-central"
_src="${_name}-${_version}.${_lang}.linux"
_srcUS="${_name}-${_version}.en-US.linux"
source=("${pkgname}.desktop" 'vendor.js')
# source_i686=("${_url}/${_src}-i686.tar.bz2"{,.asc} "${_urlUS}/${_srcUS}-i686.txt")
# source_x86_64=("${_url}/${_src}-x86_64.tar.bz2"{,.asc} "${_urlUS}/${_srcUS}-x86_64.txt")
source_i686=("${_url}/${_src}-i686.tar.bz2" "${_urlUS}/${_srcUS}-i686.txt")
source_x86_64=("${_url}/${_src}-x86_64.tar.bz2" "${_urlUS}/${_srcUS}-x86_64.txt")
sha512sums=('ba6d165fb119de50d1105614ed063c26e4d3a8877cbab2a71e875458209218ade173dacdae2f06bf66dba39ebc005f371d74d68baa0c8bc7dbdd23ded077eee6'
            'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010')
# sha512sums_i686=('SKIP' 'SKIP' 'SKIP')
# sha512sums_x86_64=('SKIP' 'SKIP' 'SKIP')
sha512sums_i686=('SKIP' 'SKIP')
sha512sums_x86_64=('SKIP' 'SKIP')
validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353') # Mozilla's GnuPG release key

pkgver() {
  echo "${_version}.$(head -n1 ${_srcUS}-${CARCH}.txt | cut -c-8)"
}

package() {
  OPT_PATH="opt/${pkgname}"

  # Install the package files
  install -d "${pkgdir}"/{usr/bin,opt}
  cp -r ${_name} "${pkgdir}"/${OPT_PATH}
  ln -s "/${OPT_PATH}/${_name}" "${pkgdir}"/usr/bin/${pkgname}

  # Install .desktop files
  install -Dm644 "${srcdir}"/${pkgname}.desktop -t "${pkgdir}"/usr/share/applications

  # Install icons
  SRC_LOC="${srcdir}"/${_name}/browser
  DEST_LOC="${pkgdir}"/usr/share/icons/hicolor
  for i in 16 32 48 64 128
  do
      install -Dm644 "${SRC_LOC}"/chrome/icons/default/default${i}.png "${DEST_LOC}"/${i}x${i}/apps/${pkgname}.png
  done

  # Disable auto-updates
  install -Dm644 "${srcdir}"/vendor.js -t "${pkgdir}"/${OPT_PATH}/browser/defaults/preferences

  # Use system-provided dictionaries
  rm -rf "${pkgdir}"/${OPT_PATH}/{dictionaries,hyphenation}
  ln -sf /usr/share/hunspell "${pkgdir}"/${OPT_PATH}/dictionaries
  ln -sf /usr/share/hyphen "${pkgdir}"/${OPT_PATH}/hyphenation
}
