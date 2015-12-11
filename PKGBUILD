# Maintainer: Michael Moroni <michael.moroni @ openmailbox.org>
# Contributor: Cedric MATHIEU <me.xenom @ gmail.com>
# Contributor : Det <nimetonmaili @ gmail.com>
# Contributor: coderoar <coderoar @ gmail.com>
# Contributor: kang <kang @ mozilla.com>
# Contributor: John Reese <jreese @ noswap.com>

_name=firefox
_channel=nightly
_lang=it
_full_name=${_name}-${_channel}
pkgname=${_full_name}-${_lang}
pkgdesc='Standalone web browser from Mozilla — Localized Nightly build'
url='https://nightly.mozilla.org/'
pkgver=45.0a1.20151105
_version=45.0a1
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
_file="${_name}-${_version}.${_lang}.linux"
_srcurl="https://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-mozilla-central-l10n"
_srcsum="https://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-mozilla-central"
_filesum="${_name}-${_version}.en-US.linux"
source=('firefox-nightly.desktop' 'firefox-nightly-safe.desktop' 'vendor.js')
source_i686=("${_srcurl}/${_file}-i686.tar.bz2" "${_srcsum}/${_filesum}-i686.txt")
source_x86_64=("${_srcurl}/${_file}-x86_64.tar.bz2" "${_srcsum}/${_filesum}-x86_64.txt")
_srcsum_i686="$(curl -s "${_srcsum}/${_filesum}-i686.checksums" | grep "${_filesum}-i686.tar.bz2" | grep sha512 | cut -d " " -f1)" 
_srcsum_x86_64="$(curl -s "${_srcsum}/${_filesum}-x86_64.checksums" | grep "${_filesum}-x86_64.tar.bz2" | grep sha512 | cut -d " " -f1)" 
sha512sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')
depends=('alsa-lib' 'libxt' 'libnotify' 'mime-types' 'nss' 'gtk2' 'gtk3' 'sqlite' 'dbus-glib')

pkgver() {
	echo "${_version}.$(date +%Y%m%d)"
}

package() {
  
  # uncomment these lines to enable GnuPG signature verification. You'll need Firefox's GnuPG release key.
  # Their current fingerprint (2015-07-17) is 14F2 6682 D091 6CDD 81E3 7B6D 61B7 B526 D98F 0353
  #msg "Verifying GnuPG signature..."
  # Add your architecture here (i686 or x86_64)
  #CARCH=
  #FX_GPG="${_file}-${CARCH}.checksums.asc"
  #FX_GPG_URI="${_srcurl}/${FX_GPG}"
  #FX_CHKSUM_URI="${_srcurl}/${_file}-${CARCH}.checksums"
  #curl -OR ${FX_CHKSUM_URI}
  #curl -OR ${FX_GPG_URI} 
  #gpg --verify ${FX_GPG} 

  #  uncomment this line to remove these
  #  rm -rf firefox/{extensions,plugins,searchplugins}
  install -d "${pkgdir}"/{usr/{bin,share/{applications,pixmaps}},opt}
  cp -r firefox "${pkgdir}/opt/firefox-${_version}"

  ln -s /opt/firefox-${_version}/firefox "${pkgdir}/usr/bin/firefox-nightly"
  install -m644 "${srcdir}"/{firefox-nightly.desktop,firefox-nightly-safe.desktop} "${pkgdir}/usr/share/applications/"
  install -m644 "${srcdir}/firefox/browser/icons/mozicon128.png" "${pkgdir}/usr/share/pixmaps/${pkgname}-icon.png"
  install -Dm644 "${srcdir}/vendor.js" "${pkgdir}/opt/firefox-${_version}/browser/defaults/preferences/vendor.js"
}
