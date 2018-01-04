# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: Jonhoo <jon at thesquareplanet.com>

pkgname=signal-desktop
pkgver=1.1.0
pkgrel=6
pkgdesc='Private messaging from your desktop'
_basename=Signal-Desktop
license=('GPL3')
arch=('any')
url='https://github.com/WhisperSystems/Signal-Desktop'
_gpg_keys=https://api.github.com/users/scottnonnenberg/gpg_keys
conflicts=('signal' 'signal-desktop-bin' 'signal-desktop-beta')
depends=('alsa-lib' 'fontconfig' 'gconf' 'gtk2' 'libnotify' 'libxtst' 'libxss' 'nss')
optdepends=('gnome-shell-extension-topicons-plus')
makedepends=('git' 'npm' 'python2' 'yarn')
install=signal-desktop.install
source=("git+${url}.git#tag=v${pkgver}" "$_gpg_keys" 'signal-desktop.desktop' 'signal-desktop' 'signal-desktop.install')
sha256sums=('SKIP'
            'SKIP'
            '2287a32ed2ad8772fab02b7ec3bda185c6e85263f7b6b62595b66535ba8687b0'
            '0ee7733814827a92fae89df751d4d4e5e0ee28e2a59457b224ec50b7aec31a3a'
            '91e6ab7a997a94326348183cd8de1c8eb07161ef533d357690d297b1a5f15c79')

build() {
  msg2 "Verifying gpg signature..."
  [ ! -s ${srcdir}/gpg_keys ] && (msg2 "Unable to verify the gpg signature as the developer's keys file was not downloaded properly from $_gpg_keys" && exit 1)
  cd ${_basename}
  _key_id=$(/bin/git verify-tag v${pkgver} 2>&1|/bin/grep using|awk '{print $NF}')
  [ -z "$_key_id" ] && (msg2 "Git source NOT trusted: it has no gpg signature at all" && exit 1)
  echo "  Signing key: $_key_id"
  /bin/grep "\"key_id\":.*\"$_key_id\"" ${srcdir}/gpg_keys || (msg2 "Git source NOT trusted: gpg signature is from an unknown third party" && exit 1)
  msg2 "Signature OK"

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
