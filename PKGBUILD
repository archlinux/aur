# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=signal-desktop
pkgver=1.0.36
pkgrel=1
pkgdesc='Private messaging from your desktop'
_basename=Signal-Desktop
license=('GPL3')
arch=('any')
url='https://github.com/WhisperSystems/Signal-Desktop'
conflicts=('signal' 'signal-desktop-bin' 'signal-desktop-beta')
depends=('electron' 'gconf' 'gtk2')
makedepends=('grunt-cli' 'npm' 'phantomjs' 'python2' 'ruby-sass' 'yarn')
source=("${url}/archive/v${pkgver}.tar.gz" 'signal-desktop.desktop' 'signal-desktop')
sha256sums=('32311ce02032b07311706fa0b24f3c07bcf823fc7ffd398cacecf8fd25ea05fd'
            'e99f7af8a3dbb631485bc513b82d44bfe0826cf8a29868f601e285fd4bf48a42'
            '39509f44492374c830c9d9f305b2d528cde905bb7b2c9aeaa74d1c1b23bd371f')

build() {
  cd ${_basename}-${pkgver}
  yarn install |grep -Ev 'bin-mac|bin-win'
  yarn pack-prod
}

package() {
  mkdir -p ${pkgdir}/usr/{bin,lib/${pkgname},share/applications}
  install -Dm755 -t ${pkgdir}/usr/bin ${pkgname}
  install -Dm644 -t ${pkgdir}/usr/share/applications ${pkgname}.desktop
  for i in 16 24 32 48 64 128 256 512; do install -Dm644 ${_basename}-${pkgver}/build/icons/png/${i}x${i}.png ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png; done
  cd ${pkgdir}/usr/lib/${pkgname}
  cp -r ${srcdir}/${_basename}-${pkgver}/dist/linux-unpacked/* .
  find . -type d | xargs chmod 755
  find . -type f | xargs chmod 644
  chmod +x ${pkgname}
}
