# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Emil Bay <archlinux@tixz.dk>
pkgname=nethermind-ethereum-bin
pkgver=1.39.0
_commit=14aca2c5
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
sha256sums_x86_64=('a633c2ab6e377eed8573d6f879bdeddc48d83c1819a5554d0f07d8eb7aaa616d')
sha256sums_aarch64=('eef9e77bc789e88e83ed0d558f12b2c231ededdf79c388ccc2f8f5116976756d')

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
