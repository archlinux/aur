# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: Jonhoo <jon at thesquareplanet.com>

pkgname=signal-desktop
pkgver=1.1.0
pkgrel=1
pkgdesc='Private messaging from your desktop'
_basename=Signal-Desktop
license=('GPL3')
arch=('any')
url='https://github.com/WhisperSystems/Signal-Desktop'
conflicts=('signal' 'signal-desktop-bin' 'signal-desktop-beta')
depends=('alsa-lib' 'fontconfig' 'gconf' 'gtk2' 'libnotify' 'libappindicator-gtk2' 'libxtst' 'libxss' 'nss' 'pulseaudio')
makedepends=('npm' 'python2' 'yarn')
source=("git+${url}.git#tag=v${pkgver}" 'https://api.github.com/users/scottnonnenberg/gpg_keys' 'signal-desktop.desktop' 'signal-desktop')
sha256sums=('SKIP'
            'SKIP'
            'e99f7af8a3dbb631485bc513b82d44bfe0826cf8a29868f601e285fd4bf48a42'
            '39509f44492374c830c9d9f305b2d528cde905bb7b2c9aeaa74d1c1b23bd371f')

build() {
  msg2 "Verifying developer signature..."
  cd ${_basename}
  _key_id=$(git verify-tag -v v${pkgver} 2>&1|/bin/grep 'gpg.*using.*key'|awk '{print $NF}')
  /bin/grep "\"key_id\": \"$_key_id\"" ${srcdir}/gpg_keys && msg2 "Signature OK" || (msg2 "No valid developer signature found" && exit 1)

  cd ${srcdir}/${_basename}
  sed -i 's/19.29.2/19.47.0/' package.json
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
