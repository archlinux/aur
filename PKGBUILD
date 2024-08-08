# Maintainer: Emil Bay <archlinux@tixz.dk>
pkgname=nethermind-ethereum-bin
_pkgname=nethermind
pkgver=1.27.1
_pkgver=1.27.1
_commit=d2d5d4ae
pkgrel=1
pkgdesc='A robust execution client for Ethereum node operators. Binary distribution.'
arch=('x86_64' 'aarch64')
url='https://downloads.nethermind.io/'
license=('LGPL-3.0-only')
depends=('zlib' 'base-devel')
provides=('nethermind' 'nethermind-cli' 'nethermind-launcher' 'Nethermind.Runner')
conflicts=('nethermind' 'nethermind-cli' 'nethermind-launcher' 'Nethermind.Runner')
source_x86_64=(
  "https://github.com/NethermindEth/nethermind/releases/download/${_pkgver}/nethermind-${_pkgver}-${_commit}-linux-x64.zip"
  "https://nethdev.blob.core.windows.net/builds/nethermind-${_pkgver}-${_commit}-linux-x64.zip.asc"
)
source_aarch64=(
  "https://github.com/NethermindEth/nethermind/releases/download/${_pkgver}/nethermind-${_pkgver}-${_commit}-linux-arm64.zip"
  "https://nethdev.blob.core.windows.net/builds/nethermind-${_pkgver}-${_commit}-linux-arm64.zip.asc"
)
md5sums_x86_64=('49742a7182ef6f01427786af132a512a'
                'SKIP')
md5sums_aarch64=('871cf64dcd03a7706c8779205842a4ed'
                 'SKIP')
sha256sums_x86_64=('a901315a1060878e29315a93241dc480f55e7e06c085b0a0531c254e8c97468f'
                   'SKIP')
sha256sums_aarch64=('664bbbda4638b78df413fcfd2fd2a39a075fe3ae80f28bb984c34ced324d5aa3'
                    'SKIP')
b2sums_x86_64=('c01d5a80e2e6b879211fbf7bb8535ef620237e3843b9a9784b7c89868fb13164d7599ba795c5993b839b89cbc40d937124a742454a94f6c9c9a3d87eda4e0c0b'
               'SKIP')
b2sums_aarch64=('07953cbdecad391af45ef0e7a4f4fc2a377d86a8372e6b6376a6b70e7d6674ce308e911a4fc86c4d1f2b58f8b540fd5f35ed2ef20b9aac2e14a3e25ba58d03c6'
                'SKIP')
# Can be acquired with `gpg --receive-keys CB6DA407 34E353C6` (listed at the bottom of https://downloads.nethermind.io/)
validpgpkeys=('6942FB745ECE67D86CDA45704770A0C134E353C6' 'EECCEA1473108E3222D76722D39BE1DDCB6DA407')

backup=('etc/nethermind/NLog.config')

package() {
  configs_srcdir="$srcdir/configs"
  plugins_srcdir="$srcdir/plugins"
  data_srcdir="$srcdir/Data"

  # Binaries
  for b in "${provides[@]}"; do
    install -D -m755 --mode=+xr "$srcdir/$b" "$pkgdir/usr/bin/$b"
  done

  # install config recursively
  install -D -m644 "$srcdir/NLog.config" "$pkgdir/etc/nethermind/NLog.config"

  for c in $(find "$configs_srcdir" -type f); do
    install -D -m644 "$c" "$pkgdir/etc/nethermind/configs/${c#$configs_srcdir}"
  done

  # Plugins
  for p in $(find "$plugins_srcdir" -type f); do
    install -D -m644 "$p" "$pkgdir/usr/share/nethermind/plugins/${p#$plugins_srcdir}"
  done

  # Data
  for d in $(find "$data_srcdir" -type f); do
    install -D -m644 "$d" "$pkgdir/usr/share/nethermind/Data/${d#$data_srcdir}"
  done
}
