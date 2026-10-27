# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Emil Bay <archlinux@tixz.dk>
pkgname=nethermind-ethereum-bin
pkgver=2.2.2
_commit=be201120
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
sha256sums_x86_64=('ab37ee6900ca86db4209e8f44409897a32587b29084c19274cc54cf8b8e23d59')
sha256sums_aarch64=('e7fe1dc3a104ef4ba4656a803802598d60c33490f6104cea53900d5a8bcde496')

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
