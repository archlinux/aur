# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Emil Bay <archlinux@tixz.dk>
pkgname=nethermind-ethereum-bin
pkgver=1.33.1
_commit=cda59e5b
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

sha256sums_x86_64=('954d725c992d030f6eb8916914ae2d4258c6cfab737adab2caea5cbe5a3b6dad'
                   'SKIP')
sha256sums_aarch64=('80321c48b7021e39336be13e712906a229c099174c875345da090a6b7f987350'
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
