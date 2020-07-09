# Maintainer: Anthony25 <anthony.ruhier @ gmail.com>
# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani @ gmail.com>
# Thanks to @xenom, contributor of firefox-nightly

_name=firefox
_channel=nightly
_lang=fr
_pkgname=${_name}-${_channel}
pkgname=${_pkgname}-${_lang}
pkgdesc="Standalone Web Browser from Mozilla — Nightly build (${_lang})"
url="https://www.mozilla.org/${_lang}/${_name}/${_channel}"
_version=80.0a1
pkgver=80.0a1.20200907
pkgrel=1
arch=(i686 x86_64)
license=(MPL GPL LGPL)
depends=(dbus-glib gtk3 libxt nss mime-types)
optdepends=('pulseaudio: audio support'
            'ffmpeg: h.264 video'
            'hunspell: spell checking'
            'hyphen: hyphenation'
            'libnotify: notification integration'
            'networkmanager: location detection via available WiFi networks'
            'speech-dispatcher: text-to-speech')
_url="https://download-installer.cdn.mozilla.net/pub/${_name}/nightly/latest-mozilla-central"
_src="${_name}-${_version}.${_lang}.linux"
_srcen="${_name}-${_version}.en-US.linux"
_filename="$(date +%Y%m%d)-${_src}"
source=("${_pkgname}.desktop" 'policies.json')
source_i686=("${_filename}-i686.tar.bz2"::"${_url}-l10n/${_src}-i686.tar.bz2"
             "${_filename}-i686.tar.bz2.asc"::"${_url}-l10n/${_src}-i686.tar.bz2.asc"
             "${_filename}-i686.txt"::"${_url}/${_srcen}-i686.txt")
source_x86_64=("${_filename}-x86_64.tar.bz2"::"${_url}-l10n/${_src}-x86_64.tar.bz2"
               "${_filename}-x86_64.tar.bz2.asc"::"${_url}-l10n/${_src}-x86_64.tar.bz2.asc"
               "${_filename}-x86_64.txt"::"${_url}/${_srcen}-x86_64.txt")
sha512sums=('0b58ffc470159ca50d699ea1006226f14fd1ea0aa622ac0a3b831ea39e25b46852064848bddfeefa358a86c378aa308c1690399429019e2895e56c7b042e8195'
            '5ed67bde39175d4d10d50ba5b12063961e725e94948eadb354c0588b30d3f97d2178b66c1af466a6e7bd208ab694227a1391c4141f88d3da1a1178454eba5308')
sha512sums_i686=('42d8821b47c0a5b5819864c512b551e88f3ce56e3941bdd01910ad310cee560994b91c2250a64d925c490a0c30f10517b7298650970ade704b802017cbfb19c1'
                 'SKIP'
                 'a80dce7ca10bb29e5190ee350e87ddf40571a4e8e1c498b1f56605b73b5865febab0b965a5f15ccbb65b9d8f0c03f93f6f29fd377c2bb2bae4613b5c751061a8')
sha512sums_x86_64=('42a9b4e2651f819a0273eef5f082ce49a4fd64ce758ed96c3256aef40f84f5c4c9e391cdc8fb94f3b507b0de489fd566cbf4806d6a979f12079c84587d81854b'
                   'SKIP'
                   'a80dce7ca10bb29e5190ee350e87ddf40571a4e8e1c498b1f56605b73b5865febab0b965a5f15ccbb65b9d8f0c03f93f6f29fd377c2bb2bae4613b5c751061a8')
validpgpkeys=(14F26682D0916CDD81E37B6D61B7B526D98F0353) # Mozilla’s GnuPG release key

pkgver() {
  echo "${_version}.$(head -n1 ${_filename}-${CARCH}.txt | cut -c-8)"
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
