# Maintainer: Michael Moroni <michael.moroni @ openmailbox.org>
# Contributor: Cedric Girard <girard.cedric@gmail.com>
# Contributor: Det <nimetonmaili at gmail a-dot com>
# Contributor: Anthony25 <anthony.ruhier @ gmail.com>
# Contributor: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>
# Contributor: Glorfindel <glorfindelATsentDOTcom>
# Contributor: Brizou <brizou @ gmail.com>
# Contributor: Cedric MATHIEU <me.xenom @ gmail.com>
# Contributor: coderoar <coderoar @ gmail.com>
# Contributor: kang <kang @ mozilla.com>
# Thanks to @xenom, contributor of firefox-nightly

_name=thunderbird
_channel=nightly
_lang=it
_full_name=${_name}-${_channel}
pkgname=${_full_name}-${_lang}
pkgdesc='Standalone Mail/News reader from Mozilla — Localized Nightly build'
url='http://www.mozilla.org/thunderbird/'
_version=44.0a1
pkgver=44.0a1.20150814
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
depends=('alsa-lib' 'cairo' 'dbus-glib' 'desktop-file-utils' 'fontconfig' 'freetype2' 'gtk2' 'hicolor-icon-theme' 'hunspell' 'libevent' 'libjpeg' 'libmng' 'libpng' 'libvpx' 'libxt' 'mozilla-common' 'nspr' 'nss' 'shared-mime-info' 'sqlite' 'startup-notification')
optdepends=('libcanberra: for sound support')
_base_src="${_name}-${_version}.${_lang}.linux-${CARCH}"
_base_url="http://ftp.mozilla.org/pub/mozilla.org/${_name}/${_channel}/latest-comm-central-l10n"
_tarball="${_base_src}.tar.bz2"
source=(
    "${_base_url}/${_tarball}"
    "${_full_name}.desktop"
    'vendor.js'
)
_checksum="$(curl -s "${_base_url}/${_base_src}.checksums" | grep ${_tarball} | grep sha512 | cut -d " " -f1)"
sha512sums=("${_checksum}"
            '947bb55980dccaa59e13fb69deb02325cbcbb7d7a8685f143710cb31a9fae1da1d81c18fa764d06d50e60464e3c77d781004ab3edf06d68c73a0068435399adf'
            'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010'
)
install=$pkgname.install

pkgver() {
  SRC_VER="${_name}-${_version}.en-US.linux-${CARCH}.txt"
  curl -OR "http://ftp.mozilla.org/pub/mozilla.org/${_name}/${_channel}/latest-comm-central/${SRC_VER}"
  echo "${_version}.$(head -n1 ${SRC_VER} | cut -c -8)"
}

# Uncomment check() to enable GnuPG signature verification. You’ll need Mozilla’s GnuPG release key.
# Their current fingerprint is 14F2 6682 D091 6CDD 81E3 7B6D 61B7 B526 D98F 0353
#check() {
#  CHECKSUM="${_base_src}.checksums"
#  CHECKSIG="${CHECKSUM}.asc"
#  curl -OR "${_base_url}/${CHECKSUM}"
#  curl -OR "${_base_url}/${CHECKSIG}"
#  gpg --verify ${CHECKSIG} ${CHECKSUM}
#}

package() {
  msg "Downloading..."
  curl -ORz ${_tarball} ${_base_url}
  msg "Extracting..."
  bsdtar -x -f ${_tarball}
  msg "Packaging..."

  OPT_PATH="/opt/${_name}-${_version}"

  # uncomment this line to remove these
  # rm -rf thunderbird/{extensions,plugins,searchplugins}
  install -d "${pkgdir}"/{usr/{bin,share/applications},opt}
  cp -r thunderbird "${pkgdir}/${OPT_PATH}"
  ln -s "${OPT_PATH}/thunderbird" "${pkgdir}/usr/bin/${_full_name}"

  install -Dm644 "${_full_name}.desktop" "${pkgdir}/usr/share/applications/${_full_name}.desktop"
  # Install icons
  for i in 16 32 48
  do
      install -Dm644 "${srcdir}/thunderbird/chrome/icons/default/default${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_full_name}.png"
  done
#  install -Dm644 "${srcdir}/thunderbird/icons/mozicon128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_full_name}.png"
  # Disable auto-updates
  install -Dm644 "${srcdir}/vendor.js" "${pkgdir}/${OPT_PATH}/defaults/pref/vendor.js"

  # Use system-provided dictionaries
  rm -rf "${pkgdir}/${OPT_PATH}"/{dictionaries,hyphenation}
  ln -sf /usr/share/hunspell "${pkgdir}/${OPT_PATH}/dictionaries"
  ln -sf /usr/share/hyphen "${pkgdir}/${OPT_PATH}/hyphenation"
}
