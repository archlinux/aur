# Maintainer: Emil Bay <archlinux@tixz.dk>
pkgname=nethermind-ethereum-bin
_pkgname=nethermind
pkgver=1.31.9
_pkgver=1.31.9
_commit=98c5dca4
pkgrel=1
pkgdesc='A robust execution client for Ethereum node operators. Binary distribution.'
arch=('x86_64' 'aarch64')
url='https://downloads.nethermind.io/'
license=('LGPL-3.0-only')
depends=('zlib' 'base-devel')
provides=('nethermind' 'nethermind-cli' 'Nethermind.Runner')
conflicts=('nethermind' 'nethermind-cli' 'Nethermind.Runner')
source_x86_64=(
  "https://github.com/NethermindEth/nethermind/releases/download/${_pkgver}/nethermind-${_pkgver}-${_commit}-linux-x64.zip"
  "https://nethdev.blob.core.windows.net/builds/nethermind-${_pkgver}-${_commit}-linux-x64.zip.asc"
)
source_aarch64=(
  "https://github.com/NethermindEth/nethermind/releases/download/${_pkgver}/nethermind-${_pkgver}-${_commit}-linux-arm64.zip"
  "https://nethdev.blob.core.windows.net/builds/nethermind-${_pkgver}-${_commit}-linux-arm64.zip.asc"
)
md5sums_x86_64=('51d545c960be3eee49d88ff27c4a4f8a'
                'SKIP')
md5sums_aarch64=('7117d25cbe36dd60b215203e56f27ac5'
                 'SKIP')
sha256sums_x86_64=('69401a256debb65fb86226a196311252ff356dde8482a36213199cd5114fa998'
                   'SKIP')
sha256sums_aarch64=('3f90034c15b26c3be2bfd213d47f99b337a099370273f1fdc3be6446c8bd689c'
                    'SKIP')
b2sums_x86_64=('3b30d6e9ce01534859ebea0b1494b7adb1683da794224fff8eba8e4f9f9da6432e83a0d18c92fd425b4ae4934c11a6b0d1c215d119a017e0a404c6a5cfddad1a'
               'SKIP')
b2sums_aarch64=('5cdff05b07354b85b90da224b146a589d16bd45c404f8da4b648a4a4a7bd4e0c63c2f9d8abe1a6a38f3939c12992b088e424bb14beb27229d8a067bc4c6aad6b'
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
