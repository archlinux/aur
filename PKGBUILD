# Maintainer: Chen Jicheng <git@chenjicheng.com>
# fork https://aur.archlinux.org/packages/firefox-nightly, but update the package version daily.
# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Cedric MATHIEU <me.xenom @ gmail.com>

_name=firefox
_channel=nightly
_lang=en-US
_pkgname=${_name}-${_channel}
pkgname=${_name}-${_channel}-bin
pkgdesc="Standalone Web Browser from Mozilla — Nightly build (${_lang})"
url="https://www.mozilla.org/${_lang}/${_name}/${_channel}"
_version=103.0a1
pkgver=103.0a1.20220530093943+hef6f66b77f1e
pkgrel=1
arch=(i686 x86_64)
license=(MPL GPL LGPL)
depends=(dbus-glib gtk3 libxt nss mime-types)
conflicts=(firefox-nightly)
optdepends=('pulseaudio: audio support'
            'ffmpeg: h.264 video'
            'hunspell: spell checking'
            'hyphen: hyphenation'
            'libnotify: notification integration'
            'networkmanager: location detection via available WiFi networks'
            'speech-dispatcher: text-to-speech')
_url="https://download-installer.cdn.mozilla.net/pub/${_name}/nightly/latest-mozilla-central"
_src="${_name}-${_version}.${_lang}.linux"
_filename="$(date -u +%Y%m%d)-${_src}"
source=("${_pkgname}.desktop" 'policies.json')
source_i686=("${_filename}-i686.tar.bz2"::"${_url}/${_src}-i686.tar.bz2"
             "${_filename}-i686.tar.bz2.asc"::"${_url}/${_src}-i686.tar.bz2.asc"
             "${_filename}-i686.txt"::"${_url}/${_src}-i686.txt")
source_x86_64=("${_filename}-x86_64.tar.bz2"::"${_url}/${_src}-x86_64.tar.bz2"
               "${_filename}-x86_64.tar.bz2.asc"::"${_url}/${_src}-x86_64.tar.bz2.asc"
               "${_filename}-x86_64.txt"::"${_url}/${_src}-x86_64.txt")
sha512sums=('87c181628c3be0762000ff3b5cb841ed2c2371937e4aab7f8f441c608dd08d349085036880c8e8aaed40d01fe258ea9be159741e9fad9f493c96fb9be4cc0de3'
            '5ed67bde39175d4d10d50ba5b12063961e725e94948eadb354c0588b30d3f97d2178b66c1af466a6e7bd208ab694227a1391c4141f88d3da1a1178454eba5308')
sha512sums_i686=('754048e349347d50f4c4a82fddd8f156f5021187b5abf5166f0c49a6716121a99e1a60c587884ce9c146b37d6fd90b6fc34bab008680168ebbdaa86b8492a412'
                 'SKIP'
                 'eca478f524cd0409a4b4402a3375026732d21791dfec065505f3df9743daddfee7fecb0394af5737e5730dfd53f6e27d00a764a790900d3454826b0b83da5405')
sha512sums_x86_64=('ca7c1c70ef0787cb6e37dfaa0fb550d473e6994ac7e481ecd9141539a4f2dfa39e1de4ea322236206d17d66a1ac54e0d21f0e97486e5ce22713d32994812e720'
                   'SKIP'
                   'a91aa7321e421777506c59bce2a60d787b45f7f56f28bb5b822cbcb5ccc2ccd934537921e6833da45dabca4aa26dd21cbf602194a6d448eb5ae19977509df11f')
validpgpkeys=(14F26682D0916CDD81E37B6D61B7B526D98F0353) # Mozilla’s GnuPG release key

pkgver() {
  echo "${_version}.$(head -n1 ${_filename}-${CARCH}.txt)+h$(tail -n1 ${_filename}-${CARCH}.txt | cut -c 44-55)"
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
