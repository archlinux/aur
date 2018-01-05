# Maintainer: David Birks <david@tellus.space>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Alda <alda@leetchee.fr>
# Contributor: mrxx <mrxx at cyberhome dot at>
# Contributor: Jonhoo <jon at thesquareplanet.com>
# Contributor: Jake <ja.ke@posteo.de>

pkgname=signal
pkgver=1.1.0
pkgrel=1
license=('GPL3')
pkgdesc='Signal Private Messenger for the Desktop'
depends=('electron' 'gconf' 'gtk2' 'libxss')
makedepends=('npm' 'ruby-sass' 'python2' 'phantomjs' 'yarn' 'grunt-cli')
provides=('signal')
conflicts=('signal-desktop' 'signal-desktop-beta' 'signal-desktop-bin')
arch=("i686" "x86_64")
url='https://github.com/WhisperSystems/Signal-Desktop'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/WhisperSystems/Signal-Desktop/archive/v${pkgver}.tar.gz"
        "${pkgname}.sh"
        "${pkgname}.desktop")
sha512sums=('f8409ace472f2bf7614741ddb0f612faaf9f130141bd22539dc0ee4987dd8260136dc53965876c101cce8e15bf2769ab8cb30a07ae304491d97704370bc57058'
            '2c7f7ab67b94f5c5ed799eba2c47c466d35bf16a60b6311bac606956e25689b21e3ffa2373cf47289d83d46e20da1213866ade06009eccd8012e840a7428f056'
            'a264bfc7a4a7aac747daa588a2acbf1eddfd201bc795f0fbc18460a9b25f4460f364124e227a527fec22631cd84bc9e190f9f4978069e9c119eb556b9ff2d327')

prepare() {
  cd "Signal-Desktop-${pkgver}"
  # Fix issues/1829
  sed -i 's/"electron-builder": "^19.29.2"/"electron-builder": "^19.47.0"/' package.json
}

build() {
  cd "Signal-Desktop-${pkgver}"
  yarn install | grep -Ev 'bin-mac|bin-win'
  yarn pack-prod
}

package() {
  cd "Signal-Desktop-${pkgver}/dist/linux-unpacked"

  install -Ddm755 "${pkgdir}/usr/lib/${pkgname}"
  install -Ddm755 "${pkgdir}/usr/bin"

  cp -r resources "${pkgdir}/usr/lib/${pkgname}/"

  install -dm755 "${pkgdir}"/usr/share/icons/hicolor/256x256/apps
  cp ../../build/icons/png/256x256.png \
      "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/${pkgname}.png

  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}-desktop"
  
  install -Dm644 "${srcdir}"/${pkgname}.desktop \
      "${pkgdir}"/usr/share/applications/${pkgname}.desktop
}
