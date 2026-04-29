# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Emil Bay <archlinux@tixz.dk>
pkgname=nethermind-ethereum-bin
pkgver=1.37.1
_commit=706ad499
pkgrel=1
pkgdesc='A robust execution client for Ethereum node operators'
arch=('x86_64' 'aarch64')
url='https://downloads.nethermind.io/'
options=(!strip)
license=('LGPL-3.0-only')
depends=('zlib')
provides=('nethermind' 'Nethermind.Runner')
conflicts=('nethermind' 'Nethermind.Runner')

source_x86_64=(
  "https://github.com/NethermindEth/nethermind/releases/download/${pkgver}/nethermind-${pkgver}-${_commit}-linux-x64.zip"
)
source_aarch64=(
  "https://github.com/NethermindEth/nethermind/releases/download/${pkgver}/nethermind-${pkgver}-${_commit}-linux-arm64.zip"
)

sha256sums_x86_64=('1424ccd96fa3d759fe441555106f2dcd4967ba929380ffd2926f885f4d2db2a1')
sha256sums_aarch64=('8c13a497b4f9ff6025eb3dc140964212e718e382b208c1a40236c02e870200b8')

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
