# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Alda <alda@leetchee.fr>

pkgname=signal
pkgver=1.0.27
pkgrel=2
license=('GPL3')
pkgdesc='Signal Private Messenger for the Desktop'
depends=('electron')
makedepends=('npm' 'ruby-sass' 'python2' 'gconf' 'phantomjs' 'yarn' 'grunt-cli')
arch=("i686" "x86_64")
url='https://whispersystems.org'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/WhisperSystems/Signal-Desktop/archive/v${pkgver}.tar.gz"
	"signal.desktop")
sha512sums=('1caf4da64d38fbfcfbd237a3e3495f11b711ee55d1d73180117567d96631c07f05a82ac173578b4b6ac03c323b656ad74d7bd7bcbbfbb26c0e0afcbfc836db08'
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
