# Maintainer: Anthony25 <anthony.ruhier @ gmail.com>
# Contributor: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani @ gmail.com>
# Thanks to @xenom, contributor of firefox-nightly

_name=firefox
_channel=nightly
_lang=fr
_full_name=${_name}-${_channel}
pkgname=${_full_name}-${_lang}
pkgdesc="Standalone Web Browser from Mozilla — Nightly build (${_lang})"
url="https://nightly.mozilla.org/"
_version='53.0a1'
pkgver=53.0a1.20161222
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
depends=('dbus-glib' 'gtk2' 'gtk3' 'libxt' 'nss' 'mime-types')
optdepends=('pulseaudio: audio support'
            'ffmpeg: h.264 video'
            'hunspell: spell checking'
            'hyphen: hyphenation')
_url="https://ftp.mozilla.org/pub/mozilla.org/${_name}/nightly/latest-mozilla-central"
_url_l10n="${_url}-l10n"
_src="${_name}-${_version}.${_lang}.linux"
_file_i686="${_src}-i686.tar.bz2"
_file_x86_64="${_src}-x86_64.tar.bz2"
_sums_i686="${_src}-i686.checksums"
_sums_x86_64="${_src}-x86_64.checksums"
source=(
    'firefox-nightly.desktop'
    'firefox-nightly-safe.desktop'
    'vendor.js'
)
source_i686=("${_url_l10n}"/{"${_file_i686}","${_sums_i686}"{,.asc}})
source_x86_64=("${_url_l10n}"/{"${_file_x86_64}","${_sums_x86_64}"{,.asc}})
sha512sums=(
    '223764bb680f2f2a057c0586d9057a660f7cecd595eec6e181342d6a343c5d1e62f546309c6fd0bb9a806704d38c61570a99195ff5e90d55b4b3629ff13dddb3'
    '3612d06ab78029267203936eaa13124ea49421331e53dc3a8fca4314040c9a6c8685e622bbd6c89c27b6178ef29c215b4d6371a8277bcc8f4f59fc2bbfbd74b4'
    'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010'
)
_getsum_i686="$(curl -O ${_url_l10n}/${_sums_i686})"
_getsum_x86_64="$(curl -O ${_url_l10n}/${_sums_x86_64})"
sha512sums_i686=("$(grep ${_file_i686} ${_sums_i686} | grep sha512 | cut -d " " -f1)" 'SKIP' 'SKIP')
sha512sums_x86_64=("$(grep ${_file_x86_64} ${_sums_x86_64} | grep sha512 | cut -d " " -f1)" 'SKIP' 'SKIP')
validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353') # Mozilla’s GnuPG release key

pkgver() {
  echo "${_version}.$(curl -s ${_url}/${_name}-${_version}.en-US.linux-${CARCH}.txt | head -n1 | cut -c -8)"
}

package() {
  OPT_PATH="/opt/${_full_name}"

  # Install the package files
  install -d "${pkgdir}"/{usr/{bin,share/applications},opt}
  cp -r ${_name} "${pkgdir}/${OPT_PATH}"
  ln -s "${OPT_PATH}/${_name}" "${pkgdir}/usr/bin/${_full_name}"

  # Install .desktop files
  install -m644 "${srcdir}"/{${_full_name}.desktop,${_full_name}-safe.desktop} "${pkgdir}/usr/share/applications/"

  # Install icons
  SRC_LOC="${srcdir}/${_name}/browser"
  DEST_LOC="${pkgdir}/usr/share/icons/hicolor"
  for i in 16 32 48
  do
      install -Dm644 "${SRC_LOC}/chrome/icons/default/default${i}.png" "${DEST_LOC}/${i}x${i}/apps/${_full_name}.png"
  done
  install -Dm644 "${SRC_LOC}/icons/mozicon128.png" "${DEST_LOC}/128x128/apps/${_full_name}.png"

  # Disable auto-updates
  install -Dm644 "${srcdir}/vendor.js" "${pkgdir}/${OPT_PATH}/browser/defaults/preferences/vendor.js"

  # Use system-provided dictionaries
  rm -rf "${pkgdir}/${OPT_PATH}"/{dictionaries,hyphenation}
  ln -sf /usr/share/hunspell "${pkgdir}/${OPT_PATH}/dictionaries"
  ln -sf /usr/share/hyphen "${pkgdir}/${OPT_PATH}/hyphenation"
}
