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
_version=104.0a1
pkgver=104.0a1.20220630212430+h65f99678a1ef
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
sha512sums_i686=('48c4184f56aaf7c0e38f3ed4f5dc8d6cfa9061f2f3316fb857f7396c8bed6255e98489aacbb44964ba418a05f24e030b5e14e37e74ab19c29196d42aa65e3642'
                 'SKIP'
                 '96266fa8110e7f26427626477994260366bba72881f6ea56b41549a795eaaa1832faff0f7c0c24a2dc3637cd49b20c984bcce3c1a6995415425f7d2f4e8dc196')
sha512sums_x86_64=('0ec60efeb3bc4283de0244dd75b1b1a461ec378e4ae4dd6343ad3ce574f35f6d7043c29afbd310df3f9d446e8ee7ff7336aa95cef480ab0b0284f0e33c7fa775'
                   'SKIP'
                   '96266fa8110e7f26427626477994260366bba72881f6ea56b41549a795eaaa1832faff0f7c0c24a2dc3637cd49b20c984bcce3c1a6995415425f7d2f4e8dc196')
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
