# Maintainer: Michael Moroni <michaelmoroni AT disroot DOT org >
# Contributor: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Cedric Girard <girard.cedric@gmail.com>
# Contributor: Det <nimetonmaili at gmail a-dot com>
# Based on AUR's thunderbird-nightly

_name=thunderbird
_channel=nightly
_lang=it
pkgname=${_name}-${_channel}-${_lang}
pkgver=79.0a1
_version=79.0a1
pkgrel=1
pkgdesc="Standalone Mail/News reader - Nightly build (${_lang})"
arch=('i686' 'x86_64')
url="http://www.mozilla.org/it/thunderbird"
license=('MPL' 'GPL' 'LGPL')
depends=('alsa-lib' 'cairo' 'dbus-glib' 'desktop-file-utils' 'fontconfig'
         'freetype2' 'gtk3' 'hicolor-icon-theme' 'hunspell' 'libevent' 'libjpeg'
         'libmng' 'libpng' 'libvpx' 'libxt' 'mozilla-common' 'nspr' 'nss'
         'shared-mime-info' 'sqlite' 'startup-notification')
optdepends=('libcanberra: for sound support')
provides=("thunderbird=${_version}")
install="${pkgname}.install"

FX_SRC_EN="${_name}-${_version}.en-US.linux-${CARCH}"
FX_SRC_URI_EN="https://download-installer.cdn.mozilla.net/pub/${_name}/${_channel}/latest-comm-central/${FX_SRC_EN}"
FX_SRC="${_name}-${_version}.${_lang}.linux-${CARCH}"
FX_SRC_URI="https://download-installer.cdn.mozilla.net/pub/${_name}/${_channel}/latest-comm-central-l10n/${FX_SRC}"

source=("${FX_SRC_URI_EN}.txt"
        "${FX_SRC_URI}.tar.bz2"
        "$pkgname.desktop"
        "vendor.js")

sha512sums=('SKIP'
            'SKIP'
            '4f885cc6a2867db6864ade4f953bf743ebd779cc7fec8335aa60176c3c90306525b987c966f6f18484d07c131a88878306d037cc17207a0d01b198ccbc79852b'
            'aeb444784732267f1b1e87e6084a776f82a1912c4c2637d2cf1de1c135dd9d41d2ef66d2bd3f9cbd3a79fad32d17ea6e2968ba644d5f887cb66ba6c09a2098f5')

pkgver(){
    echo "${_version}.$(head -n1 "${FX_SRC_EN}.txt" |cut -c -8)"
}

package() {
  install -d "${pkgdir}"/{usr/bin,opt}
  cp -a thunderbird "${pkgdir}"/opt/${pkgname}-${pkgver}
  cp vendor.js "${pkgdir}"/opt/${pkgname}-${pkgver}/defaults/pref/
  ln -s /opt/${pkgname}-${pkgver}/thunderbird "${pkgdir}"/usr/bin/${pkgname}
  for i in 16x16 32x32 48x48 64x64 128x128; do
      install -Dm644 thunderbird/chrome/icons/default/default${i/x*/}.png "${pkgdir}"/usr/share/icons/hicolor/${i}/apps/${pkgname}.png
  done
  install -Dm644 ${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
  rm -rf "${pkgdir}"/opt/${pkgname}-${pkgver}/dictionaries/
  ln -sf /usr/share/hunspell/ "${pkgdir}"/opt/${pkgname}-${pkgver}/dictionaries
}
