# Maintainer: Emil Bay <archlinux@tixz.dk>
pkgname=nethermind-ethereum-bin
_pkgname=nethermind
pkgver=1.28.0
_pkgver=1.28.0
_commit=9c4816c2
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
md5sums_x86_64=('3e2c44e533ab9fdefa0f76b0dd32b8f2'
                'SKIP')
md5sums_aarch64=('bfe0d83c255f4a57ca9fd022738411a0'
                 'SKIP')
sha256sums_x86_64=('66e4a0e2d0f25e0c2893fbe5981366cdaf1f37359f1fd882732e1bc32fc5cbcd'
                   'SKIP')
sha256sums_aarch64=('8fbf5b5d21306cc19c27978095c8ff46613efd240d3daf56180296b45bccaf56'
                    'SKIP')
b2sums_x86_64=('e0a2ed43ff9cc0b0000ca21020341c97a78b4baf1332a064ef693122af2f641c4ce2809bee5d90d2e306d81f3a6048d0392f04f5cc0c2c9b80b43f5ea4667a4d'
               'SKIP')
b2sums_aarch64=('20b35d24db3c7a9aa7a51d5095cf5c3adbf68a28c53939038216ae20a7ed8d003b0c678c6d13c5979a6d05f5282f912762c779c9ac4fdb855640f232342b4993'
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
