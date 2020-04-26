# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Cedric Girard <girard.cedric@gmail.com>
# Contributor: Det <nimetonmaili at gmail a-dot com>
# Based on [extra]'s thunderbird

pkgname=thunderbird-nightly
pkgver=77.0a1.20200416
_version=77.0a1
pkgrel=1
pkgdesc='Standalone Mail/News reader - Nightly build'
arch=('i686' 'x86_64')
url="http://www.mozilla.org/thunderbird"
license=('MPL' 'GPL' 'LGPL')
depends=('alsa-lib' 'cairo' 'dbus-glib' 'desktop-file-utils' 'fontconfig'
         'freetype2' 'gtk3' 'hicolor-icon-theme' 'hunspell' 'libevent' 'libjpeg'
         'libmng' 'libpng' 'libvpx' 'libxt' 'mozilla-common' 'nspr' 'nss'
         'shared-mime-info' 'sqlite' 'startup-notification')
optdepends=('libcanberra: for sound support')
provides=("thunderbird=${_version}")
install="${pkgname}.install"

FX_SRC="thunderbird-${_version}.en-US.linux-${CARCH}"
FX_SRC_URI="https://download-installer.cdn.mozilla.net/pub/thunderbird/nightly/latest-comm-central/${FX_SRC}"

source=("${FX_SRC_URI}.txt"
        "${FX_SRC_URI}.tar.bz2"
        "$pkgname.desktop"
        "vendor.js")

b2sums=('85c786e0bb2dcf854c4dc0e50619749320bb646bc800abbb03f159ae70dbf14c4e8754082959115807ad3e0a36e54fb9572e8243073c62146fd110bdc24ef0a0'
        '293c8e60d28508aec3cdb2f2b0376cae920f7014a3fa1cef28d38121567e2130214bac9525f0ba227566836da65f4f6c0e4d791ca9c1b4cb3efdb52150e0e48e'
        '1f954c9a23842367be37c1f56b853de6a336c1b4156df42f88b14f1614d194c2f996f1cc589cdbfcea398bb9cedcd527ef3c6fb8b01e2f07c46290043e24c6b7'
        '674d1ee883e675c37b0af0ac97c339a8c0f2b53cb06e64db64aaa3f22f83d7179b6fa3e122344f3413ccb9956776288db9bc608b5cedef640cbd223838be7476')

pkgver(){
  echo "${_version}.$(head -n1 "${FX_SRC}.txt" |cut -c -8)"
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
