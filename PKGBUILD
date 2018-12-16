# Maintainer: Anthony25 <anthony.ruhier @ gmail.com>
# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani @ gmail.com>
# Thanks to @xenom, contributor of firefox-nightly

_name=firefox
_channel=nightly
_lang=fr
_pkgname=${_name}-${_channel}
pkgname=${_pkgname}-${_lang}
pkgdesc="Standalone Web Browser from Mozilla — Nightly build (${_lang})"
url="https://www.mozilla.org/${_lang}/${_name}/${_channel}"
_version=66.0a1
pkgver=66.0a1.20181216
pkgrel=1
arch=('i686' 'x86_64')
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
_src="${_name}-${_version}.${_lang}.linux"
_srcen="${_name}-${_version}.en-US.linux"
_filename="$(date +%Y%m%d)-${_src}"
source=("${_pkgname}.desktop" 'policies.json')
source_i686=("${_filename}-i686.tar.bz2"::"${_url}-l10n/${_src}-i686.tar.bz2"
             "${_filename}-i686.tar.bz2.asc"::"${_url}-l10n/${_src}-i686.tar.bz2.asc"
             "${_filename}-i686.txt"::"${_url}/${_srcen}-i686.txt")
source_x86_64=("${_filename}-x86_64.tar.bz2"::"${_url}-l10n/${_src}-x86_64.tar.bz2"
               "${_filename}-x86_64.tar.bz2.asc"::"${_url}-l10n/${_src}-x86_64.tar.bz2.asc"
               "${_filename}-x86_64.txt"::"${_url}/${_srcen}-x86_64.txt")
sha512sums=('0b58ffc470159ca50d699ea1006226f14fd1ea0aa622ac0a3b831ea39e25b46852064848bddfeefa358a86c378aa308c1690399429019e2895e56c7b042e8195'
            '5ed67bde39175d4d10d50ba5b12063961e725e94948eadb354c0588b30d3f97d2178b66c1af466a6e7bd208ab694227a1391c4141f88d3da1a1178454eba5308')
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

  # Disable auto-updates
  install -Dm644 "${srcdir}"/policies.json -t "${pkgdir}"/${OPT_PATH}/distribution

  # Use system-provided dictionaries
  rm -rf "${pkgdir}"/${OPT_PATH}/{dictionaries,hyphenation}
  ln -sf /usr/share/hunspell "${pkgdir}"/${OPT_PATH}/dictionaries
  ln -sf /usr/share/hyphen "${pkgdir}"/${OPT_PATH}/hyphenation
}
