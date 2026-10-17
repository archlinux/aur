# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Emil Bay <archlinux@tixz.dk>
pkgname=nethermind-ethereum-bin
pkgver=2.2.0
_commit=1d2aff00
pkgrel=1
pkgdesc='A robust execution client for Ethereum node operators'
arch=('x86_64' 'aarch64')
url='https://downloads.nethermind.io/'
options=(!strip)
license=('LGPL-3.0-only')
depends=('bash' 'zlib')
provides=('nethermind' 'Nethermind.Runner')
conflicts=('nethermind' 'Nethermind.Runner')
backup=('etc/nethermind/NLog.config')
source=(
  "https://github.com/NethermindEth/nethermind/raw/${_commit}/LICENSE-LGPL"
)
source_x86_64=(
  "https://github.com/NethermindEth/nethermind/releases/download/${pkgver}/nethermind-${pkgver}-${_commit}-linux-x64.zip"
)
source_aarch64=(
  "https://github.com/NethermindEth/nethermind/releases/download/${pkgver}/nethermind-${pkgver}-${_commit}-linux-arm64.zip"
)
sha256sums=('e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118')
sha256sums_x86_64=('5217a3b6fbd613696affd87cad595f0351cd9c5b68ddd4701bbcdf43f70ec55d')
sha256sums_aarch64=('281f7e4cb8724492d872e46986c45e36529d7689441a271f3296fc221e60674b')

prepare() {
  bsdtar -xf nethermind-${pkgver}-${_commit}-linux-*.zip
}

package() {
  install -Dm755 nethermind "$pkgdir/usr/lib/nethermind/nethermind"
  ln -s nethermind "$pkgdir/usr/lib/nethermind/Nethermind.Runner"
  find plugins -type f -exec install -Dm644 -t "$pkgdir/usr/lib/nethermind/plugins" {} +
  find Data -type f -exec install -Dm644 {} "$pkgdir/usr/share/nethermind/{}" \;
  ln -s ../../share/nethermind/Data "$pkgdir/usr/lib/nethermind/Data"
  install -Dm644 NLog.config "$pkgdir/etc/nethermind/NLog.config"
  install -Dm644 configs/* -t "$pkgdir/etc/nethermind/configs"
  install -Dm755 "$startdir/nethermind.sh" "$pkgdir/usr/bin/nethermind"
  ln -s nethermind "$pkgdir/usr/bin/Nethermind.Runner"
  install -Dm644 LICENSE-LGPL "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
