# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Cedric Girard <girard.cedric@gmail.com>
# Contributor: Det <nimetonmaili at gmail a-dot com>
# Based on [extra]'s thunderbird

pkgname=(thunderbird-nightly-bin thunderbird-nightly-bin-noupdate)
pkgver=86.0a1.20201215
_version=86.0a1
pkgrel=1
arch=('x86_64')
url="https://www.mozilla.org/thunderbird"
license=('MPL' 'GPL' 'LGPL')
FX_SRC="thunderbird-${_version}.en-US.linux-${CARCH}"
FX_SRC_URI="https://download-installer.cdn.mozilla.net/pub/thunderbird/nightly/latest-comm-central/${FX_SRC}"

source=("${FX_SRC_URI}.txt"
        "${FX_SRC_URI}.tar.bz2"
        "${pkgname%-bin}.desktop"
        vendor.js
        policies.json)

b2sums=('SKIP'
        'SKIP'
        '1f954c9a23842367be37c1f56b853de6a336c1b4156df42f88b14f1614d194c2f996f1cc589cdbfcea398bb9cedcd527ef3c6fb8b01e2f07c46290043e24c6b7'
        '674d1ee883e675c37b0af0ac97c339a8c0f2b53cb06e64db64aaa3f22f83d7179b6fa3e122344f3413ccb9956776288db9bc608b5cedef640cbd223838be7476'
        'f8df63721191d84d8f1ceec263f63c44fd5dadeae0939baf9a4a6b1852516722b2a3d94b8d403cc7b6c6b525d5236f357ab65a72d716aab1f5bef47800b5a18c')

pkgver(){
  echo "${_version}.$(head -n1 "${FX_SRC}.txt" |cut -c -8)"
}

package_thunderbird-nightly-bin() {
  pkgdesc='Standalone Mail/News reader - Nightly build'
  depends=('alsa-lib' 'cairo' 'dbus-glib' 'desktop-file-utils' 'fontconfig'
         'freetype2' 'gtk3' 'hicolor-icon-theme' 'hunspell' 'libevent' 'libjpeg'
         'libmng' 'libpng' 'libvpx' 'libxt' 'mozilla-common' 'nspr' 'nss'
         'shared-mime-info' 'sqlite' 'startup-notification')
  optdepends=('libcanberra: for sound support')
  provides=("thunderbird=${_version}" 'thunderbird-nightly')
  conflicts=('thunderbird-nightly')
  install="${pkgname%-bin}.install"

  install -d "${pkgdir}"/{usr/bin,opt}
  cp -a thunderbird "${pkgdir}"/opt/${pkgname%-bin}-${pkgver}
  cp vendor.js "${pkgdir}"/opt/${pkgname%-bin}-${pkgver}/defaults/pref/
  ln -s /opt/${pkgname%-bin}-${pkgver}/thunderbird "${pkgdir}"/usr/bin/${pkgname%-bin}
  for i in 16x16 32x32 48x48 64x64 128x128; do
      install -Dm644 thunderbird/chrome/icons/default/default${i/x*/}.png "${pkgdir}"/usr/share/icons/hicolor/${i}/apps/${pkgname%-bin}.png
  done
  install -Dm644 ${pkgname%-bin}.desktop "${pkgdir}"/usr/share/applications/${pkgname%-bin}.desktop
  rm -rf "${pkgdir}"/opt/${pkgname%-bin}-${pkgver}/dictionaries/
  ln -sf /usr/share/hunspell/ "${pkgdir}"/opt/${pkgname%-bin}-${pkgver}/dictionaries
}

package_thunderbird-nightly-bin-noupdate() {
  pkgdesc='Standalone Mail/News reader - Nightly build with disabled update notifications'
  depends=('thunderbird-nightly-bin')
  install -Dm644 -t "${pkgdir}"/opt/${pkgname%-bin-noupdate}-${pkgver}/distribution policies.json
}
