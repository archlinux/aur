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
pkgver=41.0a1.20150514
_version=41.0a1
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
_file="${_name}-${_version}.en-US.linux-${CARCH}"
_srcurl="https://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-trunk"
source=("${_srcurl}/${_file}.tar.bz2" "${_srcurl}/${_file}.txt" 'firefox-nightly.desktop' 'firefox-nightly-safe.desktop' 'vendor.js')
_srcsum="$(curl -s "${_srcurl}/${_file}.checksums" | grep "${_file}.tar.bz2" | grep sha512 | cut -d " " -f1)" 
sha512sums=("${_srcsum}" 'SKIP' 'd2d836b07288d2a13d01d668399df8a2a15884a58a7051303938bf74a30bdfc23a8bc57395494345727ae24e1dd9cab09c67a640a5c9e7a8df895f987e009dcd' '00caf982c072c7499433c494ecf2096542c4ddf368c4b97fb22672fd669683911d009a65a498b8a03da61ae9aa5a4e8bdaa6e58b148c2a5d7c008910b2af26a5' 'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010')
depends=('alsa-lib' 'libxt' 'libnotify' 'mime-types' 'nss' 'gtk2' 'sqlite' 'dbus-glib')

pkgver() {
	echo "${_version}.$(head -n1 ${_file}.txt | cut -c -8)"
}

package() {
  
  # uncomment these lines to enable GnuPG signature verification. You'll need Firefox's GnuPG release key.
  # Their current fingerprint is 2B90 598A 745E 992F 315E  22C5 8AB1 3296 3A06 537A shortid 0x15A0A4BC
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
