# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Emil Bay <archlinux@tixz.dk>
pkgname=nethermind-ethereum-bin
pkgver=1.35.2
_commit=faa9b9e6
pkgrel=1
pkgdesc='A robust execution client for Ethereum node operators'
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

sha256sums_x86_64=('b8b5029b7bbf7c3e5c6709eae6b55d958d8bb9a56ed9376f9937458f29129166'
                   'SKIP')
sha256sums_aarch64=('cceead2eb64dc7c0b11579e262230989f6ea955275d080a2cef516ec903d8255'
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
