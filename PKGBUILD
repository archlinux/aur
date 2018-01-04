# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=signal-desktop
pkgver=1.1.0
pkgrel=7
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
            '0ee7733814827a92fae89df751d4d4e5e0ee28e2a59457b224ec50b7aec31a3a'
            '91e6ab7a997a94326348183cd8de1c8eb07161ef533d357690d297b1a5f15c79')

build() {
  cd ${_basename}
  /bin/git verify-tag -v v${pkgver} 2>&1|/bin/grep -e '^tagger' -e '^gpg:.*Signature made' -e '^gpg:.*using.*key'

  cd ${srcdir}/${_basename}
  sed -i -re 's/("electron":)(.*)/\1 "~1.7.10",/;s/("electron-builder":)(.*)/\1 "~19.52.1",/;s/("electron-updater":)(.*)/\1 "~2.18.2",/' package.json
  yarn install
  yarn pack-prod
}

package() {
  mkdir -p ${pkgdir}/usr/{bin,lib/${pkgname},share/applications}
  install -Dm755 -t ${pkgdir}/usr/bin ${pkgname}
  install -Dm644 -t ${pkgdir}/usr/share/applications ${pkgname}.desktop
  for i in 16 24 32 48 64 128 256 512; do install -Dm644 ${_basename}/build/icons/png/${i}x${i}.png ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png; done
  cd ${pkgdir}/usr/lib/${pkgname}
  cp -r ${srcdir}/${_basename}/dist/linux-unpacked/* .
  find . -type d | xargs chmod 755
  find . -type f | xargs chmod 644
  chmod +x ${pkgname}
}
