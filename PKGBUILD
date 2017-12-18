# Maintainer: David Birks <david@tellus.space>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Alda <alda@leetchee.fr>
# Contributor: mrxx <mrxx at cyberhome dot at>
# Contributor: Jonhoo <jon at thesquareplanet.com>
# Contributor: Jake <ja.ke@posteo.de>

pkgname=signal
pkgver=1.0.41
pkgrel=2
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
sha512sums=('433423a38404f06d18fc2aa79b925592ace247308b0553c1a4108eb511d505392a98de7a467dd59ca6916ec38e758fa97adcec5fe834a54e0f5f64db25d17781'
            'e6ee4914af88b75a520bbae55e4701a4a911b88d698a06b5bf9fdb612b377f2f6f50d19850fcc8737752d32e9f58aa48c3e7026931ab6dc6d796fa91db87c5ee'
            'a264bfc7a4a7aac747daa588a2acbf1eddfd201bc795f0fbc18460a9b25f4460f364124e227a527fec22631cd84bc9e190f9f4978069e9c119eb556b9ff2d327')

prepare() {
  cd "Signal-Desktop-${pkgver}"
  sed -i 's/icon-gen \&\& grunt/icon-gen \&\& grunt -f/' package.json
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
