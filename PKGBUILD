# Maintainer: Emil Bay <archlinux@tixz.dk>
pkgname=nethermind-ethereum-bin
_pkgname=nethermind
pkgver=1.29.1
_pkgver=1.29.1
_commit=dfea5240
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
md5sums_x86_64=('21c58995d82163d62bf7ebb78ea5916e'
                'SKIP')
md5sums_aarch64=('a1bf10d2f3fbfe7077b08beea1953945'
                 'SKIP')
sha256sums_x86_64=('42550adf1b2ea6b623ca22e947e097d3e717f0db61015210cb80812025974fc0'
                   'SKIP')
sha256sums_aarch64=('7de2d847f08def0342f88b98697b4b98fffa30b7441d72bcc383199b69984e2a'
                    'SKIP')
b2sums_x86_64=('d6743af1f8fb3b12f18098552bd32b0fa22f655fe66dad8944380028c97846304dad664d135ab71f62b7efc786a89375fe54adaf8b11f9f78356fa51ad06134b'
               'SKIP')
b2sums_aarch64=('5c04eb05a6ecdc51760afd42fd53ebe40c227340e58b0729be6097e232892cb453900e93a262b9814bd935f3ddb495765625d766cac715fbbb2dc0efbc2f2948'
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
