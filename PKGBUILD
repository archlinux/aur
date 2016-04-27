# Maintainer: Anthony25 <anthony.ruhier @ gmail.com>
# Contributor: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>
# Contributor: Glorfindel <glorfindelATsentDOTcom>
# Contributor: Brizou <brizou @ gmail.com>
# Contributor: Cedric MATHIEU <me.xenom @ gmail.com>
# Contributor: Det <nimetonmaili @ gmail.com>
# Contributor: coderoar <coderoar @ gmail.com>
# Contributor: kang <kang @ mozilla.com>
# Thanks to @xenom, contributor of firefox-nightly

_name=firefox
_channel=nightly
_lang=fr
_full_name=${_name}-${_channel}
pkgname=firefox-nightly-fr
pkgdesc='Standalone Web Browser from Mozilla — Nightly build (fr)'
url='https://nightly.mozilla.org/'
_version="49.0a1"
pkgver=49.0a1.20160427
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
depends=('alsa-lib' 'dbus-glib' 'desktop-file-utils' 'gtk2' 'gtk3' 'libxt'
         'nss' 'mime-types')
optdepends=('ffmpeg: h.264 video'
            'hunspell: spell checking'
            'hyphen: hyphenation')
_base_src="${_name}-${_version}.${_lang}.linux-${CARCH}"
_base_url="https://ftp.mozilla.org/pub/mozilla.org/${_name}/nightly/latest-mozilla-central-l10n"
_tarball="${_base_src}.tar.bz2"
source=(
    "${_base_url}/${_tarball}"
    'firefox-nightly.desktop'
    'firefox-nightly-safe.desktop'
    'vendor.js'
)
_checksum="$(curl -s "${_base_url}/${_base_src}.checksums" | grep ${_tarball} | grep sha512 | cut -d " " -f1)"
sha512sums=("${_checksum}"
            '725babc1365e02a30f50aafbc069b04a97cd247f76240b99b0a734dcce0e560f30cfd441efe9b0b9edcc48f327c8adad34e1ae45c2ba047205c84921d5e43e59'
            '2df6b84978ec459ffad3e0d285c816da07a890db30284d3b2bec250472c10e08003edf705278cb97e02a52fb5f1325d962c08d5fbcf98f484e982a97e381407b'
            'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010')

pkgver() {
  SRC_VER="${_name}-${_version}.en-US.linux-${CARCH}.txt"
  curl -OR "https://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-mozilla-central/${SRC_VER}"
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
  OPT_PATH="/opt/${_name}-${_version}"

  # uncomment this line to remove these
  # rm -rf firefox/{extensions,plugins,searchplugins}
  install -d "${pkgdir}"/{usr/{bin,share/applications},opt}
  cp -r firefox "${pkgdir}/${OPT_PATH}"
  ln -s "${OPT_PATH}/firefox" "${pkgdir}/usr/bin/${_full_name}"

  install -m644 "${srcdir}"/{${_full_name}.desktop,${_full_name}-safe.desktop} "${pkgdir}/usr/share/applications/"
  # Install icons
  for i in 16 32 48
  do
      install -Dm644 "${srcdir}/firefox/browser/chrome/icons/default/default${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_full_name}.png"
  done
  install -Dm644 "${srcdir}/firefox/browser/icons/mozicon128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_full_name}.png"
  # Disable auto-updates
  install -Dm644 "${srcdir}/vendor.js" "${pkgdir}/${OPT_PATH}/browser/defaults/preferences/vendor.js"

  # Use system-provided dictionaries
  rm -rf "${pkgdir}/${OPT_PATH}"/{dictionaries,hyphenation}
  ln -sf /usr/share/hunspell "${pkgdir}/${OPT_PATH}/dictionaries"
  ln -sf /usr/share/hyphen "${pkgdir}/${OPT_PATH}/hyphenation"
}
