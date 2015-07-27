# Maintainer: Cedric MATHIEU <me.xenom @ gmail.com>
# Contributor : Det <nimetonmaili @ gmail.com>
# Contributor: coderoar <coderoar @ gmail.com>
# Contributor: kang <kang @ mozilla.com>
# Contributor: John Reese <jreese @ noswap.com>

_name=firefox
_channel=nightly
pkgname="${_name}-${_channel}"
pkgname=firefox-nightly
pkgdesc='Standalone web browser from mozilla.org, nightly build'
url='http://www.mozilla.org/projects/firefox'
pkgver=42.0a1.20150703
_version=42.0a1
pkgrel=2
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
_file="${_name}-${_version}.en-US.linux"
_srcurl="https://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-trunk"
source=('firefox-nightly.desktop' 'firefox-nightly-safe.desktop' 'vendor.js')
source_i686=("${_srcurl}/${_file}-i686.tar.bz2" "${_srcurl}/${_file}-i686.txt")
source_x86_64=("${_srcurl}/${_file}-x86_64.tar.bz2" "${_srcurl}/${_file}-x86_64.txt")
_srcsum_i686="$(curl -s "${_srcurl}/${_file}-i686.checksums" | grep "${_file}-i686.tar.bz2" | grep sha512 | cut -d " " -f1)" 
_srcsum_x86_64="$(curl -s "${_srcurl}/${_file}-x86_64.checksums" | grep "${_file}-x86_64.tar.bz2" | grep sha512 | cut -d " " -f1)" 
sha512sums=('3bf390ca1f55ccd7935a1c2494389a5b588984578932c56e1d7a641680601874a0f8f168eb307d2942800480a7f19a1ed188dfdb3c5835d1da1137d98de44507' 'ef1b490092af0b33e65f02ff6574846a022f18338207a0a623700036cf350f25315cb9b07bf492acae3d8510bca8b766e116df7e9e78a9c491ca7071937bd236' 'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010')
sha512sums_i686=("${_srcsum_i686}" 'SKIP')
sha512sums_x86_64=("${_srcsum_x86_64}" 'SKIP')
depends=('alsa-lib' 'libxt' 'libnotify' 'mime-types' 'nss' 'gtk2' 'gtk3' 'sqlite' 'dbus-glib')

pkgver() {
	echo "${_version}.$(date +%Y%m%d)"
}

package() {
  
  # uncomment these lines to enable GnuPG signature verification. You'll need Firefox's GnuPG release key.
  # Their current fingerprint (2015-07-17) is 14F2 6682 D091 6CDD 81E3 7B6D 61B7 B526 D98F 0353
  #msg "Verifying GnuPG signature..."
  #FX_GPG="${_file}.checksums.asc"
  #FX_GPG_URI="${_srcurl}/${FX_GPG}"
  #FX_CHKSUM_URI="${_srcurl}/${_file}.checksums"
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
