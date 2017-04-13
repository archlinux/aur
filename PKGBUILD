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
_version='55.0a1'
pkgver=55.0a1.20170413
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
depends=('dbus-glib' 'gtk2' 'gtk3' 'libxt' 'nss' 'mime-types')
optdepends=('pulseaudio: audio support'
            'ffmpeg: h.264 video'
            'hunspell: spell checking'
            'hyphen: hyphenation')
_url="https://ftp.mozilla.org/pub/${_name}/nightly/latest-mozilla-central"
_src="${_url}-l10n/${_name}-${_version}.${_lang}.linux"
source=("${_pkgname}.desktop" 'vendor.js')
source_i686=("${_src}-i686.tar.bz2"{,.asc})
source_x86_64=("${_src}-x86_64.tar.bz2"{,.asc})
sha512sums=(
    '08d0cc7c0c0803e324580081a6ee8486dee88c53cefdc153bc745cd869a3989e1c5a635ef97322fd609b801d447ce8d81923d34f67c011abefb7225dfe46f561'
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
