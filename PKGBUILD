# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Emil Bay <archlinux@tixz.dk>
pkgname=nethermind-ethereum-bin
pkgver=1.36.1
_commit=80eccc19
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

sha256sums_x86_64=('1953648b97018d9d0efb39a5621fd54f810c28680537cd10a5602393ced62658')
sha256sums_aarch64=('c538e5bad58d1174f3898c4f8368694168f797102d0ed08a61fa8e616e2096a1')

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
