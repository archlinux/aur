# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=signal-desktop
pkgver=1.2.0
pkgrel=1
pkgdesc='Private messaging from your desktop'
_basename=Signal-Desktop
license=('GPL3')
arch=('any')
url='https://github.com/WhisperSystems/Signal-Desktop'
conflicts=('signal' 'signal-desktop-bin' 'signal-desktop-beta')
depends=('alsa-lib' 'fontconfig' 'gconf' 'gtk2' 'libnotify' 'libxtst' 'libxss' 'nss')
optdepends=('gnome-shell-extension-topicons-plus')
makedepends=('git' 'npm' 'python2' 'yarn')
install=signal-desktop.install
source=("git+${url}.git#tag=v${pkgver}" 'signal-desktop.desktop' 'signal-desktop' 'signal-desktop.install')
sha256sums=('SKIP'
            '2287a32ed2ad8772fab02b7ec3bda185c6e85263f7b6b62595b66535ba8687b0'
            '235711732657fab3a6c420bd975bb02ed8757d5e741b563490c0bc74ea1182b9'
            'c83f0d15bf90ad5d218bc8051a1f67fed67b8709d79e6b1339b6ad653a0168de')

build() {
  cd ${_basename}
  /bin/git verify-tag -v v${pkgver} 2>&1|/bin/grep -e '^tagger' -e '^gpg:.*Signature made' -e '^gpg:.*using.*key'

  cd ${srcdir}/${_basename}
  sed -i -re 's/("electron":)(.*)/\1 "~1.7.11",/;s/("electron-builder":)(.*)/\1 "~19.53.7",/;s/("electron-updater":)(.*)/\1 "~2.18.2",/' package.json
  yarn install
  yarn pack-prod
}

package() {
  mkdir -p ${pkgdir}/usr/{bin,lib/${pkgname},share/applications}
  install -Dm755 -t ${pkgdir}/usr/bin ${pkgname}
  install -Dm644 -t ${pkgdir}/usr/share/applications ${pkgname}.desktop
  for i in 16 24 32 48 64 128 256 512; do install -Dm644 ${_basename}/build/icons/png/${i}.png ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png; done
  cd ${pkgdir}/usr/lib/${pkgname}
  cp -r ${srcdir}/${_basename}/dist/linux-unpacked/* .
  find . -type d | xargs chmod 755
  find . -type f | xargs chmod 644
  chmod +x ${pkgname}
}
