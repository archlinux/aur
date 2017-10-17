# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Alda <alda@leetchee.fr>

pkgname=signal
pkgver=1.0.31
pkgrel=1
license=('GPL3')
pkgdesc='Signal Private Messenger for the Desktop'
depends=('electron' 'gconf' 'gtk2')
makedepends=('npm' 'ruby-sass' 'python2' 'phantomjs' 'yarn' 'grunt-cli')
arch=("i686" "x86_64")
url='https://whispersystems.org'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/WhisperSystems/Signal-Desktop/archive/v${pkgver}.tar.gz"
	"signal.desktop")
sha512sums=('41fdd223f666bd011c6371ce30fec52c3eee1f570ff07b869a4bcda777af373e7406f63533a3c2136b8f7dafc7a250c65a6e3bacf24b0409fae3d2a5d5d5f245'
	    'a264bfc7a4a7aac747daa588a2acbf1eddfd201bc795f0fbc18460a9b25f4460f364124e227a527fec22631cd84bc9e190f9f4978069e9c119eb556b9ff2d327')

prepare() {
  cd "Signal-Desktop-${pkgver}"
  sed -i 's/icon-gen \&\& grunt/icon-gen \&\& grunt -f/' package.json
}

build() {
  cd "Signal-Desktop-${pkgver}"
  yarn install
  yarn pack-prod
}

package() {
  cd "Signal-Desktop-${pkgver}/dist/linux-unpacked"

  install -Ddm755 "${pkgdir}/usr/lib/${pkgname}"
  install -Ddm755 "${pkgdir}/usr/bin"

  cp -r * "${pkgdir}/usr/lib/${pkgname}/"

  install -dm755 "${pkgdir}"/usr/share/icons/hicolor/256x256/apps
  cp ../../build/icons/png/256x256.png \
      "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/${pkgname}.png

  install -Dm644 "${srcdir}"/${pkgname}.desktop \
      "${pkgdir}"/usr/share/applications/${pkgname}.desktop

  ln -s /usr/lib/${pkgname}/signal-desktop "${pkgdir}/usr/bin/signal-desktop"
}
