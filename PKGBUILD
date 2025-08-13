# Maintainer: Emil Bay <archlinux@tixz.dk>
pkgname=nethermind-ethereum-bin
pkgver=1.32.4
_commit=1c4c7c0a
pkgrel=1
pkgdesc='A robust execution client for Ethereum node operators. Binary distribution.'
arch=('x86_64' 'aarch64')
url='https://downloads.nethermind.io/'
options=(!strip)
license=('LGPL-3.0-only')
depends=('zlib' 'base-devel')
provides=('nethermind' 'Nethermind.Runner')
conflicts=('nethermind' 'Nethermind.Runner')

source_x86_64=(
  "https://github.com/NethermindEth/nethermind/releases/download/${pkgver}/nethermind-${pkgver}-${_commit}-linux-x64.zip"
  "https://nethdev.blob.core.windows.net/builds/nethermind-${pkgver}-${_commit}-linux-x64.zip.asc"
)
source_aarch64=(
  "https://github.com/NethermindEth/nethermind/releases/download/${pkgver}/nethermind-${pkgver}-${_commit}-linux-arm64.zip"
  "https://nethdev.blob.core.windows.net/builds/nethermind-${pkgver}-${_commit}-linux-arm64.zip.asc"
)

sha256sums_x86_64=('2ae6a26f961c0acdbbf802aaf877f0f3687a54bf8f849647601ef10582aaced6'
                   'SKIP')
sha256sums_aarch64=('e250b21b4335ee447ccbdc2948a7043719e2e2fe9b75f83bfab5c853ae60cd9d'
                    'SKIP')
# Can be acquired with `gpg --receive-keys CB6DA407 34E353C6` (listed at the bottom of https://downloads.nethermind.io/)
validpgpkeys=('6942FB745ECE67D86CDA45704770A0C134E353C6' 'EECCEA1473108E3222D76722D39BE1DDCB6DA407')

backup=('etc/nethermind/NLog.config')

prepare() {
  bsdtar -xf nethermind-${pkgver}-${_commit}-linux-*.zip
}

package() {
  cd "$srcdir"

  # Install main binary and symlink
  install -Dm755 nethermind "$pkgdir/usr/bin/nethermind"
  ln -s nethermind "$pkgdir/usr/bin/Nethermind.Runner"

  # Install configuration
  install -Dm644 NLog.config "$pkgdir/etc/nethermind/NLog.config"
  find configs -type f -exec install -Dm644 "{}" "$pkgdir/etc/nethermind/{}" \;

  # Install plugins (preserving structure)
  find plugins -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/nethermind/{}" \;

  # Install data files (preserving structure)
  find Data -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/nethermind/{}" \;
}

