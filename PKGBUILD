# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: Jonhoo <jon at thesquareplanet.com>

pkgname=signal-desktop
pkgver=1.1.0
pkgrel=3
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
source=("git+${url}.git#tag=v${pkgver}" 'https://api.github.com/users/scottnonnenberg/gpg_keys' 'signal-desktop.desktop' 'signal-desktop')
sha256sums=('SKIP'
            'SKIP'
            'e99f7af8a3dbb631485bc513b82d44bfe0826cf8a29868f601e285fd4bf48a42'
            '1b9696ea39c69d31bffcb4c3d7d3faa2e0439b1ee8e5ecc6a4a123692dfeba1f')

build() {
  msg2 "Verifying gpg signature..."
  cd ${_basename}
  _key_id=$(/bin/git verify-tag v${pkgver} 2>&1|/bin/grep using|awk '{print $NF}')
  echo "    Signed by: $_key_id"
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
