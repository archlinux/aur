# Maintainer: Anthony25 <anthony.ruhier @ gmail.com>
# Contributor: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani @ gmail.com>
# Thanks to @xenom, contributor of firefox-nightly

_name=firefox
_channel=nightly
_lang=fr
_pkgname=${_name}-${_channel}
pkgname=${_pkgname}-${_lang}
pkgdesc="Standalone Web Browser from Mozilla — Nightly build (${_lang})"
url="https://www.mozilla.org/${_lang}/${_name}/${_channel}"
_version='54.0a1'
pkgver=54.0a1.20170208
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
depends=('dbus-glib' 'gtk2' 'gtk3' 'libxt' 'nss' 'mime-types')
optdepends=('pulseaudio: audio support'
            'ffmpeg: h.264 video'
            'hunspell: spell checking'
            'hyphen: hyphenation')
_url="https://download-installer.cdn.mozilla.net/pub/${_name}/nightly/latest-mozilla-central"
_src="${_url}-l10n/${_name}-${_version}.${_lang}.linux"
source=("${_pkgname}.desktop" 'vendor.js')
source_i686=("${_src}-i686.tar.bz2"{,.asc})
source_x86_64=("${_src}-x86_64.tar.bz2"{,.asc})
sha512sums=(
    '223764bb680f2f2a057c0586d9057a660f7cecd595eec6e181342d6a343c5d1e62f546309c6fd0bb9a806704d38c61570a99195ff5e90d55b4b3629ff13dddb3'
    'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010'
)
sha512sums_i686=('SKIP' 'SKIP')
sha512sums_x86_64=('SKIP' 'SKIP')
validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353') # Mozilla’s GnuPG release key

pkgver() {
  echo "${_version}.$(curl -s ${_url}/${_name}-${_version}.en-US.linux-${CARCH}.txt | head -n1 | cut -c -8)"
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
  for i in 16 32 48
  do
      install -Dm644 "${SRC_LOC}"/chrome/icons/default/default${i}.png "${DEST_LOC}"/${i}x${i}/apps/${_pkgname}.png
  done
  install -Dm644 "${SRC_LOC}"/icons/mozicon128.png "${DEST_LOC}"/128x128/apps/${_pkgname}.png

  # Disable auto-updates
  install -Dm644 "${srcdir}"/vendor.js -t "${pkgdir}"/${OPT_PATH}/browser/defaults/preferences

  # Use system-provided dictionaries
  rm -rf "${pkgdir}"/${OPT_PATH}/{dictionaries,hyphenation}
  ln -sf /usr/share/hunspell "${pkgdir}"/${OPT_PATH}/dictionaries
  ln -sf /usr/share/hyphen "${pkgdir}"/${OPT_PATH}/hyphenation
}
