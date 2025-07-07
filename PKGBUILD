# Maintainer: Emil Bay <archlinux@tixz.dk>
pkgname=nethermind-ethereum-bin
_pkgname=nethermind
pkgver=1.32.2
_pkgver=1.32.2
_commit=d3e7eb98
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
md5sums_x86_64=('cf17238dfd5ef028915a6b406043931c'
                'SKIP')
md5sums_aarch64=('7dfa5311388fe36007313564d096cb08'
                 'SKIP')
sha256sums_x86_64=('15dd912aee22a5eced182858456b4a4c84eb9966f375ad9cfd25a71b2f2ff29c'
                   'SKIP')
sha256sums_aarch64=('cf0d2cc1e72be30f3e1e3bd190a1c0224cec6a2832f6b7e2f7e7c8a0a9151545'
                    'SKIP')
b2sums_x86_64=('6acbc5d043048c7cb55fc492b5b389ae6e87478e4f9fc1300613c6f57f478a181f16010b20e3270bad794b6768765128083f64c1282e118c35e874c04b853f3d'
               'SKIP')
b2sums_aarch64=('c7f7d4fce752c7726b15b123c8d086f3120329b2379ef517f12cbbe11cb3eb1c05aeff2fff236bd4ca72b91ea3c5b7075d323233ca905b9d01422bc7fe28781d'
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
