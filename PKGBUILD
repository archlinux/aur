# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: Jonhoo <jon at thesquareplanet.com>

pkgname=signal-desktop
pkgver=1.0.40
pkgrel=1
pkgdesc='Private messaging from your desktop'
_basename=Signal-Desktop
license=('GPL3')
arch=('any')
url='https://github.com/WhisperSystems/Signal-Desktop'
conflicts=('signal' 'signal-desktop-bin' 'signal-desktop-beta')
depends=('gconf' 'gtk2')
makedepends=('grunt-cli' 'npm' 'phantomjs' 'python2' 'ruby-sass' 'yarn')
source=("git+${url}.git#tag=v${pkgver}" 'https://api.github.com/users/scottnonnenberg/gpg_keys' 'signal-desktop.desktop' 'signal-desktop')
sha256sums=('SKIP'
            'SKIP'
            'e99f7af8a3dbb631485bc513b82d44bfe0826cf8a29868f601e285fd4bf48a42'
            '39509f44492374c830c9d9f305b2d528cde905bb7b2c9aeaa74d1c1b23bd371f')

build() {
  msg2 "Verifying developer signature..."
  cd ${_basename}
  _key_id=$(git verify-tag -v v${pkgver} 2>&1|grep 'gpg.*using.*key'|awk '{print $NF}')
  grep "\"key_id\": \"$_key_id\"" ${srcdir}/gpg_keys

  cd ${srcdir}/${_basename}
  yarn install |grep -Ev 'bin-mac|bin-win'
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
